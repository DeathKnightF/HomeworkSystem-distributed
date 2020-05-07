package com.homeworksystem.bean;

import java.io.Serializable;
import java.sql.Timestamp;
/**
 * 问题类
 *@param questionId 问题号
 *@param courseId 课程号
 *@param question 问题描述
 *@param outline 问题概述（学生端、教师端查看问题时，不是显示题目的全部内容，而是显示部分内容，一般是问题描述的前10个字符）
 *@param courseName 课程名
 *@param score 成绩（用于学生端显示该问题的成绩，教师端这个属性没有用）
 *@param deadline 截止时间，默认值 2038-1-1 0:0:0
 *@param isLate 是否过了截止日期
 *@param num 已经提交作业的学生人数
 *@param dupCheck 教师是否启动查重
 */
public class Question implements Serializable{
    
    /**
	 * 序列号
	 */
	private static final long serialVersionUID = 1L;

	/**
	 * 问题号
	 */
	private Integer questionId;

    /**
     * 课程号
     */
    private Integer courseId;

    /**
     * 问题描述
     */
    private String question;

    /**
     * 问题概述
     * （学生端、教师端查看问题时，不是显示题目的全部内容，而是显示部分内容，一般是问题描述的前10个字符）
     */
    private String outline;
    
    /**
     * 课程名
     */
    private String courseName;
    
    /**
     * 成绩（用于学生端显示该问题的成绩，教师端这个属性没有用）
     */
    private String score;
    
    /**
     * 截止时间，默认值 2038-1-1 0:0:0
     */
    private Timestamp deadline;
    /**
     * 是否过了截止日期
     */
    private Boolean isLate;
    
    /**
     * 已经提交作业的学生人数
     */
    private Integer num;
    /**
     * 教师是否启动查重
     */
    private Integer dupCheck;
    public Question() {
    	
    }
    /**
     * 
     * @param questionId
     * @param courseId
     * @param question
     * @param outline
     * @param courseName
     * @param score
     */
//	public Question(Integer questionId, Integer courseId, String question, String outline, String courseName,
//			String score) {
//		super();
//		this.questionId = questionId;
//		this.courseId = courseId;
//		this.question = question;
//		this.outline = outline;
//		this.courseName = courseName;
//		this.score = score;
////		this.deadline=Timestamp.valueOf("2038-1-1 0:0:0");
//	}
	/**
	 * 
	 * @param questionId
	 * @param courseId
	 * @param question
	 * @param outline
	 * @param courseName
	 * @param score
	 * @param deadline
	 */
	public Question(Integer questionId, Integer courseId, String question, String outline, String courseName,
			String score,Timestamp deadline) {
		super();
		this.questionId = questionId;
		this.courseId = courseId;
		this.question = question;
		this.outline = outline;
		this.courseName = courseName;
		this.score = score;
		this.deadline=deadline;
	}

	
	/**
	 * 
	 * @param questionId
	 * @param courseId
	 * @param question
	 * @param outline
	 * @param courseName
	 * @param score
	 * @param deadline
	 * @param isLate
	 * @param num
	 * @param dupCheck
	 */
	public Question(Integer questionId, Integer courseId, String question, String outline, String courseName,
			String score, Timestamp deadline, Boolean isLate, Integer num, Integer dupCheck) {
		super();
		this.questionId = questionId;
		this.courseId = courseId;
		this.question = question;
		this.outline = outline;
		this.courseName = courseName;
		this.score = score;
		this.deadline = deadline;
		this.isLate = isLate;
		this.num = num;
		this.dupCheck = dupCheck;
	}
	public Integer getQuestionId() {
        return questionId;
    }

    
    public void setQuestionId(Integer questionId) {
        this.questionId = questionId;
    }

   
    public Integer getCourseId() {
        return courseId;
    }

   
    public void setCourseId(Integer courseId) {
        this.courseId = courseId;
    }

    
    public String getQuestion() {
        return question;
    }

    
    public void setQuestion(String question) {
        this.question = question == null ? null : question.trim();
    }


	public String getOutline() {
		return outline;
	}


	public void setOutline(String outline) {
		this.outline = outline;
	}


	public String getCourseName() {
		return courseName;
	}


	public void setCourseName(String courseName) {
		this.courseName = courseName;
	}

	
	
	public String getScore() {
		return score;
	}


	public void setScore(String score) {
		this.score = score;
	}

	

	public Timestamp getDeadline() {
		return deadline;
	}

	public void setDeadline(Timestamp deadline) {
		this.deadline = deadline;
	}

	
	public Boolean getIsLate() {
		return isLate;
	}
	public void setIsLate(Boolean isLate) {
		this.isLate = isLate;
	}
	
	public Integer getNum() {
		return num;
	}
	public void setNum(Integer num) {
		this.num = num;
	}
	
	
	public Integer getDupCheck() {
		return dupCheck;
	}
	public void setDupCheck(Integer dupCheck) {
		this.dupCheck = dupCheck;
	}
	@Override
	public String toString() {
		return "Question [questionId=" + questionId + ", courseId=" + courseId + ", question=" + question + ", outline="
				+ outline + ", courseName=" + courseName + ", score=" + score + ", deadline=" + deadline + ", isLate="
				+ isLate + ", num=" + num + ", dupCheck=" + dupCheck + "]";
	}
	
	
	
}