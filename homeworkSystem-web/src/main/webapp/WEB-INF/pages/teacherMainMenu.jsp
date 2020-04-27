<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>教师界面</title>
<%
	pageContext.setAttribute("ctp", request.getContextPath());
%>
<link rel="stylesheet" type="text/css" href="${ctp }/css/teacherMainMenu.css">
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
					<a href="${ctp }/toMyInfoPage/teacher/${requestScope.id}">我的信息</a>
					<a href="${ctp }/mainMenu/teacher/myCourse/${requestScope.id}">我的课程</a>
					<a href="${ctp }/mainMenu/teacher/createCourse/${requestScope.id}">开设课程</a>
					<a href="${ctp }/mainMenu/teacher/assignQuestion/${requestScope.id}">布置作业</a>
					<a href="${ctp }/mainMenu/teacher/correctHomework/${requestScope.id}">批改作业</a>
					<a href="${ctp }/toLogin">注销登录</a><br/>
				</div>
	<!-- 以下所有的if语句，有且只有一个会在页面上展示 -->
				<div id="cont">	
					<c:if test="${page.equals(\"myCourse\") }">
						<br/><h2>我的课程</h2><br/>
						<table border="1" >
							<tr>
								<th>操作</th>
								<th>课程号</th>
								<th>课程名</th>
								<th>选课人数</th>
							</tr>
							<c:forEach items="${requestScope.allTheCourses}" var="cou">
								<tr>
									<td>
										<a  onclick="alert('关闭成功！')" href="${ctp }/closeCourse/${requestScope.id}/${cou.courseId}">
											关闭课程
										</a>
									</td>
									<td>${cou.courseId}</td>
									<td>${cou.courseName }</td>
									<td>${cou.num==null?0:cou.num }</td>
								</tr>
							</c:forEach>
						</table><br/>
					</c:if>
					
					<c:if test="${page.equals(\"createCourse\") }">
						<br/><h2>我的课程</h2><br/>
						<table border="1" >
							<tr>
								<th>操作</th>
								<th>课程号</th>
								<th>课程名</th>
								<th>选课人数</th>
								<th>操作</th>
								
							</tr>
							<c:forEach items="${requestScope.allTheCourses}" var="cou">
								<tr>
									<td>
										<a  onclick="alert('关闭成功！')" href="${ctp }/closeCourse/${requestScope.id}/${cou.courseId}">
											关闭课程
										</a>
									</td>
									<td>${cou.courseId}</td>
									<td>${cou.courseName }</td>
									<td>${cou.num==null?0:cou.num }</td>
									<td>
										<a  href="${ctp }/toAssignQuestionPage/${requestScope.id}/${cou.courseId}">
											布置作业/批改作业
										</a>
									</td>
									
								</tr>
							</c:forEach>
						</table><br/>
						<h3><img src="${ctp }/css/images/30.jpg"> 开设新课程</h3><br/>
						<form action="${ctp }/createCourse/${id}" method="post">
							课程名：<input name="courseName">
							<button onclick="this.form.submit()">提交</button>
						</form>
					</c:if>
					
					<c:if test="${page.equals(\"assignQuestion\") }">
						<br/><h2>我的课程</h2><br/>
						<table border="1" >
							<tr>
								<th>课程号</th>
								<th>课程名</th>
								<th>选课人数</th>
								<th>操作</th>
							</tr>
							<c:forEach items="${requestScope.allTheCourses}" var="cou">
								<tr>
									<td>${cou.courseId}</td>
									<td>${cou.courseName }</td>
									<td>${cou.num==null?0:cou.num }</td>
									<td>
										<a  href="${ctp }/toAssignQuestionPage/${requestScope.id}/${cou.courseId}">
											布置作业
										</a>
									</td>
								</tr>
							</c:forEach>
						</table><br/>
					</c:if>
					
					<c:if test="${page.equals(\"correctHomework\") }">
						<br/><h2>我的课程</h2><br/>
						<table border="1" >
							<tr>
								<th>课程号</th>
								<th>课程名</th>
								<th>选课人数</th>
								<th>操作</th>
							</tr>
							<c:forEach items="${requestScope.allTheCourses}" var="cou">
								<tr>
									<td>${cou.courseId}</td>
									<td>${cou.courseName }</td>
									<td>${cou.num==null?0:cou.num }</td>
									<td>
										<a  href="${ctp }/toAssignQuestionPage/${requestScope.id}/${cou.courseId}">
											批改作业
										</a>
									</td>
								</tr>
							</c:forEach>
						</table><br/>
					</c:if>
				</div>
			</div>
		</div>
		<div id="footer">	
				<a href="#" target="_blank">设计背景</a> | <a href="#" target="_blank">设计人员</a> | <a href="#" target="_blank">设计目的</a> | <a target="_blank" href="#">使用说明</a> | <a href="#" target="_blank">提供意见</a>		
		</div>
	</div>
	
</body>
</html>