package com.homeworksystem.util;
/**
 * 自动批改作业
 * 如果教师提交了参考答案，系统就会自动批改作业
 */
public interface AutomaticCorrection {
	
	public void correct(String questionId,String studentId);
	
	public void correct(String questionId);
	
}
