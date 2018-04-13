<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Change password</title>
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

			<div class="col-sm-3 col-md-2 sidebar-offcanvas" id="sidebar" role="navigation">

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

				<h2 class="page-header">Change password</h2>

				<div class="row placeholders">
					<form action="profile_change_password" method="POST" class="form-horizontal" id="changePassForm">
						<div class="form-group">
							<label for="inputCurrentPassword"
								class="col-md-3 col-sm-3 control-label">Current Password</label>
							<div class="col-md-5 col-sm-5 controls">
								<input type="password" require="true" class="form-control"
									id="inputCurrentPassword" name="currentPassword" placeholder="Current password"/>
							</div>
						</div>
						<div class="form-group">
							<label for="inputNewPassword"
								class="col-md-3 col-sm-3 control-label">New password</label>
							<div class="col-md-5 col-sm-5">
								<input type="password" class="form-control"
									id="inputNewPassword" name="newPassword" placeholder="New password" />
							</div>
						</div>
						
						<div class="form-group">
							<label for="inputConfirmNewPassword"
								class="col-md-3 col-sm-3 control-label">Re-type new password</label>
							<div class="col-md-5 col-sm-5">
								<input type="password" class="form-control"
									id="inputConfirmNewPassword" name="confirmPassword" placeholder="Re-type new password" />
							</div>
						</div>
						
						<div class="form-group">
							<span class="col-md-3 col-sm-3 col-sm-offset-3" style='color: red'>${result}</span>
							<div class="col-sm-2">
								<button type="submit"
									class="btn btn-primary btn-block">Change password</button>
							</div>
						</div>
					</form>
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
			var flag = false;
			$('#changePassForm').bootstrapValidator({
				fields: {
					currentPassword : {
						validators : {
							notEmpty : {
								message : 'The password is required and cannot be empty'
							},
							stringLength : {
								min : 8,
								max : 20,
								message : 'The password must be more than 8 and less than 20 characters long'
							}
						}
					},
					newPassword : {
						validators : {
							notEmpty : {
								message : 'The password is required and cannot be empty'
							},
							stringLength : {
								min : 8,
								max : 20,
								message : 'The password must be more than 8 and less than 20 characters long'
							}
						}
					},
					confirmPassword : {
						validators : {
							notEmpty : {
								message : 'The password is required and cannot be empty'
							},
							stringLength : {
								min : 8,
								max : 20,
								message : 'The password must be more than 8 and less than 20 characters long'
							},
							identical : {
								field : 'newPassword',
								message : 'The password and its confirm are not the same'
							}
						}
					}
				}
			}).on('error.form.bv', function(e) {
				console.log('error.form.bv');;
			}).on('success.form.bv', function(e) {
				//console.log('success.form.bv');
				flag = true;
				// If you want to prevent the default handler (bootstrapValidator._onSuccess(e))
				// e.preventDefault();
			}).on('error.field.bv', function(e, data) {
				//console.log('error.field.bv -->', data);
			}).on('success.field.bv', function(e, data) {
				//console.log('success.field.bv -->', data);
			});
		</script>
	</div>
</body>
</html>