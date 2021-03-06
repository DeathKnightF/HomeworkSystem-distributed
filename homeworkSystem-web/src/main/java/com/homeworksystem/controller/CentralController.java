package com.homeworksystem.controller;


import javax.validation.Valid;

import org.apache.dubbo.config.annotation.Reference;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import com.homeworksystem.bean.Person;
import com.homeworksystem.bean.Student;
import com.homeworksystem.bean.Teacher;
import com.homeworksystem.service.StudentService;
import com.homeworksystem.service.TeacherService;

/**
 * 	
 * 	CentralController用于处理两类请求：
 *	1、请求既不被StudentController处理，也不被TeacherController处理（例如跳往登陆界面）
 *	2、学生和老师端都有类似请求（例如登陆、注册、查询个人信息等等）
 *	
 */
@Controller
public class CentralController {
	/**
	 * studentService用于对数据库进行增删改查学生信息
	 */
	@Reference(init = true,check = false)
	StudentService studentService;
	/**
	 * studentService用于对数据库进行增删改查教师信息
	 */
	@Reference(init = true,check = false)
	TeacherService teacherService;
	/**
	 * 日志
	 */
	private Logger logger=Logger.getLogger(CentralController.class);
	/**
	 * 前往登陆界面
	 * @return
	 */
	@RequestMapping("/toLogin")
	public ModelAndView toLogin() {
		ModelAndView mv=new ModelAndView("login");
		//用于登陆时校验输入是否符合规则，需要传入一个person对象
		mv.addObject("person", new Person(null,"","       ",null,null));
		return mv;
	}
	/**
	 * 处理登陆信息，校验注册信息的格式是否正确，登陆信息是否正确
	 * @param person
	 * @param result
	 * @return
	 */
	@RequestMapping("/login")
	public ModelAndView login(@Valid Person person,BindingResult result) {
		logger.info("登录信息："+person);
		ModelAndView mv=null;
		if(person.getGender()!=null&&!person.getGender().equals("")) {
			if(person.getGender().equals("男")||person.getGender().equals("女")) {
				
			}else {//性别格式错误
				logger.info("注册，性别错误");
				mv=new ModelAndView("login");
				mv.addObject("person", person);
				mv.addObject("error", "性别只能填男/女");
				return mv;
			}
		}
		if(result.hasErrors()) {
			//登录信息进行后端校验
			logger.info("登陆信息吧符合规定，效验失败");
			mv=new ModelAndView("login");
			mv.addObject("person", person);
			return mv;
		}else{
			//姓名不为空就认为是注册
			if(person.getUserName()!=null&&!person.getUserName().equals("")) {
				//注册
				if(person.getType().equals("student")) {
					//学生注册
					studentService.signUp(person.convertToStudent());
					mv=new ModelAndView("forward:mainMenu/student/myCourse/"+person.getId());
					logger.info("学生注册成功：学号"+person.getId());
				}else {
					//老师注册
					teacherService.signUp(person.convertToTeacher());
					mv=new ModelAndView("forward:mainMenu/teacher/myCourse/"+person.getId());
					logger.info("教师注册成功：工号"+person.getId());
				}
			}else if(person.getType().equals("student")) {
				//学生登录
				if(studentService.login(person.getId(), person.getPassWord())) {
					//密码正确
					mv=new ModelAndView("forward:mainMenu/student/myCourse/"+person.getId());
					logger.info("学生登陆成功：学号"+person.getId());
				}else{
					//密码错误
					mv=new ModelAndView("login");
					mv.addObject("person", person);
					mv.addObject("error", "用户名或密码错误");
					logger.info("学生登陆失败：学号"+person.getId());
				}
			}else {//教师登录
				if(teacherService.login(person.getId(), person.getPassWord())) {
					//密码正确
					mv=new ModelAndView("forward:mainMenu/teacher/myCourse/"+person.getId());
					logger.info("教师登陆成功：工号"+person.getId());
				}else{
					//密码错误
					mv=new ModelAndView("login");
					mv.addObject("person", person);
					mv.addObject("error", "用户名或密码错误");
					logger.info("教师登陆失败：工号"+person.getId());
				}
			}
			return mv;
		}
	}
	/**
	 * 跳转到我的信息页面
	 * @param type
	 * @param id
	 * @return
	 */
	@RequestMapping("/toMyInfoPage/{type}/{id}")
	public ModelAndView toMyInfoPage(@PathVariable("type") String type,@PathVariable("id") String id) {
		ModelAndView mv=new ModelAndView("myInfo");
		Person person=new Person();
		//先从数据库中找出对应人员的信息
		//然后转换成person，便于在页面展示
		if(type.equals("student")) {
			Student student = studentService.selectByStudentId(id);
			person = new Person(student);
		}else {
			Teacher teacher = teacherService.selectByTeacherId(id);
			person = new Person(teacher);
		}
		mv.addObject("info", person);
		return mv;
	}
	/**
	 * 更改个人信息
	 * @param person
	 * @param type
	 * @return
	 */
	@RequestMapping("/change/{type}")
	public ModelAndView change(@Valid Person person,
			BindingResult result, 
			@PathVariable("type") String type) {
		ModelAndView mv;
		logger.info("更改个人信息:"+person);
		if(person.getGender()!=null&&!person.getGender().equals("")) {
			if(!person.getGender().equals("男")&&!person.getGender().equals("女")) {
				//性别格式错误
				logger.info("更改失败，性别出错");
				mv=new ModelAndView("myInfo");
				mv.addObject("info", person);
				mv.addObject("error", "性别只能填男/女");
				return mv;
			}
		}
		//后端校验
		if(result.hasErrors()) {
			logger.info("更改信息失败，"+result.getFieldError());
			mv=new ModelAndView("myInfo");
			mv.addObject("info", person);
			mv.addObject("error","密码应在6-18位之间");
			return mv;
		}	
		mv=new ModelAndView("forward:../toMyInfoPage/"+person.getType()+"/"+person.getId());
		//写回数据库
		if(person.getType().equals("student")) {
			studentService.update(person.convertToStudent());
		}else {
			teacherService.update(person.convertToTeacher());
		}
		return mv;
	}
}
