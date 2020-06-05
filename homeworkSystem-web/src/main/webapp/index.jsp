<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HomeworkSystem</title>
	<link rel="stylesheet" type="text/css" href="css/welcomeStyle.css"  >
	<script type="text/javascript" src="jquery/jquery-3.4.1.min.js"></script>
<%
	pageContext.setAttribute("ctp", request.getContextPath());
%>
</head>
<body>
	
	
	<div class="container">
		<div class="welcome">
			<h1>Welcome!</h1>
		</div>
		<div class="box">
			<div class="imgBx">
				<img alt="" src="css/images/road.jpg">
			</div>
			<div class="content">
				<h3>简介</h3>
				<p>
					基于Spring、SpringMVC、Mybatis、dubbo、Tomcat、Zookeeper、ehcache制作的分布式作业管理系统。
				</p>
			</div>
		</div>
		<div class="box">
			<div class="imgBx">
				<img alt="" src="css/images/jungle.jpg">
			</div>
			<div class="content">
				<h3>功能</h3>
				<p>
					学生：更改信息、选课、查看题目、提交作业、查看成绩、查看参考答案。</br>
					教师：更改信息、开课、查看选课学生、布置作业、提交参考答案、批改作业。</br>
					系统：根据教师的参考答案自动批改作业、计算各个学生之间作业的重复度并在教师端显示。
				</p>
			</div>
		</div>
		<div class="box">
			<div class="imgBx">
				<img alt="" src="css/images/book.jpg">
			</div>
			<div class="content">
				<h3>分工</h3>
				<p>
					整个世界，因为有了阳光，城市有了生机;细小心灵，因为有了阳光，
					内心有了舒畅。明媚的金黄色，树丛间小影成像在叶片上泛有的点点破碎似的金灿，
					海面上直射反映留有的随波浪层层翻滚的碎片，为这大自然创造了美景，
					惹人醉的温馨之感，浓浓暖意中夹杂着的明朗与柔情，
					让雨过天晴后久违阳光的心灵重新得到了滋润!
				</p>
			</div>
		</div>
		<div class="login">
			<a href="toLogin"><h1>LOGIN</h1></a><br/>
		</div>
	</div>
</body>
</html>