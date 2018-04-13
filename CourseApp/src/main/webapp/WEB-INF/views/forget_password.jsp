<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="includes/meta.jsp"%>
<title>Forgot password</title>
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
							<h3 class="panel-title text-center">Forgot password</h3>
						</div>
						<div class="panel-body">
							<div class="row">
								<form class="form-horizontal" id="forgot_passwordForm">
									<div class="form-group">
										<label for="inputEmail"
											class="col-md-3 col-sm-3 control-label">Your email:</label>
										<div class="col-md-8 col-sm-8 controls">
											<input require="true" class="form-control" id="inputEmail-forgot"
												placeholder="Email" name="email" />
										</div>
									</div>
									<div class="form-group">
										<div class="col-sm-offset-7 col-sm-4">
											<input type="button" id="btn-submit" value="Submit" class="btn btn-primary btn-block">
										</div>
									</div>
								</form>
								
							</div>
						</div>
					</div>

				</div>
			</div>

		</div>
		<hr>
		<%@ include file="includes/footer.jsp"%>
	</div>
	<!-- /.container -->

	<%@ include file="includes/script-footer.jsp"%>
	<script type="text/javascript">
		$('#btn-submit').click(function(){
				var email = $('#inputEmail-forgot').val();
				
				$.ajax({
					type: 'POST',
					url: 'forgot_password?email='+email,
					success: function(data){
						if(data == 'done'){
							alert("Done. A link reset password is send to your email inbox.")
							window.location.href="home.html";
						}
						else if(data == 'email_invalid'){
							alert("Email is invalid.");
						}else if(data == 'error'){
							alert("Error.");
						}
					},
					error: function(err){
						alert(err);
					}
				});
		});
	</script>
</body>
</html>