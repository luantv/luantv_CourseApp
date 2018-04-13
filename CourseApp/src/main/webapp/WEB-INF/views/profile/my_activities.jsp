<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>My courses</title>
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
					<li><a href="my_course">Your courses</a></li>
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

				<h2 class="page-header">My Activities</h2>

				<div class="row placeholders">
					<ul class="list-group">
						<c:forEach items="${activityList }" var="item">
							<li class="list-group-item"><span class="badge label label-primary">At: ${item.createDate }4</span>
							<strong>${item.content }</strong></li>
						</c:forEach>
						
					</ul>
				</div>
				<div class="row text-center">
					<div class="col-md-12 column">
						<nav>
						<ul class="pagination">
							<li><a href="my_activities" aria-label="Previous"> <span
									aria-hidden="true">&laquo;</span>
							</a></li>
							<c:forEach begin="1" end="${pageCount }" var="item">
								<c:choose>
									<c:when test="${numPage eq item }">
										<li class="active"><a
											href="my_activities?numPage=${item }">${item }</a></li>
									</c:when>
									<c:otherwise>
										<li><a href="my_activities?numPage=${item }">${item }</a></li>
									</c:otherwise>
								</c:choose>

							</c:forEach>
							<li><a href="my_activities?numPage=${pageCount }"
								aria-label="Next"> <span aria-hidden="true">&raquo;</span>
							</a></li>
						</ul>
						</nav>

					</div>
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