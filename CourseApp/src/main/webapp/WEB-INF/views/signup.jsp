<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="includes/meta.jsp"%>
<title>Sign up</title>
<%@ include file="includes/script-style-common.jsp"%>

</head>
<body>
	<%@ include file="includes/header.jsp"%>
	<div class="container">
		<div class="row">
			<div class="col-md-6 col-md-offset-3">
				<div style="margin: 20px;">
					<div class="panel panel-default">
						<div class="panel-heading">
							<h3 class="panel-title text-center">Sign up</h3>
						</div>
						<div class="panel-body">
							<div class="row">
								<form:form action="signup.html" method="POST"
									commandName="account" class="form-horizontal" id="signupForm">
									<div class="form-group">
										<label for="inputFullname"
											class="col-md-3 col-sm-3 control-label">Full name</label>
										<div class="col-md-8 col-sm-8 controls">
											<form:input path="fullName" require="true"
												class="form-control" id="inputFullname"
												placeholder="Full name" />
											<p class="help-block"></p>
										</div>
									</div>
									<%-- <div class="form-group">
									<label for="inputUserID"
										class="col-md-3 col-sm-3 control-label">Full name</label>
									<div class="col-md-9 col-sm-9">
										<form:hidden path="userID"
											class="form-control" id="inputUserID"
											placeholder="Full name" />
									</div>
								</div> --%>
									<div class="form-group">
										<label for="inputUsername"
											class="col-md-3 col-sm-3 control-label">User name</label>
										<div class="col-md-8 col-sm-8">
											<form:input path="userName" type="text" class="form-control"
												id="inputUsername" placeholder="User name" />
										</div>
									</div>
									<div class="form-group">
										<label for="inputEmail3"
											class="col-md-3 col-sm-3 control-label">Email</label>
										<div class="col-md-8 col-sm-8">
											<form:input path="email" type="email" class="form-control"
												id="inputEmail3" placeholder="Email" />
										</div>
									</div>
									<div class="form-group">
										<label for="inputPassword"
											class="col-md-3 col-sm-3 control-label">Password</label>
										<div class="col-md-8 col-sm-8">
											<form:password path="password" class="form-control"
												id="inputPassword" placeholder="Password" />
										</div>
									</div>
									<div class="form-group">
										<label for="inputConfirmPassword"
											class="col-md-3 col-sm-3 control-label">Confirm
											Password</label>
										<div class="col-md-8 col-sm-8">
											<input type="password" class="form-control"
												name="confirmPassword" id="inputConfirmPassword"
												placeholder="Password">
										</div>
									</div>
									<div class="form-group">
										<div class="col-sm-offset-3 col-sm-9">
											<div class="checkbox">
												<label> <input type="checkbox" name="acceptTerms">
													I agree to the <a>Terms of Service</a> and <a>Privacy
														Policy</a>
												</label>
											</div>
										</div>
									</div>
									<div class="form-group">
										<div class="col-sm-offset-7 col-sm-4">
											<input type="button" value="Sign up" id="btnSubmit"
												class="btn btn-primary btn-block">
										</div>
									</div>
								</form:form>
								<div class="col-md-10 col-md-offset-1 hidden" id="my-progress">
									<div class="progress">
										<div class="progress-bar progress-bar-striped active"
											role="progressbar" aria-valuemin="0" aria-valuemax="100"
											style="width: 100%"></div>
									</div>
								</div>
							</div>
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
										class="fa fa-google-plus"></i>Sign up with Google
									</a>
								</div>
								<div class="col-sm-6">
									<a class="btn btn-block btn-social btn-facebook"> <i
										class="fa fa-facebook"></i>Sign up with Facebook
									</a>
								</div>
							</div>
						 -->
						</div>
					</div>

				</div>
			</div>

		</div>
		<div class="row text-center">
			<p>
				Already have an account? <a>Log in.</a>
			</p>
		</div>

		<hr>
		<%@ include file="includes/footer.jsp"%>
	</div>
	<!-- /.container -->

	<%@ include file="includes/script-footer.jsp"%>
	<script type="text/javascript">
		var flag = false;
		$('#signupForm')
				.bootstrapValidator(
						{
							//live: 'disabled',

							message : 'this value is not valid',
							/* feedbackIcons : {
								valid : 'glyphicon glyphicon-ok',
								invalid : 'glyphicon glyphicon-remove',
								validating : 'glyphicon glyphicon-refresh'
							}, */
							fields : {
								fullName : {
									validators : {
										notEmpty : {
											message : 'The full name is required and cannot be empty'
										}
									}
								},
								userName : {
									validators : {
										notEmpty : {
											message : 'The user name is required and cannot be empty'
										},
										stringLength : {
											min : 6,
											max : 30,
											message : 'The username must be more than 6 and less than 30 characters long'
										},
										regexp : {
											regexp : /^[a-zA-Z0-9_\.]+$/,
											message : 'The username can only consist of alphabetical, number, dot and underscore'
										},
										remote : {
											type : 'GET',
											url : 'validate_username',
											message : 'The username is not available'
										}
									}
								},
								email : {
									validators : {
										notEmpty : {
											message : 'The email is required and cannot be empty'
										},
										emailAddrees : {
											message : 'The input is not a valid email address'
										},
										remote : {
											type : 'GET',
											url : 'validate_email',
											message : 'The email is not available'
										}
									}
								},
								password : {
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
											field : 'password',
											message : 'The password and its confirm are not the same'
										}
									}
								},
								acceptTerms : {
									validators : {
										notEmpty : {
											message : 'You have to accept the terms and policies'
										}
									}
								}
							}
						}).on('error.form.bv', function(e) {
					console.log('error.form.bv');

					// You can get the form instance and then access API
					//var $form = $(e.target);
					//console.log($form.data('bootstrapValidator')
					//	.getInvalidFields());

					// If you want to prevent the default handler (bootstrapValidator._onError(e))
					// e.preventDefault();
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

		//Submit form
		$('#btnSubmit')
				.click(
						function(e) {

							$('#signupForm').bootstrapValidator(
									'validate'); 
							//alert(flag);
							if (flag == true) {
								//alert('dfhdghdfghdfhdfhgdfkghdfg');
								//alert('13544646');
								var myprogress = $('#my-progress');
								myprogress.removeClass("hidden");
								var frm = $('#signupForm');
								//e.preventDefault();

								var data = {};
								//var Form = this;
								
								
								var $inputs = $('#signupForm :input');
								
								$inputs.each(function(){
									data[this.name] = $(this).val();
									delete data[""];
									delete data["acceptTerms"];
									delete data["confirmPassword"];
								});
									$
										.ajax({
											Accept : "application/json",
											contentType : "application/json",
											type : "POST",
											url : "signup",

											data : JSON.stringify(data),
											beforeSend : function(xhr) {
												xhr.setRequestHeader("Accept",
														"application/json");
												xhr.setRequestHeader(
														"Content-Type",
														"application/json");
											},
											success : function(callback) {
												myprogress.addClass("hidden");
												if (callback = "true") {
													bootbox
															.dialog({
																message : "Tài khoản đã được tạo. Vui lòng kiểm tra email để xác nhận tài khoản trước khi sử dụng.",
																title : "Đăng ký thành công",
																buttons : {
																	gohome : {
																		label : "Go home page!",
																		className : "btn-primary",
																		callback : function() {
																			window.location.href = "home.html";
																		}
																	}
																}
															});
												} else {

												}
											},
											error : function(jqXHR, textStatus,
													errorThrown) {
												alert(errorThrown);
											}
										});
							}
						});
	</script>
</body>
</html>