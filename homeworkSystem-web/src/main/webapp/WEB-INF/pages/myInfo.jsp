<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>我的信息</title>
<%
	pageContext.setAttribute("ctp", request.getContextPath());
%>
<link rel="stylesheet" type="text/css" href="${ctp}/css/myInfo.css">
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
					<a href="${ctp }/mainMenu/${info.type }/myCourse/${info.id}">返回主界面</a>

				</div>

				<div id="choice">				
					<h1>我的信息</h1>
				</div>

					<div id="cont">		
						<div id="c1">
						<form:form action="${ctp }/change/${info.type }" modelAttribute="info" method="post">
							<form:hidden path="id"/>
							<br/>学号/工号:${info.id}<br/>
							密码:<br/>
							<form:input path="passWord"/><form:errors path="passWord"/><br/>
							姓名:<br/>
							<form:input path="userName"/><form:errors path="userName"/><br/>
							性别:<br/>
							<form:input path="gender"/><form:errors path="gender"/><br/>
							<c:if test="${error!=null&&!error.equals(\"\")}">
								${error }<br/>
							</c:if>
							<button οnclick="this.form.submit()">更改</button>
							</form:form>
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