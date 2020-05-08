package com.homeworksystem.run;

import java.io.IOException;

import org.springframework.context.support.ClassPathXmlApplicationContext;
import com.homeworksystem.utilImp.DuplicateCheckingImp;
/**
 * 启动程序
 */
public class run {

	@SuppressWarnings("resource")
	public static void main(String[] args) throws IOException {
		ClassPathXmlApplicationContext provider=new ClassPathXmlApplicationContext("provider.xml");
		provider.start();
		//查重服务实现类
		DuplicateCheckingImp bean = provider.getBean(DuplicateCheckingImp.class);
		//将查重程序设置为该程序的守护线程
		Thread thread = new Thread(bean);
		thread.setDaemon(true);
		thread.start();
		System.out.println("------------------查重程序启动成功---------------");
		//阻塞
		System.in.read();
	}

}
