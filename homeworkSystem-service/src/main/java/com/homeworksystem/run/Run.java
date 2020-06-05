package com.homeworksystem.run;

import java.io.IOException;

import org.apache.log4j.Logger;
import org.springframework.context.support.ClassPathXmlApplicationContext;
/**
 * 启动程序
 *
 */
public class Run {

	public static void main(String[] args) throws IOException {
		@SuppressWarnings("resource")
		ClassPathXmlApplicationContext ioc=new ClassPathXmlApplicationContext("ApplicationContext.xml");
		ioc.start();
		Logger.getLogger(Run.class).info("------------------Service服务启动成功---------------------");
		System.in.read();
	}

}
