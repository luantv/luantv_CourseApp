<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<c:set var="req" value="${pageContext.request}" />
<c:set var="url">${req.requestURL}</c:set>
<c:set var="uri" value="${req.requestURI}" />
<c:set var="url_context">
${fn:substring(url, 0, fn:length(url) - fn:length(uri))}${req.contextPath}/
</c:set>
<c:if test="${currentUser == null }">
	<!-- Login modal -->
	<div class="modal fade bs-example-modal-lg">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-body">
					<div class="row">
						<div class="col-md-12">
							<div style="margin: 20px;">
								<div class="panel panel-default">
									<div class="panel-heading">
										<h3 class="panel-title text-center">Sign in</h3>
									</div>
									<div class="panel-body">
										<form action="" method="POST" class="form-horizontal"
											id="signinForm">
											<div class="form-group">
												<!-- <label for="inputEmail3"
										class="col-md-3 col-sm-3 control-label">Email</label> -->
												<div class="col-sm-offset-2 col-md-8 col-sm-8">
													<input type="email" class="form-control" name="email"
														id="inputEmail" placeholder="Email" />
												</div>
											</div>
											<div class="form-group">
												<!-- <label for="inputPassword"
										class="col-md-3 col-sm-3 control-label">Password</label> -->
												<div class="col-sm-offset-2 col-md-8 col-sm-8">
													<input type="password" class="form-control" name="password"
														id="inputPassword" placeholder="Password" />
												</div>
											</div>
											<div class="form-group">
												<div class="col-sm-offset-2 col-sm-8">
													<div class="checkbox">
														<label> <input type="checkbox" name="remember"
															id="chkRemember"> Remember me
														</label>
													</div>
												</div>
											</div>

											<div class="form-group">
												<div class="col-sm-offset-2 col-sm-8">
													<input type="button" value="Sign in" onclick="signin('${url_context}');"
														class="btn btn-primary btn-block">
													<p id="errorDisplay" style="color: red"></p>
												</div>
											</div>

											<div class="form-group">
												<div class="col-sm-offset-2 col-sm-8">
													<div class="row text-center">
														<p>
															<a href="${url_context}forgot_password">Forgot password?</a> | <a href="${url_context}signup.html">Create
																a new account.</a>
														</p>
													</div>
												</div>
											</div>
										</form>
							<!-- 
										<div class="row">
											<hr />
											<h4 class="text-center">
												<span class="label label-default">OR</span>
											</h4>

										</div>
										<div class="row">
											<div class="col-sm-6" style="margin-bottom: 10px">
												<a class="btn btn-block btn-social btn-google-plus"> <i
													class="fa fa-google-plus"></i>Sign in with Google
												</a>
											</div>
											<div class="col-sm-6">
												<a class="btn btn-block btn-social btn-facebook"> <i
													class="fa fa-facebook"></i>Sign in with Facebook
												</a>
											</div>
										</div>
								-->
									</div>
								</div>

							</div>
						</div>

					</div>


				</div>
				
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	<!-- /.modal -->
</c:if>

<!-- Navigation -->
<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
	<div class="container">
		<!-- Brand and toggle get grouped for better mobile display -->
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target="#bs-example-navbar-collapse-1">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="http://localhost:8080/kltn/home.html"><strong><span class="text-primary">UET Learning</span></strong></a>
		</div>
		<!-- Collect the nav links, forms, and other content for toggling -->
		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<div class="nav navbar-nav col-md-6 col-lg-6 col-ms-6" style="padding-top: 10px;">
				
				<form role="search" action="${url_context}search/search_course" method="get">
					<div class="input-group">
						<input type="text" class="form-control" name="searchKey"
							placeholder="Search for..."> <span
							class="input-group-btn">
							<button class="btn btn-default" type="submit">
								<i class="glyphicon glyphicon-search"></i> Search
							</button>
						</span>
					</div>
				</form>
			</div>

			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown"><a aria-expanded="false"
					class="dropdown-toggle" role="button" data-toggle="dropdown"
					href="#">Courses<span class="caret"></span></a>
					<ul id="category-menu" class="dropdown-menu" role="menu">
					</ul>
				</li>
				<c:choose>
					<c:when test="${currentUser == null }">
						<li><a data-toggle="modal" data-target=".bs-example-modal-lg"
							href=""><i class="glyphicon glyphicon-log-in"></i> Sign in</a></li>
						<li><a href="${url_context}signup.html"><i
								class="glyphicon glyphicon-lock"></i> Sign up</a></li>
					</c:when>
					<c:when test="${currentUser != null }">
						<li class="dropdown"><a aria-expanded="false"
							class="dropdown-toggle" role="button" data-toggle="dropdown"
							href="#"> <img alt="avatar" class="img-circle"
								style="height: 20px;"
								src="<c:out value='${url_context}/profile/profile_image/${currentUser.userID }' default='http://myclass.vn/wp-content/uploads/avatars/8474/3cdbd16e40f54cc05287640f1cb182ff-bpfull.png' />">
								Hi, <c:out value='${currentUser.displayName}' default='${currentUser.userName}' /> <span
								class="caret"></span>
						</a>
							<ul id="g-account-menu" class="dropdown-menu" role="menu">
								<li><a href="${url_context}/profile/profile_info"><i
										class="glyphicon glyphicon-user"></i> My Profile</a></li>
								<li><a href="${url_context}dashboard"><i
										class="glyphicon glyphicon-tasks"></i> Dashboard</a></li>
							</ul></li>
						<li><a href="${url_context}logout"><i class="glyphicon glyphicon-off"></i>
								Logout</a></li>
					</c:when>
				</c:choose>

			</ul>
			
		</div>
		<!-- /.navbar-collapse -->
	</div>
	<!-- /.container -->
</nav>