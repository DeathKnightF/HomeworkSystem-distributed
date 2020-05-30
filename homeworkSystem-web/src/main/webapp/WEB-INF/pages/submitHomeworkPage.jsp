<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>提交作业</title>
<%
	pageContext.setAttribute("ctp", request.getContextPath());
%>
<link rel="stylesheet" type="text/css" href="${ctp}/css/submitHomeworkPage.css">
</head>
<body>
<!-- 教师 -->
<c:if test="${type==0}">
	<a href="${ctp }/toAssignQuestionPage/${id}/${courseId}"><button>返回</button></a>
	<p>${question.question}</p>
	<form action="${ctp }/answer/${id}/${courseId}/${questionId }" method="post">
		<!-- <input type="text" maxlength="1000" name="context"> -->
		<textarea id="area" name="answer" rows="40" cols="60">
			${question.answer}
		</textarea><br/>
		<button οnclick="this#area.submit()">提交</button>
	</form>
</c:if>

<!-- 学生 -->
<c:if test="${type!=0}">
	<a href="${ctp }/mainMenu/student/chooseQuestion/${id}"><button>返回</button></a>
	<p>${questionContext}</p>
	<form action="${ctp }/homework/${questionId}/${id}" method="post">
		<!-- <input type="text" maxlength="1000" name="context"> -->
		<textarea id="area" name="homeworkContext" rows="40" cols="60">
			${homeworkContext}
		</textarea><br/>
		<c:if test="${isLate==false}">
			<button οnclick="this#area.submit()">提交</button>
		</c:if>
		<c:if test="${isLate==true}">
			已截止，不能提交
		</c:if>
		<c:if test="${answer!=null}">
			<p>参考答案：</p>
				${answer }
		</c:if>
	</form>
</c:if>

</body>
</html>