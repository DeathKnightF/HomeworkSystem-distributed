package com.homeworksystem.run;

import java.io.IOException;
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
		System.out.println("------------------Service服务启动成功---------------------");
		System.in.read();
	}

}
