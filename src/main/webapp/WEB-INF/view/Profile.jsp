<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="java.util.ArrayList, com.eschool.model.Friends,com.eschool.model.Wallpost,
 com.eschool.model.User,com.eschool.dao.User.DBHandler,com.eschool.dao.vedio.VDBHandler,
 com.eschool.dao.Wallpost.WDBHandler,com.eschool.dao.Pro.Proimage"%>
<!DOCTYPE html>
<html>
<head>
<style>
.proimg1 {
	display: inline-block;
	border-radius: 50%;
	height: 50px;
	width: 50px;
	margin-bottom: 1vh;
}

.tag {
	margin-left: 1vw;
	display: inline-block;
}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	String email = (String) session.getAttribute("email");

	Proimage pi = new Proimage();
	String imagePath = pi.getProImage(email);
	DBHandler user1 = new DBHandler();
	User user2 = user1.checkUser(email);
	String name = user2.getName();
	%>
	<img
		src="<%=request.getContextPath()%>/images/<%=email%>/<%=imagePath%>"
		alt="profile image" class="proimg1">
	<h5 class=" tag">
		<span style="color: red;"><%=name%></span>
	</h5>


</body>
</html>