<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Admin</title>
<%@ include file="../includes/meta.jsp"%>
<!-- Bootstrap Core CSS -->
<link rel="stylesheet" href="http://localhost:8080/kltn/resources/css/bootstrap.min.css">
<link href="http://localhost:8080/kltn/resources/css/metisMenu/metisMenu.css" rel="stylesheet">
<!-- Custom Fonts -->
<link href="http://localhost:8080/kltn/resources/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">
<!-- CUSTOM STYLES-->
<link href="http://localhost:8080/kltn/resources/css/custom-admin.css"
	rel="stylesheet" />
</head>
<body>
	<div id="wrapper">
		<nav class="navbar navbar-default navbar-cls-top " role="navigation"
			style="margin-bottom: 0">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target=".sidebar-collapse">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="">Dashboard</a>
			</div>
			<div
				style="color: white; padding: 15px 50px 5px 50px; float: right; font-size: 16px;">
				Admin: <span class="label label-info">${currentUser.displayName}</span> &nbsp; <a href="../logout"
					class="btn btn-danger square-btn-adjust">Logout</a>
			</div>
		</nav>
		<!-- /. NAV TOP  -->
		<nav class="navbar-default navbar-side" role="navigation">
			<div class="sidebar-collapse">
				<ul class="nav" id="main-menu">
					<li class="text-center"><img src="../resources/images/find_user.png"
						class="user-image img-responsive" /></li>


					<li><a href="home"><i
							class="fa fa-dashboard  fa-3x"></i> Dashboard</a></li>
					<li><a class="active-menu" href="#"><i class="fa fa-graduation-cap fa-3x"></i>
							Courses<span class="fa arrow"></span></a>
						<ul class="nav nav-second-level">
							<li><a href="list_course">Overview</a></li>
							<li><a href="list_course_pending">Pending</a></li>
							<li><a href="list_course_published">Published</a></li>
							<li><a href="list_course_blocked">Blocked</a></li>
						</ul></li>
					<li><a href="#"><i class="fa fa-comment fa-3x"></i>
							Comments<span class="fa arrow"></span></a>
						<ul class="nav nav-second-level">
							<li><a href="list_comment_pending">Pending</a></li>
							<li><a href="list_comment_published">Published</a></li>
							<li><a href="list_comment_blocked">Blocked</a></li>
						</ul></li>
					<li><a href="#"><i class="fa fa-users fa-3x"></i>
							Accounts<span class="fa arrow"></span></a>
						<ul class="nav nav-second-level">
							<li><a href="list_account">All</a></li>
							<li><a href="list_account_active">Active</a></li>
							<li><a href="list_account_inactive">InActive</a></li>
							<li><a href="list_account_blocked">Blocked</a></li>
						</ul></li>
					<li><a href="home.html"><i
							class="fa fa-home  fa-3x"></i> Go to Home page</a></li>
				</ul>

			</div>

		</nav>
		<!-- /. NAV SIDE  -->
		<div id="page-wrapper">
			<div id="page-inner">
				<div class="row">
					<div class="col-md-12">
						<h2>Admin Dashboard</h2>
					</div>
				</div>
				<!-- /. ROW  -->
				<hr />
				<div class="row">	
					<div class="col-md-3 col-sm-6 col-xs-6">
						<div class="panel panel-back noti-box">
							<span class="icon-box bg-color-green set-icon"> <i
								class="fa fa-users"></i>
							</span>
							<div class="text-box">
								<p class="main-text">${numberAccount } Accounts</p>
								<p class="text-muted">Total</p>
								<p class="text-right"><a class="btn btn-primary" href="list_account">View Detail</a></p>
							</div>
						</div>
					</div>
					<div class="col-md-3 col-sm-6 col-xs-6">
						<div class="panel panel-back noti-box">
							<span class="icon-box bg-color-blue set-icon"> <i
								class="fa fa-users"></i>
							</span>
							<div class="text-box">
								<p class="main-text">${numberAccountInActive } Accounts</p>
								<p class="text-muted">InActive</p>
								<p class="text-right"><a class="btn btn-primary" href="list_account_inactive">View Detail</a></p>
							</div>
						</div>
					</div>
					<div class="col-md-3 col-sm-6 col-xs-6">
						<div class="panel panel-back noti-box">
							<span class="icon-box bg-color-brown set-icon"> <i
								class="fa fa-users"></i>
							</span>
							<div class="text-box">
								<p class="main-text">${numberAccountActive } Accounts</p>
								<p class="text-muted">Active</p>
								<p class="text-right"><a class="btn btn-primary" href="list_account_active">View Detail</a></p>
							</div>
						</div>
					</div>
					<div class="col-md-3 col-sm-6 col-xs-6">
						<div class="panel panel-back noti-box">
							<span class="icon-box bg-color-red set-icon"> <i
								class="fa fa-users"></i>
							</span>
							<div class="text-box">
								<p class="main-text">${numberAccountBlocked } Accounts</p>
								<p class="text-muted">Blocked</p>
								<p class="text-right"><a class="btn btn-primary" href="list_account_blocked">View Detail</a></p>
							</div>
						</div>
					</div>
					
				</div>
				<!-- /. ROW  -->
			</div>
			<!-- /. PAGE INNER  -->
		</div>
		<!-- /. PAGE WRAPPER  -->
	</div>
	<!-- /. WRAPPER  -->
	<!-- SCRIPTS -AT THE BOTOM TO REDUCE THE LOAD TIME-->

	<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
	
	<script type="text/javascript" src="http://localhost:8080/kltn/resources/js/bootstrap.min.js"></script>
	<!-- CUSTOM SCRIPTS -->
	<script src="http://localhost:8080/kltn/resources/js/custom-admin.js"></script>
	<!-- MetisMenu -->
    
    <script src="http://localhost:8080/kltn/resources/js/metisMenu/metisMenu.js"></script>


</body>
</html>