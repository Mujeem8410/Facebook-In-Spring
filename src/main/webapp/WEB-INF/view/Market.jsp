<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="java.util.ArrayList,java.util.List, com.eschool.model.Mkt,com.eschool.dao.market.MDBHandler"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Market Page</title>
<link href="Market.css" rel="stylesheet">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/Market.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
</head>

<body>


	<%
	String email = (String) session.getAttribute("email");
	MDBHandler mdb= new MDBHandler();
	List<Mkt> m = mdb.getMarketPosts();
	%>
	<jsp:include page="Navbar.jsp">
		<jsp:param name="title" value="Home" />
	</jsp:include>
	<div class="container-fluid">
		<div class="row">
			<div class="col-3 lp">
				<h4 class=" m-3 sp-top">
					Marketplace<span class="ms-5 ">
						<button class="gear-btn"
							style="border: none; border-radius: 50% !important; height: 39px !important; width: 39px !important; float: right !important;">
							<a href="#" class="mt-3"><i class="fa-solid fa-gear"></i>
						</button> </a>
					</span>
				</h4>
				<form class="needs-validation">
					<div class="row">
						<div class="col">
							<input type="text" class="form-control src1"
								placeholder="Search Here" aria-label="First name">
						</div>
					</div>

				</form>


				<div class="lp1">
					<br> <a href="#"><i class="fa-brands fa-chrome"></i>
						&nbsp;&nbsp;Browse all </a> <br> <br> <a href="#"><i
						class="fa-regular fa-bell"></i> &nbsp;&nbsp;Notification </a> <br>
					<br> <a href="#"><i class="fa-solid fa-inbox"></i>&nbsp;&nbsp;inbox</a><br>
					<br> <a href="#"><i
						class="fa-solid fa-triangle-exclamation"></i> Marketplace access</a> <br>
					<br> <a href="#"><i class="fa-solid fa-cart-shopping"></i>
						&nbsp;Buying </a> <br> <br> <a href="#"><i class="fa-brands fa-sellsy"></i> &nbsp;Selling </a> <br>
					<br> <a href="#"><i class="fa-solid fa-angle-down"></i>&nbsp;
						See More </a>

				</div>


			</div>
			<div class="col-8 rp">
				<h4>Today's pick</h4>
				<br>
				<!-- Button trigger modal -->
				<button type="button" class="btn btn-primary" data-bs-toggle="modal"
					data-bs-target="#staticBackdrop">Add Product</button>

				<!-- Modal -->
				<div class="modal fade" id="staticBackdrop"
					data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
					aria-labelledby="staticBackdropLabel" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<h1 class="modal-title fs-5" id="staticBackdropLabel">Add
									own product which you want sell</h1>
								<button type="button" class="btn-close" data-bs-dismiss="modal"
									aria-label="Close"></button>
							</div>
							<div class="modal-body">

								<form action="market" method="post" class="needs-validation"
									enctype="multipart/form-data" class="needs-validation"
									novalidate>
									<div class="mb-4">
										<input type="text" name="pname" class="form-control"
											placeholder="Enter your Product name" required></input>
									</div>
									<div class="mb-4">
										<input type="text" name="price" class="form-control mb-2"
											placeholder="Enter Price" required></input>
									</div>
									<div class="mb-4">
										<input type="text" name="location" class="form-control mb-2"
											placeholder="Enter your location" required></input>
									</div>
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
							<div class="modal-footer">
								<button type="button" class="btn btn-secondary"
									data-bs-dismiss="modal">Close</button>
							</div>
						</div>
					</div>

				</div>
				<div class="row">
					<%
					for (Mkt m1 : m) {
					%>
					<div class="col-lg-4 col-md-6 col-sm-12 mt-2">
						<div class="card">
							<a href="#" style="text-decoration: none;"> <img
								src="<%=request.getContextPath()%>/images/market/<%=m1.getImage()%>"
								class="card-img-top" alt="image" height="200px" style="">
							</a>
							<div class="card-body">
								<b>
									<p class="card-text">
										&#8377;
										<%=m1.getPrice()%>
									</p>
								</b> &nbsp; &nbsp;<i> <%=m1.getPname()%>
								</i> <br> &nbsp; &nbsp;<%=m1.getLocation()%>
								<br>
							</div>
						</div>
					</div>
					<%
					}
					%>
				</div>
				<br> <br> <br> <br> Lorem ipsum dolor sit amet
				consectetur adipisicing elit. Molestias praesentium ratione
				laudantium, earum pariatur veniam non optio rerum, sit impedit
				architecto repudiandae voluptatum possimus tempora eum natus
				perferendis, numquam dignissimos in vel provident quia id! Expedita
				ipsum fuga autem reiciendis dolorem, cum ratione officiis qui illo
				nemo nostrum cupiditate rerum tempore quo praesentium quis
				reprehenderit soluta eius voluptatum nam modi architecto odio optio.
				Nisi soluta voluptates doloremque ut animi veniam facere
				consequuntur eos amet quidem repellat nobis repudiandae quaerat
				architecto, earum officia numquam nemo explicabo quis ex harum
				consectetur fuga. Aliquid illo iure sint in cupiditate qui iste unde
				fugiat.









			</div>




		</div>
	</div>



	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
		crossorigin="anonymous"></script>
		
</body>

</html>