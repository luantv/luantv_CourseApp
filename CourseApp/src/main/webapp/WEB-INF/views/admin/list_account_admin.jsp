<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Admin: Administrators</title>
<%@ include file="../includes/meta.jsp"%>
<!-- Bootstrap Core CSS -->
<link rel="stylesheet" href="http://localhost:8080/kltn/resources/css/bootstrap.min.css">
<!-- metisMenu CSS -->
<link href="http://localhost:8080/kltn/resources/css/metisMenu/metisMenu.css" rel="stylesheet">

<link href="http://localhost:8080/kltn/resources/css/bootstrap-duallistbox.css" rel="stylesheet">
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
					<li><a href="#"><i class="fa fa-graduation-cap fa-3x"></i>
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
					<li><a  class="active-menu" href="#"><i class="fa fa-users fa-3x"></i>
							Accounts<span class="fa arrow"></span></a>
						<ul class="nav nav-second-level">
							<li><a href="list_account">All</a></li>
							<li><a href="list_account_pending">Pending</a></li>
							<li><a href="list_account_published">Published</a></li>
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
						<ol class="breadcrumb">
							<li><a href="home"><i class="fa fa-home"></i> Admin</a></li>
							<li><a href="list_account"><i class="fa fa-home"></i> Accounts</a></li>
							<li class="active"><i class="fa fa-book"></i> Administrators</li>
						</ol>
						<h2>Administrators</h2>
					</div>
				</div>
				<!-- /. ROW  -->
				
				<div class="row">
					<div class="col-md-6">
							<ul class="list-inline">
								<li><a href="list_account">All</a></li>
								<li class="label label-primary">Administrator</li>
								<li><a href="list_account_member">Member</a></li>
								<li><a href="list_account_teacher">Teacher</a></li>
								<li><a href="list_account_inactive">InActive</a></li>
								<li><a href="list_account_active">Active</a></li>
								<li><a href="list_account_blocked">Blocked</a></li>
							</ul>
						</div>
						<div class="col-md-6">
							<div class="col-md-12 column">
								<form action="search_account" method="get">
									<div class="col-md-9">
										<input aria-controls="table-account" placeholder="search"
											name="searchKey" class="form-control input-md"
											type="search">
									</div>
									<div class="col-md-3">
										<input class="form-control" value="Search" type="submit">
									</div>
								</form>
							</div>
						</div>
						
				</div>
				<!-- /. ROW  -->
				<hr />
				<div class="row">
					<div class="col-md-12">
						<table class="table table-hover table-bordered"
								id="table-account">
								<thead>
									<tr>
										<th>#</th>
										<th class="hide">UserID</th>
										<th>User name</th>
										<th>Email</th>
										<th>Status</th>
										<th class="hide">Birthdate</th>
										<th class="hide">Description</th>
										<th class="hide">DisplayName</th>
										<th class="hide">FullName</th>
										<th class="hide">gender</th>
										<th colspan="3">Actions</th>
									</tr>
								</thead>
								<tbody>
									<c:set var="num" value="1"></c:set>
									<c:forEach var="account" items="${accountList}">
										<tr>
											<td>${num }</td>
											<td class="hide">${account.userID }</td>
											<td>${account.userName }</td>
											<td>${account.email }</td>
											<td><c:choose><c:when test="${account.status eq -1 }"><span class="label label-info">InActive</span></c:when><c:when test="${account.status eq 1 }"><span class="label label-success">Active</span></c:when><c:otherwise><span class="label label-danger">Blocked</span></c:otherwise></c:choose></td>
											<td class="hide">${account.birthdate }</td>
											<td class="hide">${account.description }</td>
											<td class="hide">${account.displayName }</td>
											<td class="hide">${account.fullName }</td>
											<!-- Dung xuong dong cho nay, no them khoang trang anh huong den modal -->
											<td class="hide"><c:choose><c:when test="${account.gender eq true}">Male</c:when><c:otherwise>Female</c:otherwise></c:choose></td>
											<td class="hide"><c:forEach items="${account.roles}" var="item">${item.roleName }-${item.roleID },</c:forEach></td>
											<td><button class="btn btn-primary"
													onclick="display_detail(${num});">Detail</button></td>
											<td><button class="btn btn-primary"
													onclick="display_role(${num});">Role</button></td>
											<td><c:choose>
													<c:when test="${account.status eq -1 }">
														<button class="btn btn-primary"
															onclick="active_block_account(${account.status},'${account.userID }');">Active</button>
													</c:when>
													<c:when test="${account.status eq 1 }">
														<button class="btn btn-danger"
															onclick="active_block_account(${account.status},'${account.userID }');">Block</button>
													</c:when>
													<c:otherwise>
														<button class="btn btn-primary"
															onclick="active_block_account(${account.status},'${account.userID }');">Active</button>
													</c:otherwise>
												</c:choose>
											
											</td>
										</tr>
										<c:set var="num" value="${num+1 }"></c:set>
									</c:forEach>
								</tbody>
							</table>
					</div>
				</div>
				<!-- /. ROW  -->
				<div class="row text-center">
							<div class="col-md-12 column">
								<nav>
								<ul class="pagination">
									<li><a href="list_account" aria-label="Previous"> <span
											aria-hidden="true">&laquo;</span>
									</a></li>
									<c:forEach begin="1" end="${pageCount }" var="item">
										<c:choose>
											<c:when test="${numPage eq item }">
												<li class="active"><a
													href="list_account_admin?numPage=${item }">${item }</a></li>
											</c:when>
											<c:otherwise>
												<li><a href="list_account_admin?numPage=${item }">${item }</a></li>
											</c:otherwise>
										</c:choose>

									</c:forEach>
									<li><a href="list_account_admin?numPage=${pageCount }"
										aria-label="Next"> <span aria-hidden="true">&raquo;</span>
									</a></li>
								</ul>
								</nav>

							</div>
						</div>
				<!-- /. ROW  -->
				<hr />
				
				
				
			</div>
			<!-- /. PAGE INNER  -->
		</div>
		<!-- /. PAGE WRAPPER  -->
	</div>
	<!-- /. WRAPPER  -->
	
	<p class="hide" id="allRole"><c:forEach var="tmp" items="${roleList }">${tmp.roleName }-${tmp.roleID },</c:forEach></p>
	
	<!-- SCRIPTS -AT THE BOTOM TO REDUCE THE LOAD TIME-->

	<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
	
	<script type="text/javascript" src="http://localhost:8080/kltn/resources/js/bootstrap.min.js"></script>
	
	<script type="text/javascript" src="http://localhost:8080/kltn/resources/js/jquery.bootstrap-duallistbox.js"></script>
	<!-- CUSTOM SCRIPTS -->
	<script src="http://localhost:8080/kltn/resources/js/custom-admin.js"></script>
	<!-- MetisMenu -->
    
    <script src="http://localhost:8080/kltn/resources/js/metisMenu/metisMenu.js"></script>

	<script type='text/javascript'>
			$(document).ready(function() {
				$('[data-toggle=offcanvas]').click(function() {
					$('.row-offcanvas').toggleClass('active');
				});
				
				$('#table-account').dataTable({
			        "paging":   false,
			        "info":     false,
			        "searching": false
			    });
				
				$('#menu').metisMenu();
			});
			
			function active_block_account(status, userID){
				if(status == -1 || status == 0){
					$.ajax({
						type: 'GET',
						url: 'active_account?userID=' + userID ,
						success: function(data){
							if(data == 'done'){
								alert("Active account done.")
								location.reload();
							}
							else if(data == 'error'){
								alert("Error Active account.")
							}
							else if(data == 'no_role'){
								window.location.href="../home.html";
							}else if(data == 'no_login'){
								window.location.href="../home.html";
							}
						},
						error: function(error){
							alert("Error: " + error);
						}
					});
				}
				else if( status == 1){
					$.ajax({
						type: 'GET',
						url: 'block_account?userID=' + userID ,
						success: function(data){
							if(data == 'done'){
								alert("Block account done.")
								location.reload();
							}
							else if(data == 'error'){
								alert("Error Block account.")
							}
							else if(data == 'no_role'){
								window.location.href="../home.html";
							}else if(data == 'no_login'){
								window.location.href="../home.html";
							}
						},
						error: function(error){
							alert("Error: " + error);
						}
					})
				};
			}
			
			function display_detail(num){
				var userID =  $('#table-account tr').eq(num).find('td').eq(1).text();
				var userName =  $('#table-account tr').eq(num).find('td').eq(2).text();
				var email =  $('#table-account tr').eq(num).find('td').eq(3).text();
				var status =  $('#table-account tr').eq(num).find('td').eq(4).text();
				var birthdate =  $('#table-account tr').eq(num).find('td').eq(5).text();
				var description =  $('#table-account tr').eq(num).find('td').eq(6).text();
				var displayName =  $('#table-account tr').eq(num).find('td').eq(7).text();
				var fullName =  $('#table-account tr').eq(num).find('td').eq(8).text();
				var gender =  $('#table-account tr').eq(num).find('td').eq(9).text();
				
				var img_url = "../profile/profile_image/"+userID;
				
				$('#userID').val(userID);
				$('#userName').text(userName);
				$('#email').val(email);
				$('#status').val(status);
				$('#birthdate').val(birthdate);
				$('#description').val(description);
				$('#displayName').val(displayName);
				$('#fullName').val(fullName);
				$('#gender').val(gender);
				$('#img-account').attr('src',img_url);
				$('#exampleModal').modal('show');
			}
			
			function display_role(num){
				var userID = $('#table-account tr').eq(num).find('td').eq(1).text();
				$('#input-userID').val(userID);
				
				
				$('#duallistbox-roles option').each(function() {
				        $(this).remove();
				});
				var allRole = $('#allRole').text();
				var arrayAllRole = allRole.split(",");
				
				var roles =  $('#table-account tr').eq(num).find('td').eq(10).text();
				var arrayRole = roles.split(",");
				var flag=1;
				for(i=0;i<arrayAllRole.length-1;i++){
					var role = arrayAllRole[i].split("-");
					flag=1;
					for(j=0;j<arrayRole.length-1;j++){
						
						if(arrayAllRole[i] == arrayRole[j]){
							
							$('#duallistbox-roles').append($('<option/>', {
						        value: role[1],
						        selected: "selected",
						        text : role[0]
						    }));
							flag=0;
							break;
						}
					}
					
					if(flag==1){
						$('#duallistbox-roles').append($('<option/>', {
					        value: role[1],
					        text : role[0]
					    }));
					}
					
				}
				$('#duallistbox-roles').bootstrapDualListbox({
					showFilterInputs: false,
					selectedListLabel: "Current roles",
					nonSelectedListLabel: "All role"
				});
				$('#duallistbox-roles').bootstrapDualListbox('refresh');
				$('#roleModal').modal('show');
				
				
			}
			
		</script>
<%@ include file="modal_account_detail.jsp"%>
<%@ include file="modal_account_role.jsp"%>
</body>
</html>