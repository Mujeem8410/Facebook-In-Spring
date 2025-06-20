<%@page import="com.mysql.cj.protocol.x.SyncFlushDeflaterOutputStream"%>
<%@page
	import="com.eschool.dao.Game.GDBHandler,com.eschool.model.Game"%>
<%@page import="java.util.ArrayList,java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Facebook |Gaming</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/Game.css">

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
</head>


<%
GDBHandler gdb = new GDBHandler();
List<Game> games = gdb.GamePost();
%>
<body style="background-color: rgb(235, 235, 235); overflow: hidden;">
	<jsp:include page="Navbar.jsp">
		<jsp:param name="title" value="Home" />
	</jsp:include>


	<div class="container-fluid" style="overflow: hidden">
		<div class="row mb-5 scrollable-row"
			style="overflow: scroll; scrollbar-width: thin;">


			<%
			for (Game game : games) {
			%>
			<div class=" col-lg-3 col-md-6 col-sm-12 mb-3 mt-2">
				<div class="card" style="width: 100%;">
					<img src="<%=request.getContextPath()%>/images/gimg/<%=game.getGimg()%>" class="card-img-top gimg"
						alt="..." height="200px">
					<div class="card-body">
						<h5 class="card-title"><%=game.getGname()%></h5>
					</div>
				</div>
			</div>
			<%
			}
			%>
		</div>
	</div>


</body>
</html>