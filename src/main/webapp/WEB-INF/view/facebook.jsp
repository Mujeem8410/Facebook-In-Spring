<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="s"%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/facebook.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
	crossorigin="anonymous"></script>
</body>
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>Facebook Page</title>
<style>
.errors{

color:red;
margin-left:5px;

}

</style>
</head>

<body>
	<%
	String email = (String) request.getSession().getAttribute("email");
	if (email != null) {
		response.sendRedirect("Welcome");
	}
	%>
	<div class="container-flud w-100 contain">
		<div class="row  w-100">
			<div class="col-md-6 col-sm-12">

				<div class="top-cont">
					<h1 class="brand-name">
						<b>facebook</b>
					</h1>
					<h5 class="description ">Facebook helps you connect and share
						with the people in your life.</h5>

				</div>
			</div>
			<div class="col-md-6 col-sm-12  form-container">
				<div class="login mt-5 mb-2 p-2 ml-3 mr-3">
					<form action="Login" method="post" class="needs-validation"
						novalidate>

						<div class="col-12 mb-4">

							<input type="email" class="form-control" id="email"
								placeholder="Email address" name="email" required>
						</div>
						<div class="col-12 mb-4">

							<input type="password" class="form-control" id="password"
								placeholder="Password" name="password" required>

						</div>
						<button type="Submit" class="btn btn-primary btn-lg w-100">
							<b>Login</b>
						</button>
					</form>
					<div class="text-center link mt-2">
						<a class="tex-center" href="/">Reset password?</a>
					</div>
					<div class="line mt-2">
						<hr>
						<p style="color: red;" class="text-center">
							 <b>${error}</b>

						</p>
					</div>
					<!-- Button trigger modal -->
					<button type="button" class="btn button-ac" data-bs-toggle="modal"
						data-bs-target="#staticBackdrop">
						<b>create new account</b>
					</button>

					<!-- Modal -->


					<div class="modal fade" id="staticBackdrop"
						data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
						aria-labelledby="staticBackdropLabel" aria-hidden="true">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<h1 class="modal-title fs-5" id="staticBackdropLabel">Sign
										Up</h1>
									<button type="button" class="btn-close" data-bs-dismiss="modal"
										aria-label="Close"></button>
								</div>
								<!-- 
        this is modal data -->
								<div class="modal-body">

									<s:form action="register" method="post"
										modelAttribute="user">
		

										<div class="col-12 mb-2">
											<s:input type="email" cssClass="form-control email"
												placeholder="Email Address" path="email" />
											<s:errors path="email" cssClass="errors" />
										</div>

										<div class="col-12 mb-2">
											<s:input type="password" cssClass="form-control password"
												placeholder="Password" path="password"/>
											<s:errors path="password" cssClass="errors" />
										</div>

										<div class="col-12 mb-2">
											<s:input type="text" cssClass="form-control"
												placeholder="Enter Name" path="name"/>
											<s:errors path="name" cssClass="errors" />
										</div>

										<div class="col-12 mb-2">
											<small>Gender</small><br>
											<div class="form-check form-check-inline">
												<s:radiobutton cssClass="form-check-input" path="gender"
													value="m" />
												<label class="form-check-label">Male</label>
											</div>

											<div class="form-check form-check-inline">
												<s:radiobutton cssClass="form-check-input" path="gender"
													value="f" />
												<label class="form-check-label">Female</label>
											</div>

											<s:errors path="gender" cssClass="errors" />
										</div>

										<div class="col-12 signbtnbox">
											<button type="submit" id="sign"
												class="btn btn-primary signbtn w-50">
												<b>Sign Up</b>
											</button>
										</div>
									</s:form> 




								</div>

							</div>
						</div>
					</div>

				</div>

			</div>
		</div>
<script src="${pageContext.request.contextPath}/js/validation.js"></script>

</body>

</html>