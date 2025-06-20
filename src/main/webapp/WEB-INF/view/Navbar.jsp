<%@page import="org.hibernate.internal.build.AllowSysOut"%>
<%@page
	import="com.eschool.dao.Pro.Proimage,com.eschool.dao.User.DBHandler,com.eschool.model.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Facebook Navbar</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/Navbar.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css"
	integrity="sha512-Kc323vGBEqzTmouAECnVceyQqyqdsSiqLQISBL29aUW4U/M7pSPA/gEUZQqv1cwx4OnYxTxve5UMg5GT6L4JJg=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>
<body>
	<nav class="navbar navbar-expand-lg bg-body-tertiary">
		<div class="container-fluid secdiv"
			style="height: 65px; color: blue; overflow: hidden;">
			<a class="navbar-brand" href="#"><i
				class="fa-brands fa-facebook fc-i"></i></a>

			<button class="srch" type="button" data-bs-toggle="offcanvas"
				data-bs-target="#offcanvasScrolling"
				aria-controls="offcanvasScrolling">
				<a><i class="fa-solid fa-magnifying-glass"></i></a>
			</button>




			<!-- Collapse content -->
			<div class="collapse navbar-collapse cust"
				id="navbarSupportedContent">
				<ul class="navbar-nav me-auto mb-2 mb-lg-0">
					<li class="nav-item"><a class="nav-link" aria-current="page"
						href="${pageContext.request.contextPath}/profile"> <i class="fa-solid fa-house"></i>
					</a></li>
					<li class="nav-item" style="color: black;"><a class="nav-link"
						href="${pageContext.request.contextPath}/Vedio"><i class="fa-solid fa-tv"></i></a></li>
					<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/Market"><i
							class="fa-solid fa-shop"></i></a></li>
					<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/Group"><i
							class="fa-solid fa-user-group"></i></a></li>
					<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/Game"><i
							class="fa-solid fa-gamepad"></i></a></li>
				</ul>
			</div>

			<!-- Keep these on small screens -->
			<button class="srch-r srch">
				<a><i class="fa-solid fa-bars"></i></a>
			</button>
			<button class="srch-r">
				<a><i class="fa-solid fa-message"></i></a>
			</button>
			<button class="srch-r">
				<a><i class="fa-solid fa-bell"></i></a>
			</button>
			<%
			String email = (String) session.getAttribute("email");
			String propic;
		    System.out.println(email+ "navbarpage");
			Proimage pi = new Proimage();
			String imagePath = pi.getProImage(email);
			if(imagePath=="dummyboy.png"){
				 propic="images/dummyboy.png"; 
			}
			else if(imagePath=="dummygirl.png"){
				 propic="images/dummygirl.png"; 
				
			}
			else{
				propic = request.getContextPath()+"/images/"+email+ "/"+imagePath;
			}
		    System.out.println(imagePath);
			DBHandler user1 = new DBHandler();
			User user2 = user1.checkUser(email);
			String name = user2.getName();
			%>
			<button type="button" class="btn modalbtn" data-bs-toggle="modal"
				data-bs-target="#exampleModal">
				<a><img
					src="<%=propic%>"
					alt="profile image" class="proimg1"></a>
			</button>

			<!-- Modal -->
			<div class="modal fade" id="exampleModal" tabindex="-1"
				aria-labelledby="exampleModalLabel" aria-hidden="true">
				<div class="modal-dialog ">
					<div class="modal-content">
						<div class="modal-header">
							<h1 class="modal-title fs-5" id="exampleModalLabel">Set
								profile images</h1>
							<button type="button" class="btn-close" data-bs-dismiss="modal"
								aria-label="Close"></button>
						</div>
						<div class="modal-body">
							 <h4 class="proname"
								style="display: flex; margin-left: auto; color: red; align-items: center; margin-bottom: 15px; justify-content: center;"><%=name%></h4>
							<form action="SetProfile_image" method="post"
								enctype="multipart/form-data" class="text-center form-control">
								<input type="file" name="file" accept="image/*"
									class="form-label" required> <br> <input
									type="submit" value="Save"
									class="btn btn-success text-center mt-2">
							</form>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary"
								data-bs-dismiss="modal">Close</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</nav>

	<div>





		<div class="offcanvas offcanvas-start" data-bs-scroll="true"
			data-bs-backdrop="false" tabindex="-1" id="offcanvasScrolling"
			aria-labelledby="offcanvasScrollingLabel">
			<div class="offcanvas-header">
				<h5 class="offcanvas-title" id="offcanvasScrollingLabel">Search
					Here</h5>
				<button type="button" class="btn-close text-reset"
					data-bs-dismiss="offcanvas" aria-label="Close"></button>
			</div>
			<div class="offcanvas-body smbody">

				<nav class="navbar navbar-light bg-light">
					<div class="container-fluid srchform">
						<form class="d-flex">
							<input class="form-control me-2 sinput" type="search"
								placeholder="Search" aria-label="Search">
							<button class="btn btn-outline-success sbtn" type="submit">Search</button>
						</form>
					</div>
				</nav>
			</div>

		</div>
	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
		crossorigin="anonymous"></script>
</body>
</html>




