package com.homeworksystem.util;
/**
 * 
 * 查重服务
 */
public interface DuplicateChecking {
	/**
	 * 在后台自动运行查重程序。接收一个问题号，将其放入等待队列，在线程池有空闲时，分配一个
	 * 线程进行查重处理。该线程先调用Service服务器提供的服务从数据库中取出这个问题下已提交
	 * 的作业，利用算法进行查重，然后再利用service服务将重复度写回数据库。
	 * @param questionId
	 */
	public void check(Integer questionId) ;
	
}
