<%@page import="com.eschool.dao.vedio.VDBHandler"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="java.util.ArrayList,java.util.List, com.eschool.model.Friends,com.eschool.model.Wallpost,
 com.eschool.model.User,com.eschool.model.video,
  com.eschool.dao.User.DBHandler,
  com.eschool.dao.Wallpost.WDBHandler,com.eschool.dao.Pro.Proimage,com.eschool.dao.vedio.VDBHandler"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Vedio page</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/vpage.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/facebook.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
</head>
<body style="background-color: rgb(235, 235, 235);">
	<jsp:include page="Navbar.jsp">
		<jsp:param name="title" value="Home" />
	</jsp:include>

	<%
	String email = (String) session.getAttribute("email");
	DBHandler db = new DBHandler();
	VDBHandler vdb = new VDBHandler();
	List<video> vlposts = vdb.getVideoPosts(email);
	%>
	<div class="container-fluid">
		<div class="row">

			<div class=" col-sm-3 col-md-3 vsidep" style="background: white;">
				<a href="#" class="proimg1"
					style="text-decoration: none; margin-left: 6px;"> <%
 String email1 = (String) session.getAttribute("email");
 Proimage pi = new Proimage();
 String imagePath = pi.getProImage(email1);
 DBHandler user1 = new DBHandler();
 User user2 = user1.checkUser(email);
 String name = user2.getName();
 %> <img
					src="<%=request.getContextPath()%>/images/<%=email%>/<%=imagePath%>"
					alt="profile image" class="proimg1" style="width: 50px !important;">
					<span
					style="display: inline; margin-left: 12px; color: black; font-weight: 700; color: red; font-size: 25px; margin-top: 10px !important"
					class="name"> <%=name%> </spans></a> <br> <br> <a href="#"><i
					class="fa-solid fa-user-group"></i> Friends </a> <br> <br> <a
					href="#"><i class="fa-solid fa-clock"></i> &nbsp;Memories </a> <br>
				<br> <a href="#"><i class="fa-solid fa-bookmark"></i>
					&nbsp;&nbsp;Saved </a> <br> <br> <a href="#"><i
					class="fa-solid fa-group-arrows-rotate"></i> &nbsp;Group </a> <br>
				<br> <a href="#"><i class="fa-solid fa-tv"></i> Vedio </a> <br>
				<br> <a href="#"><i class="fa-solid fa-shop"></i>
					Marketplace </a> <br> <br> <a href="#"><i
					class="fa-solid fa-calendar-week"></i> &nbsp;Events </a> <br> <br>
				<a href="#"><i class="fa-solid fa-chart-simple"></i> &nbsp;Adds
					Manager </a> <br> <br> <a href="#"><i
					class="fa-solid fa-angle-down"></i>&nbsp; See More </a>


			</div>
			<div class="col-7 input" style="margin-left: 10vw;">
				<h2 class=" tag">Share Own Vedio</h2>
				<form action="Vediopostsave" method="post"
					enctype="multipart/form-data" class="needs-validation" novalidate>

					<div class="mb-2">
						<input type="file" name="file" accept="video/*"
							class="form-label custom-file-upload" required>
					</div>
					<button type="submit" class="btn btn-primary">Share</button>
				</form>

				<hr>
				<h3>Your Vedio...</h3>
				<%
				for (video vpost : vlposts) {
					User user = db.checkUser(vpost.getSender());
					System.out.println(vpost.getVname());
				%>
				<div class="card mb-3">
					<video controls class="card-img-top" height="400" width="320px"
						style="max-width: 100%; object-fit: contain;">
						<source
							src="<%=request.getContextPath()%>/images/vedioPost/<%=vpost.getVname()%>"
							type="video/mp4">
                    

					</video>
					<div class="card-body">
						<h4>
							@<%=user.getName()%></h4>
						<h5 class="card-title"><%=vpost.getSender()%></h5>
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
	</div>
	<script>
  
  const videos = document.querySelectorAll('video');

  videos.forEach(video => {
    video.addEventListener('play', () => {
    
      videos.forEach(otherVideo => {
       
        if (otherVideo !== video) {
          otherVideo.pause();
        }
      });
    });
  });
</script>


</body>
</html>