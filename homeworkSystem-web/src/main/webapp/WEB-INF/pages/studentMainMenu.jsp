<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isErrorPage="true"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>学生界面</title>
<%
	pageContext.setAttribute("ctp", request.getContextPath());
%>
<link rel="stylesheet" type="text/css" href="${ctp }/css/studentMainMenu.css">
</head>
<body>
		<div id="container">
		<div id="header"></div>
		<div id="main">
			<div id="aside">
				<div id="block1"></div>
				<div id="block2"></div>
				<div id="block3"></div>
				<div id="block4"></div>
				<div id="block5"></div>
			</div>
			<div id="content">
				<div id="leading">
					<h1>欢迎使用作业管理系统  </h1>
				</div>
				<div id="choice">
					<a href="${ctp }/toMyInfoPage/student/${requestScope.id}">我的信息</a>
					<a href="${ctp }/mainMenu/student/myCourse/${requestScope.id}">我的课程</a>
					<a href="${ctp }/mainMenu/student/chooseCourse/${requestScope.id}">在线选课</a>
					<a href="${ctp }/mainMenu/student/chooseQuestion/${requestScope.id}">提交作业</a>
					<a href="${ctp }/toLogin">注销登录</a><br/>
					<!-- 以下所有的if语句，有且只有一个会在页面上展示 -->
					</div>
				<div id="cont">	
					<c:if test="${page.equals(\"myCourse\") }">
						<br/><h2>我的课程</h2><br/>
						<table border="1" >
							<tr>
								<th>课程号</th>
								<th>课程名</th>
								<th>教师</th>
								<th>操作</th>
							</tr>
							<c:forEach items="${requestScope.myCourses}" var="cou">
								<tr>
									<td>${cou.courseId}</td>
									<td>${cou.courseName }</td>
									<td>${cou.teacherName }</td>
									<td>
										<a  onclick="alert('退选成功！')"  href="${ctp }/unchoose/${requestScope.id}/${cou.courseId}">退选</a>
									</td>
								</tr>
							</c:forEach>
						</table><br/>
					</c:if>
					
					<c:if test="${page.equals(\"chooseQuestion\")}">
						
						<br/><h2><img src="${ctp }/css/images/92.jpg">老师布置的作业</h2><br/>
						<table border="1">
							<tr>
								<th>课程名</th>
								<th>问题号</th>
								<th>问题概述</th>
								<th>截止日期</th>
								<th>成绩</th>
								<th>操作</th>
							</tr>
							
							<c:forEach items="${requestScope.allTheQuestions}" var="que">
								<tr>
									<td>${que.courseName}</td>
									<td>${que.questionId }</td>
									<td>${que.outline }</td>
									<td>${que.deadline }</td>
									<td>${que.score}</td>
									<td>
										<c:if test="${que.isLate }">
											<a href="${ctp }/chooseQuestion/${requestScope.id}/${que.questionId}">
												已截止
											</a>
										</c:if>
										<c:if test="${!que.isLate }">
											<a href="${ctp }/chooseQuestion/${requestScope.id}/${que.questionId}">
												选择
											</a>
										</c:if>
									</td>
								</tr>
							</c:forEach>
						</table><br/>
					</c:if>

					<c:if test="${page.equals(\"chooseCourse\") }">
						<br/><h2>欢迎使用选课功能</h2><br/>
						<h3>全校课程如下：</h3><br/>
						<table border="1" >
							<tr>
								<th>课程号</th>
								<th>课程名</th>
								<th>教师</th>
								<th>选课人数</th>
								<th>操作</th>
							</tr>
							<c:forEach items="${requestScope.allTheCourses}" var="cou">
								<tr>
									<td>${cou.courseId}</td>
									<td>${cou.courseName }</td>
									<td>${cou.teacherName }</td>
									<td>${cou.num==null?0:cou.num }</td>
									<td>
										<a  onclick="alert('选课成功！')" href="${ctp }/choose/${requestScope.id}/${cou.courseId}">选择</a>
									</td>
								</tr>
							</c:forEach>
						</table><br/><br/>

				<div id="t2">					
						<br/><h3>我的课程</h3><br/>
						<table border="1" >
							<tr>
								<th>课程号</th>
								<th>课程名</th>
								<th>教师</th>
								<th>操作</th>
							</tr>
							<c:forEach items="${requestScope.myCourses}" var="cou">
								<tr>
									<td>${cou.courseId}</td>
									<td>${cou.courseName }</td>
									<td>${cou.teacherName }</td>
									<td>
										<a  onclick="alert('退选成功！')"  href="${ctp }/unchoose/${requestScope.id}/${cou.courseId}">退选</a>
									</td>
								</tr>
							</c:forEach>
						</table><br/>
					</c:if>
				</div>
					

					
					</div>
				</div>
		
		</div>
		<div id="footer">	
			<a href="#" target="_blank">设计背景</a> | <a href="#" target="_blank">设计人员</a> | <a href="#" target="_blank">设计目的</a> | <a target="_blank" href="#">使用说明</a> | <a href="#" target="_blank">提供意见</a>		
		</div>
	</div>
</body>
</html>