package com.homeworksystem.run;

import java.io.IOException;
import org.apache.log4j.Logger;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import com.homeworksystem.utilImp.AutomaticCorrectionImp;
import com.homeworksystem.utilImp.DuplicateCheckingImp;
/**
 * 启动程序
 */
public class Run {

	@SuppressWarnings("resource")
	public static void main(String[] args) throws IOException {
		ClassPathXmlApplicationContext provider=new ClassPathXmlApplicationContext("provider.xml");
		provider.start();
		//查重服务实现类
		DuplicateCheckingImp bean = provider.getBean(DuplicateCheckingImp.class);
		//将查重程序设置为该程序的守护线程
		AutomaticCorrectionImp bean2 = provider.getBean(AutomaticCorrectionImp.class);
		Thread thread = new Thread(bean);
		thread.setDaemon(true);
		thread.start();
		Logger.getLogger(Run.class).info("------------------查重程序启动成功---------------");
		Thread thread2 = new Thread(bean2);
		thread2.setDaemon(true);
		thread2.start();
		Logger.getLogger(Run.class).info("------------------自动判题程序启动---------------");
		//阻塞
		System.in.read();
	}

}
