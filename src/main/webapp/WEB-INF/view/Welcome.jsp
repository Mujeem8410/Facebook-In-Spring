<%@page import="com.eschool.dao.Wallpost.WDBHandler"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.ArrayList"%>

<%@ page
	import="java.util.ArrayList, com.eschool.model.Friends,com.eschool.model.Wallpost,
 com.eschool.model.User, com.eschool.dao.User.DBHandler,
 com.eschool.dao.Pro.Proimage,com.eschool.dao.Friends.FDBHandler"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/facebook.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/welcome.css">

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
<title>Facebook Home page</title>
</head>
<body style="background-color: rgb(235, 235, 235);">

	<jsp:include page="Navbar.jsp">
		<jsp:param name="title" value="Home" />
	</jsp:include>

	<%
	String email = (String) session.getAttribute("email");
	Proimage pi = new Proimage();
	String imagePath = pi.getProImage(email);
	DBHandler user1 = new DBHandler();
	User user2 = user1.checkUser(email);
	String name = user2.getName();

	FDBHandler fdb = new FDBHandler();
	List<Friends> Pfriends = new ArrayList<>();
	Pfriends = fdb.getPendingReq(email);
	List<String> friends = new ArrayList<>();
	friends = fdb.getFriend(email);
	WDBHandler wdbh = new WDBHandler();
	List<Wallpost> wallposts = new ArrayList<>();
	wallposts = wdbh.getWallpost(email);

	//DBHandler db = new DBHandler();
	//ArrayList<Friends> pfriends = (ArrayList<Friends>) request.getAttribute("pfriends");
	//ArrayList<String> friends = (ArrayList<String>) request.getAttribute("friends");
	//ArrayList<Wallpost> wallposts = (ArrayList<Wallpost>) request.getAttribute("wallpost");
	//ArrayList<vedio> vllposts = (ArrayList<vedio>) request.getAttribute("vllpost");
	%>

	<div class="container-fluid">
		<div class="row">

			<div class="col-md-3 col-12" style="background: white;">
				<h3>Pending Requests:</h3>

				<%
				for (Friends f : Pfriends) {
					User user = user1.checkUser(f.getSender());
					String femail = user.getEmail();
					Proimage pi1 = new Proimage();
					String imagePath1 = pi1.getProImage(femail);
					System.out.println(request.getContextPath());
				%>
				<div class="card mb-3" style="max-width: 300px;">
					<div class="row g-0">
						<div class="col-md-4 ">

							<img
								src="<%=request.getContextPath()%>/images/<%=femail%>/<%=imagePath1%>"
								alt="profile image" class="img-fluid rounded-start" alt="Image"
								style="object-fit: cover; object-position: top;">
						</div>
						<div class="col-md-8">
							<div class="card-body">
								<h5 class="card-title"><%=user.getName()%></h5>
								<p class="card-text">
									<a href="UpdateRequest?status=1&fid=<%=f.getFid()%>">Accept</a>&nbsp;&nbsp;
									<a href="UpdateRequest?status=2&fid=<%=f.getFid()%>">Reject</a>.
								</p>

							</div>
						</div>
					</div>
				</div>
				<%
				}
				%>
				<hr>
				<div class="vsidep">
					<img
						src="<%=request.getContextPath()%>/images/<%=email%>/<%=imagePath%>"
						alt="profile image" class="proimg1"
						style="width: 50px !important;"> <span
						style="display: inline; margin-left: 12px; color: black; font-weight: 700; color: red; font-size: 25px; margin-top: 10px !important;"
						class="name"> <%=name%> </spans></a> <br> <br> <a href="#"><i
							class="fa-solid fa-user-group"></i> Friends </a> <br> <br>
						<a href="#"><i class="fa-solid fa-clock"></i> &nbsp;Memories </a>
						<br> <br> <a href="#"><i
							class="fa-solid fa-bookmark"></i> &nbsp;&nbsp;Saved </a> <br> <br>
						<a href="#"><i class="fa-solid fa-group-arrows-rotate"></i>
							&nbsp;Group </a> <br> <br> <a href="#"><i
							class="fa-solid fa-tv"></i> Vedio </a> <br> <br> <a
						href="#"><i class="fa-solid fa-shop"></i> Marketplace </a> <br>
						<br> <a href="#"><i class="fa-solid fa-calendar-week"></i>
							&nbsp;Events </a> <br> <br> <a href="#"><i
							class="fa-solid fa-chart-simple mb-3"></i> &nbsp;Adds Manager </a> <br>
						<br> <a href="#"><i class="fa-solid fa-angle-down"></i>&nbsp;
							See More </a>
				</div>
			</div>


			<div class="col-md-6 col-12">
				<h2 class="text-center">Send Friend Request</h2>
				<form action="SendRequest" method="post" class="needs-validation"
					novalidate>
					<div class="mb-2">
						<input type="email" name="rec" class="form-control input"
							placeholder="Enter Rec Email" required>
					</div>
					<button type="submit" class="btn btn-primary">Send</button>
				</form>
				<p style="color: red;" class="text-center">
					<b>${message}</b>

				</p>

				<hr>
				<div style="margin-bottom: 1px;">
					<a> <img
						src="<%=request.getContextPath()%>/images/<%=email%>/<%=imagePath%>"
						alt="profile image" class="proimg1">
					</a>


					<!-- Button trigger modal -->
					<h3 class=" tag">
						What's in Your Mind ? <span style="color: red;"><%=name%></span>
					</h3>
					<button type="button" class="pmbtn" data-bs-toggle="modal"
						data-bs-target="#staticBackdrop"
						style="border: none; background: white;">
						<div class="mb-2">
							<input type="text" name="message" class="form-control input"
								placeholder="What's in your mind ? <%=name%>" required>
						</div>
					</button>
				</div>

				<!-- Modal -->
				<div class="modal fade" id="staticBackdrop"
					data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
					aria-labelledby="staticBackdropLabel" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<h1 class="modal-title fs-5" id="staticBackdropLabel"
									style="margin-left: auto;">
									<b>Create post</b>
								</h1>
								<button type="button" class="btn-close" data-bs-dismiss="modal"
									aria-label="Close"></button>
							</div>
							<div class="modal-body" style="height: 65vh;">
								<img
									src="<%=request.getContextPath()%>/images/<%=email%>/<%=imagePath%>"
									alt="profile image" class="proimg1"></a>
								<h5 class="tag1">
									What's in Your Mind ? <span style="color: red;"><%=name%></span>
								</h5>
								<form action="WallpostSave" method="post"
									enctype="multipart/form-data" class="needs-validation"
									novalidate class="needs-validation">
									<div class="mb-2">
										<textarea type="text" name="message" class=""
											placeholder="What's in your mind ?<%=name%>" rows="5"
											cols="52" required style="border: 0px white;"></textarea>
									</div>
									<div class="mb-2">



										<input type="file" name="file" accept="image/*"
											class="form-label" required>

										<!-- 	tooltip -->




										<!-- ----- -->
									</div>
									<div class="mb-2 tagdiv" style="width: 100%;">

										<b>Add to your post</b> <span class="Add-link"> <a
											href="#" style="color: lightgreen;"><i
												class="fa-regular fa-images"></i></a> <a href="#"
											style="color: blue;"><i class="fa-solid fa-user-tag"></i></a>
											<a href="#" style="color: yellow;"><i
												class="fa-regular fa-face-smile"></i></a> <a href="#"
											style="color: red;"><i class="fa-solid fa-location-dot"></i></a>
											<a href="#" style="color: aquamarine;"><i
												class="fa-solid fa-gifts"></i></a>


										</span>



									</div>

									<button type="submit" class="btn btn-primary sharebtn"
										style="width: 100%; margin-top: 5px;">Post</button>
								</form>


								<!-- Button trigger modal -->

							</div>

						</div>
					</div>
				</div>










				<div class="sicon">

					<a href="#"><i class="fa-solid fa-video" style="color: red;"></i>Live
						vedio</a> <a href="#"><i class="fa-regular fa-images"
						style="color: lightgreen;"></i>Photo/vedio</a> <a href="#"> <i
						class="fa-regular fa-face-smile" style="color: yellow;"></i>Feeling/activity
					</a>

				</div>



				<hr>

				<h3 class="text-center">Your Wall...</h3>
				<%
				for (Wallpost wpost : wallposts) {
					User user = user1.checkUser(wpost.getSender());
				%>
				<div class="card mb-3">
					<img
						src="<%=request.getContextPath()%>/images/Wallpost/<%=wpost.getImg()%>"
						class="card-img-top" alt="profile image"
						style="object-fit: cover; object-position: top;">
					<div class="card-body">
						<h4>
							@<%=user.getName()%></h4>
						<h5 class="card-title"><%=wpost.getMessage()%></h5>
						<p class="card-text"><%=wpost.getDop()%></p>
						<hr>
						<div class="likediv">
							<a href="#"><i class="fa-regular fa-thumbs-up"></i>Like</a> <a
								href="#"><i class="fa-regular fa-comment"></i>Comment</a> <a
								href="#"><i class="fa-brands fa-whatsapp"></i></i>Share</a>


						</div>
						<hr>
					</div>
				</div>

				<%
				}
				%>
				<p class="mb-5"></p>


			</div>


			<div class="col-md-3 col-12" style="background: white;">
				<h3>Friends:</h3>
				<%
				for (String sr : friends) {

					User user = user1.checkUser(sr);
					String femail = user.getEmail();
					Proimage pi1 = new Proimage();
					String imagePath1 = pi1.getProImage(femail);
				%>

				<div class="card  mb-1" style="max-width: 300px;">
					<div class="row g-0">
						<div class="col-md-4">
							<img
								src="<%=request.getContextPath()%>/images/<%=femail%>/<%=imagePath1%>"
								alt="profile image" class="img-fluid rounded-start "
								style="width: 100%; height: 100%; object-fit: cover;"
								alt="Image">
						</div>

						<div class="col-md-8">
							<div class="card-body">
								<h5 class="card-title"><%=user.getName()%></h5>
								<p class="card-text">
									<a href="Viewprofile?email=<%=sr%>"><%=user.getName()%></a>
								</p>

							</div>
						</div>
					</div>

				</div>

				<%
				}
				%>


			</div>
		</div>
		<script
			src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
			integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
			crossorigin="anonymous"></script>
		<script src="${pageContext.request.contextPath}/js/validation.js"></script>
</body>
</html>
