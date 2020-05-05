<%@page import="org.json.JSONObject"%>
<%@page import="java.util.HashMap"%>
<%@page import="com.healthcare.model.Login"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Admin Panel</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<link href="Views/userProfile.css" rel="stylesheet">
<script src="Components/userProfile.js"></script>
<script src="Components/main.js"></script>
<style type="text/css">
.baseContainer {
	margin: 20px;
}
</style>
</head>
<body>
	<%
		Login login = new Login();
		JSONObject userDetails = login.getUserDetails((String) session.getAttribute("authString"),
				(String) session.getAttribute("userId"));
	%>
	<div class="fadeInDown">
		<div class="baseContainer">
			<nav class="navbar navbar-expand-md navbar-light bg-light">
				<a href="#" class="navbar-brand"> <img
					src="images/logoSmall.jpg" height="50" alt="CoolBrand">
				</a>
				<button type="button" class="navbar-toggler" data-toggle="collapse"
					data-target="#navbarCollapse">
					<span class="navbar-toggler-icon"></span>
				</button>

				<div class="collapse navbar-collapse" id="navbarCollapse">
					<div class="navbar-nav">
						<a href="adminPanel.jsp" id="homeNav" class="nav-item nav-link">Home</a>
						<a href="userProfile.jsp" id="profileNav"
							class="nav-item nav-link active">Profile</a>
					</div>
					<div class="navbar-nav ml-auto">
						<a href="index.jsp?logout=true" id="logoutNav"
							class="nav-item nav-link">Logout</a>
					</div>
				</div>
			</nav>

			<div>

				<div class="container">
					<div>
						<form id="formUser">
							<div class="form-group">
								<div class="row">
									<div class="col">
										<label for="firstName">First Name</label> <input type="text"
											class="form-control" placeholder="First name" id="firstName"
											name="firstName"
											value="<%out.print(userDetails.get("firstName"));%>" />
									</div>
									<div class="col">
										<label for="lastName">Last Name</label> <input type="text"
											class="form-control" placeholder="Last name" id="lastName"
											name="lastName"
											value="<%out.print(userDetails.get("lastName"));%>" />
									</div>
								</div>
							</div>
							<div class="form-group">
								<div class="row">
									<div class="col">
										<label for="age">Age</label> <input type="number"
											class="form-control" id="age" name="age" placeholder="Age"
											value="<%out.print(userDetails.get("age"));%>">
									</div>
									<div class="col">
										<label for="gender">Gender</label> <select id="gender"
											name="gender" class="form-control">
											<option
												<%if (userDetails.get("gender").equals("Choose...")) {%>
												selected <%}%>>Choose...</option>
											<option <%if (userDetails.get("gender").equals("Male")) {%>
												selected <%}%>>Male</option>
											<option <%if (userDetails.get("gender").equals("Female")) {%>
												selected <%}%>>Female</option>
										</select>
									</div>
								</div>
							</div>

							<div class="form-group">
								<div class="row">
									<div class="col">
										<label for="address">Address</label> <input type="text"
											class="form-control" id="address" name="address"
											placeholder="Address"
											value="<%out.print(userDetails.get("address"));%>">
									</div>
									<div class="col">
										<label for="mobileNumber">Mobile Number</label> <input
											type="text" class="form-control" placeholder="Mobile Number"
											id="mobileNumber" name="mobileNumber"
											value="<%out.print(userDetails.get("mobileNumber"));%>">
									</div>
								</div>
							</div>

							<div class="form-group">
								<div class="row">
									<div class="col">
										<label for="email">Email address</label> <input type="email"
											class="form-control" id="email" name="email"
											placeholder="Email"
											value="<%out.print(userDetails.get("email"));%>"> <small
											id="emailSmallText" class="form-text text-muted">We'll
											never share your email with anyone else.</small>
									</div>
								</div>
							</div>
							<div id="alertSuccess" class="alert alert-success"></div>
							<div id="alertError" class="alert alert-danger"></div>
							<input type='button' name='updateBtn' id="updateBtn"
								value='Update' class='btnUpdate btn btn-primary'> &nbsp;<input
								type='button' name='cancelBtn' id="cancelBtn" value='Cancel'
								class='btnUpdate btn btn-danger'><input type="hidden"
								id="authString" name="authString"
								value="<%out.print(session.getAttribute("authString"));%>" />
						</form>
					</div>
				</div>

			</div>
		</div>
	</div>
</body>
</html>