<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Profile</title>
<%@ include file="../includes/meta.jsp"%>
<%@ include file="../includes/script-style-common.jsp"%>
<!-- Custom css -->
<link href="../resources/css/profile/profile.css" rel="stylesheet"
	type="text/css">
</head>
<body>
	<%@ include file="../includes/header.jsp"%>
	<div class="container">
		<div class="row row-offcanvas row-offcanvas-left">
			
			<div class="col-sm-3 col-md-2 sidebar-offcanvas" id="sidebar"
				role="navigation">
				
				<ul class="nav nav-sidebar">
					<li class="active"><a href="profile_info">Account</a></li>
					<li class="text-center"><img src="profile_image/${currentUser.userID }"
						class="user-image img-responsive img-circle" /></li>
					<li>
						<ul class="list-group">
							<li class="list-group-item">User name: <strong>${currentUser.userName }</strong></li>
							<li class="list-group-item">Email: <strong>${currentUser.email }</strong></li>
							<li class="list-group-item">Status: <strong><c:choose><c:when test="${currentUser.status eq -1 }"><span class="label label-info">InActive</span></c:when><c:when test="${currentUser.status eq 1 }"><span class="label label-success">Active</span></c:when><c:otherwise><span class="label label-danger">Blocked</span></c:otherwise></c:choose></strong></li>
							
						</ul>
					</li>
				</ul>
				<ul class="nav nav-sidebar">
					<li class="active"><a>Setting profile</a></li>
					<li><a href="profile_info">Info</a></li>
					<li><a href="profile_edit">Edit profile</a></li>
					<li><a href="profile_change_password">Change password</a></li>
					<li><a href="change_profile_image">Change profile image</a></li>
				</ul>
				<ul class="nav nav-sidebar">
					<li class="active"><a href="">Learning</a></li>
					<li><a href="my_courses">Your courses</a></li>
					<li><a href="my_activities">Your Activities</a></li>
				</ul>
				<ul class="nav nav-sidebar">
					
					<li><a href="#">Go to Home page</a></li>

				</ul>


			</div>
			<!--/sidebar-->

			<div class="col-sm-9 col-md-10 main">

				<!--toggle sidebar button-->
				<p class="visible-xs">
					<button type="button" class="btn btn-primary btn-xs"
						data-toggle="offcanvas">
						<i class="glyphicon glyphicon-chevron-left"></i>
					</button>
				</p>

				<h1 class="page-header">Account Information</h1>

				<div class="row placeholders">
					<form:form action="signup.html" method="POST"
						commandName="currentUser" class="form-horizontal" id="signupForm">
						<div class="form-group">
							<label for="inputFullname"
								class="col-md-3 col-sm-3 control-label">Full name</label>
							<div class="col-md-8 col-sm-8 controls">
								<form:input path="fullName" require="true" class="form-control"
									id="inputFullname" placeholder="Full name" readonly="true" />
								<p class="help-block"></p>
							</div>
						</div>
						<div class="form-group">
							<label for="inputDisplayName"
								class="col-md-3 col-sm-3 control-label">Display name</label>
							<div class="col-md-8 col-sm-8">
								<form:input path="displayName" class="form-control"
									id="inputDisplayName" placeholder="Display name"
									readonly="true" />
							</div>
						</div>
						<div class="form-group">
							<label for="inputUsername"
								class="col-md-3 col-sm-3 control-label">User name</label>
							<div class="col-md-8 col-sm-8">
								<form:input path="userName" type="text" class="form-control"
									id="inputUsername" placeholder="User name" readonly="true" />
							</div>
						</div>
						<div class="form-group">
							<label for="inputEmail" class="col-md-3 col-sm-3 control-label">Email</label>
							<div class="col-md-8 col-sm-8">
								<form:input path="email" type="email" class="form-control"
									id="inputEmail" placeholder="Email" readonly="true" />
							</div>
						</div>
						<div class="form-group">
							<label for="inputBirthDate"
								class="col-md-3 col-sm-3 control-label">Birth date</label>
							<div class="col-md-8 col-sm-8">
								<form:input path="birthdate" class="form-control"
									id="inputBirthDate" placeholder="Birth date" readonly="true" />
							</div>
						</div>
						<div class="form-group">
							<label for="inputDescription"
								class="col-md-3 col-sm-3 control-label">Description</label>
							<div class="col-md-8 col-sm-8">
								<form:textarea path="description" class="form-control"
									id="inputDescription" placeholder="Description" readonly="true" />
							</div>
						</div>
						<div class="form-group">
							<div class="col-sm-offset-9 col-sm-2">
								<a href="profile_edit"
									class="btn btn-primary btn-block">Edit Profile</a>
							</div>
						</div>
					</form:form>
				</div>

			</div>
			<!--/row-->
		</div>



		<%@ include file="../includes/footer.jsp"%>
		<script type='text/javascript'>
			$(document).ready(function() {
				$('[data-toggle=offcanvas]').click(function() {
					$('.row-offcanvas').toggleClass('active');
				});
			});
		</script>
	</div>
</body>
</html>