<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="java.util.ArrayList,java.util.List, com.eschool.model.Friends,com.eschool.model.Wallpost,
 com.eschool.model.User,com.eschool.dao.User.DBHandler,com.eschool.dao.vedio.VDBHandler,
 com.eschool.dao.Wallpost.WDBHandler,com.eschool.dao.Pro.Proimage,
 com.eschool.model.Gpost,com.eschool.model.CreateGrp,com.eschool.dao.Group.GPDBHandler,com.eschool.dao.Group.CGDBHandler"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Group Page | facebook</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/Group.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/Market.css">

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
</head>

<body>
	<jsp:include page="Navbar.jsp">
		<jsp:param name="title" value="Home" />
	</jsp:include>
	<div class="container-fluid">
		<div class="row">
			<div class="col-3 lp">
				<h4 class=" m-3 sp-top">
					Groups<span class="ms-5 ">
						<button class="gear-btn"
							style="border: none; border-radius: 50% !important; height: 39px !important; width: 39px !important; float: right !important;">
							<a href="#" class="mt-3"><i class="fa-solid fa-gear"></i> </a>
						</button>
					</span>
				</h4>
				<form>
					<div class="row">
						<div class="col">
							<input type="text" class="form-control src1"
								placeholder="Search Group" aria-label="First name">
						</div>
					</div>

				</form>


				<div class="lp1">
					<br> <a href="#"><i class="fa-regular fa-window-restore"></i>
						&nbsp;&nbsp;Your feed</a> <br> <br> <a href="#"><i
						class="fa-brands fa-discourse"></i> &nbsp;&nbsp;Discover </a> <br>
					<br> <a href="#"><i class="fa-solid fa-people-group"></i>&nbsp;&nbsp;Your
						groups</a><br> <br>
					<!-- Button trigger modal -->
					<button type="button" class="btn  mg-btn  ms-2 mt-5"
						data-bs-toggle="modal" data-bs-target="#staticBackdrop">
						+ Create New Group</button>
					<hr>
					<h6 class="m-3">Your Grops</h6>

					<%
					String email = (String) request.getSession().getAttribute("email");

					CGDBHandler db1 = new CGDBHandler();

					List<CreateGrp> list1 = db1.getGroups(email);

					for (CreateGrp post : list1) {

						if (post.getAdmin().equals(email)) {
					%>

					<h5 class="m-3" style="color: red;"><%=post.getGname()%></h5>
					<%
					}%>
						<hr>
					<% }
					%>




					<!-- Modal -->

					<div class="modal fade" id="staticBackdrop"
						data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
						aria-labelledby="staticBackdropLabel" aria-hidden="true">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<h1 class="modal-title fs-5" id="staticBackdropLabel">Create
										Group</h1>
									<button type="button" class="btn-close" data-bs-dismiss="modal"
										aria-label="Close"></button>
								</div>
								<div class="modal-body" style="height: 50vh;">
									<jsp:include page="Profile.jsp">
										<jsp:param name="title" value="Home" />
									</jsp:include>
									<h5 class=" tag">Create New Group</h5>
									<form action="CCreateGrp" method="POST"
										enctype="multipart/form-data" class="needs-validation"
										novalidate>
										<div class="mt-2 mb-2">
											<input type="text" class="form-control"
												placeholder="Group name" aria-label="First name"
												name="gname" required>

										</div>
										<div class="mt-2 mb-2">
											<select id="options" name="category" class="form-control"
												style="height: 50px">
												<option>Chose your privacy</option>
												<option value="private">Private</option>
												<option value="public">Public</option>

											</select>

										</div>

										<div class="modal-footer">

											<button type="submit" class="btn btn-primary sharebtn"
												style="width: 100%; margin-top: 5px;">Create</button>


										</div>
									</form>
								</div>
							</div>
						</div>




					</div>


				</div>


			</div>


			<div class="col-8 rp">
				<p>
					<button class="btn btn-primary mt-2" type="button"
						data-bs-toggle="collapse" data-bs-target="#collapseWidthExample"
						aria-expanded="false" aria-controls="collapseWidthExample">
						Add your post</button>
				</p>
				<div style="" class="mb-4">
					<div class="collapse collapse-horizontal" id="collapseWidthExample">
						<div class="card card-body" style="width: 500px;">
							<form action="CreateGrpPost" method="post"
								enctype="multipart/form-data" class="needs-validation"
								novalidate>
								<div class="mb-4">
									<input type="text" name="tagline" class="form-control"
										placeholder="Enter your tag line" required>
								</div>
								<select id="options" name="related" class="form-control mb-3"
									style="height: 40px" required>
									<option value="Knowledge">Select the Category</option>
									<option value="Knowledge">Knowledge</option>
									<option value="memes">Memes</option>
									<option value="skill">Skills</option>

								</select>


								<div class="mb-4">



									<input type="file" name="file" accept="image/*"
										class="form-label mb-2" required
										placeholder="Enter producrt picture" required>

									<!-- 	tooltip -->




									<!-- ----- -->
								</div>

								<button type="submit" class="btn btn-primary sharebtn"
									style="width: 100%; margin-top: 5px;">Share</button>
							</form>







						</div>
					</div>
				</div>

				<!--                    card -->
				<%
				GPDBHandler db2 = new GPDBHandler();
				List<Gpost> list2 =  db2.getGpost(email);
				
				for (Gpost post : list2) {
				%>


				<div class="card mb-3">
					<img
						src="<%=request.getContextPath()%>/images/Group/<%=post.getImg()%>"
						class="card-img-top" alt="Groupimages">
					<div class="likediv">
						<a href="#"><i class="fa-regular fa-thumbs-up"></i>Like</a> <a
							href="#"><i class="fa-regular fa-comment"></i>Comment</a> <a
							href="#"><i class="fa-brands fa-whatsapp"></i></i>Share</a>

					</div>
					<div class="card-body">
						<h5 class="card-title"><%=post.getTagline()%></h5>
						<p class="card-text"><%=post.getSender()%></p>
						<p class="card-text">
							<small class="text-body-secondary"><%=post.getRelaetd()%></small>
						</p>
					</div>
				</div>

				<%
				}
				%>
				<p>tempora possimus itaque suscipit odio quisquam iste porro, ea
					nobis impedit eligendi totam. Ea aliquid maxime quia voluptatibus
					veritatis aspernatur rem quo illum, eum dolor nam unde ut quaerat
					expedita quae doloremque, velit, excepturi ex at. Unde sint modi
					est, odit itaque ea, cumque aspernatur quas quasi ipsa magnam quos
					fuga praesentium eligendi voluptates. Aliquid incidunt impedit
					pariatur eaque doloribus tempore possimus ut commodi non doloremque
					totam autem quae corrupti eveniet similique vel, id aut voluptatum
					magnam nesciunt dolorum. Possimus, non vero. Laboriosam accusantium
					dolorem omnis velit saepe praesentium iusto.</p>
					
			</div>





		</div>
	</div>
</body>
</html>
