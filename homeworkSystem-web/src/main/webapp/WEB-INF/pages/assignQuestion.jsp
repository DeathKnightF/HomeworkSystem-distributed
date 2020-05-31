<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>布置作业</title>
<%
	pageContext.setAttribute("ctp", request.getContextPath());
%>
<link rel="stylesheet" type="text/css" href="${ctp }/css/assignQuestion.css">
</head>
<body>
<div class="div-box">
<div class="top">
<a href="${ctp }/mainMenu/teacher/myCourse/${teacherId}"><button>返回主界面</button></a>
</div>
<div class="bottom" >
<h1>布置作业</h1>
<form action="${ctp }/newQuestion/${teacherId}/${courseId}" method="post">
	作业题目：
	<textarea name="questionContext" rows="4" cols="120" wrap="soft"></textarea><br/>
	截止时间：<br/><select	 name="year">
				<c:forEach items="${year}" var="y">
					<option value="${y }">${y }</option>
				</c:forEach>
			</select>年
			<select	 name="month">
				<c:forEach items="${month}" var="m">
					<option value="${m }">${m }</option>
				</c:forEach>
			</select>月
			<select	 name="day">
				<c:forEach items="${day}" var="d">
					<option value="${d }">${d }</option>
				</c:forEach>
			</select>日
			<select	 name="hour">
				<c:forEach items="${hour}" var="h">
					<option value="${h }">${h }</option>
				</c:forEach>
			</select>时
	<button onclick="this.form.submit()">提交</button>
</form>
</div>
<br/><br/>
<div  class="left">
<h1>我布置过的作业</h1>
<table border="1" class="1" >
	<tr>
		<th>问题编号</th>
		<th>题目</th>
		<th>截止日期</th>
		<th>操作</th>
		<th>已提交</th>
		<th>查重</th>
		<th>参考答案</th>
		<th>操作</th>
	</tr>
	<c:forEach items="${requestScope.allTheQuestions}" var="que">
		<tr>
			<td>${que.questionId}</td>
			<td>${que.outline }</td>
			<td>${que.deadline }</td>
			<td>
				<a  onclick="alert('成功取消本次作业！')" href="${ctp }/deleteQuestion/${requestScope.teacherId}/${courseId }/${que.questionId}">
					删除
				</a>
			</td>
			<td>${que.num }</td>
			<td>
				<c:if test="${que.dupCheck==0 }">
					<a onclick="alert('查重启动，正在后台计算重复度')" href="${ctp }/duplicateChecking/true/${requestScope.teacherId}/${courseId }/${que.questionId}">
						未启动
					</a>
				</c:if>
				
				<c:if test="${que.dupCheck==1 }">
					<a onclick="alert('查重关闭')" href="${ctp }/duplicateChecking/false/${requestScope.teacherId}/${courseId }/${que.questionId}">
						已启动
					</a>
				</c:if>
			</td>
			<td>
				<a href="${ctp }/toSubmitAnswer/${requestScope.teacherId}/${courseId }/${que.questionId}">提交答案</a>
			</td>
			<td>
				<c:if test="${que.num==0}">
					无数据
				</c:if>
				<c:if test="${que.num!=0}">
					<a  href="${ctp }/toCorrectHomeworkPage/${requestScope.teacherId}/${courseId}/${que.questionId}">
						批改
					</a>
				</c:if>
			</td>
		</tr>
	</c:forEach>
</table>
</div>
<br/><br/>
<div  class="right">
<h1>选这门课的学生</h1>
<table border="1" class="2" >
	<tr>
		<th>学号</th>
		<th>姓名</th>
		<th>性别</th>
	</tr>
	<c:forEach items="${requestScope.allTheStudents}" var="stu">
		<tr>
			<td>${stu.studentId}</td>
			<td>${stu.userName }</td>
			<td>${stu.gender }</td>
		</tr>
	</c:forEach>
</table>
</div>
</div>
</body>
</html>