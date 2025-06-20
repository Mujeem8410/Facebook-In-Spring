<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="s"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Validation in beans</title>
<style>
.errors {
	color: red;
}
</style>
</head>
<body>
	<s:form action="save" method="post" modelAttribute="user">
		<s:input path="email" placeholder="Enter your Email" />
		<br>
		<s:errors path="email" cssClass="errors" />
		<br>
		<s:input path="password" placeholder="Enter your Password" />
		<br>
		<s:errors path="password" cssClass="errors" />
		<br>
		<s:input path="name" placeholder="Enter your Name" />
		<br>
		<s:errors path="name" cssClass="errors" />
		<br>
		<s:input path="salary" placeholder="Enter your salary" />
		<br>
		<s:errors path="salary" cssClass="errors" />
		<br>
		<input type="submit" value="Submit">
		<br>
	</s:form>



</body>
</html>