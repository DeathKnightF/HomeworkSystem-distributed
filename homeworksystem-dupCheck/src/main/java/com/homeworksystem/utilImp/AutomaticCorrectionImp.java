package com.homeworksystem.utilImp;
import java.util.List;
import java.util.concurrent.ConcurrentLinkedQueue;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.homeworksystem.bean.Homework;
import com.homeworksystem.bean.Question;
import com.homeworksystem.service.HomeworkService;
import com.homeworksystem.service.QuestionService;
import com.homeworksystem.util.AutomaticCorrection;
@Service
public class AutomaticCorrectionImp implements AutomaticCorrection,Runnable{

	/**
	 * 待处理队列，存放questionId
	 */
	private ConcurrentLinkedQueue<String> waitList;
	/**
	 * 线程池，用于执行查重任务
	 */
	private ExecutorService threadPool;
	/**
	 * 获取Service服务
	 */
//	@Reference(init = true,check = false)
	@Autowired
	private HomeworkService homeworkService;
	@Autowired
	private QuestionService questionService;
	/**
	 * 日志
	 */
	private static Logger logger = Logger.getLogger(AutomaticCorrectionImp.class); 
	/**
	 * 初始化
	 */
	public AutomaticCorrectionImp() {
		waitList=new ConcurrentLinkedQueue<String>();
		threadPool=Executors.newFixedThreadPool(3);
	}
	/**
	 * 实现接口方法
	 */
	@Override
	public void correct(String questionId,String studentId) {
		waitList.add(questionId+" "+studentId);
		logger.info("作业号：("+questionId+" "+studentId+")进入等待自动批改等待队列");
	}
	/**
	 * 实现接口方法
	 */
	@Override
	public void correct(String questionId) {
		waitList.add(questionId);
		logger.info("问题号：("+questionId+")进入等待自动批改等待队列");
	}
	/**
	 * 不断从待执行队列中拿出作业号，交由线程池执行
	 */
	@Override
	public void run() {
		logger.info((homeworkService!=null&&questionService!=null)?"service正常工作":"service不正常");
		while(true) {
			if(waitList.isEmpty()) {
				Thread.yield();
				continue;
			}
			//从待执行队列中拿出问题号
			String id = waitList.poll();
			if(id.contains(" ")) {
				String[] datas=id.split(" ");
				Homework homework = homeworkService.selectByPrimaryKey(datas[0],datas[1]);
				//从数据库中获取这个问题，为了获取它的参考答案
				Question question = questionService.selectByQuestionId(Integer.parseInt(datas[0]));
				if(question.getAnswer()==null||question.getAnswer().trim().equals(""))
					continue;//老师尚未提交参考答案，或者参考答案为空
				//交由线程池执行
				threadPool.execute(new Task(homework,question));
			}else {//id不含空格就是只有问题号
				//从数据库中拿出这个问题下所有作业
				List<Homework> homeworks = homeworkService.selectByQuestionId(id);
				//从数据库中获取这个问题，为了获取它的参考答案
				Question question = questionService.selectByQuestionId(Integer.parseInt(id));
				if(question.getAnswer()==null||question.getAnswer().trim().equals(""))
					continue;//老师尚未提交参考答案，或者参考答案为空
				//交由线程池执行
				threadPool.execute(new Task(homeworks,question));
			}
		}
	}
	/**
	 * 
	 *	任务
	 *	传入作业，成绩写回数据库
	 */
	class Task implements Runnable{
		private List<Homework> homeworks;
		private Question question;
		private Homework homework;
		public Task(List<Homework> homeworks,Question question) {
			this.homeworks=homeworks;
			this.question=question;
		}
		
		public Task(Homework homework,Question question) {
			this.homework=homework;
			this.question=question;
		}
		public void run() {
			if(homeworks==null&&homework==null) {
				logger.info("问题号为:"+question.getQuestionId()+",没有作业提交");
				return;
			}
			if(homeworks!=null) {
				for(Homework h1:homeworks)
					correct(h1,question);
				//放回数据库
				homeworkService.updateScore(homeworks);
				logger.info("问题号为:"+question.getQuestionId()+"下的所有作业批改成功，并成功写回数据库");
			}else {
				correct(homework,question);
				homeworkService.updateScore(""+homework.getQuestionId(),
						homework.getStudentId(), ""+homework.getScore());
				logger.info("作业号为:("+homework.getStudentId()+","+homework.getQuestionId()+")批改成功，并写回数据库");
			}
			
		}
		/**
		 * 批改
		 */
		private void correct(Homework h1,Question h2) {
			int longestCommonSubsequence = longestCommonSubsequence(h1.getHomework(), h2.getAnswer());
			int rate = longestCommonSubsequence*200/(h1.getHomework().length()+h2.getAnswer().length());
			h1.setScore(rate);
		}
		/**
		 * 算法
		 * @param text1
		 * @param text2
		 * @return
		 */
		private int longestCommonSubsequence(String text1, String text2) {
	        int[][] dp=new int[text1.length()+1][text2.length()+1];
	        for(int i=1;i<=text1.length();i++)
	            for(int j=1;j<=text2.length();j++)
	                if(text1.charAt(i-1)==text2.charAt(j-1))
	                    dp[i][j]=dp[i-1][j-1]+1;
	                else
	                    dp[i][j]=Math.max(dp[i-1][j],dp[i][j-1]);
	        return dp[text1.length()][text2.length()];
	    }
	}
	

}
