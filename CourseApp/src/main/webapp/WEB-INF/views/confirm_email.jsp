<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="includes/meta.jsp"%>
<title>Confirm email</title>

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
							<h3 class="panel-title text-center">Confirm email</h3>
						</div>
						<div class="panel-body">
							<div class="row">
								<h4 class="text-center">
								<c:if test="${a==1 }">
								
								</c:if>
									<c:choose>
										<c:when test="${result == 1}">
											<c:out value="Chúc mừng, tài khoản của bạn đã được kích hoạt. Vui lòng đăng nhập để sử dụng dịch vụ."></c:out>
										</c:when>
										<c:when test="${result == 0}">
											<span style="color:red;">
												<c:out value="Xin lỗi, tài khoản này đã được kích hoạt trước đó. Vui lòng liên hệ admin để biết thêm thông tin."></c:out>
											</span>
										</c:when>
										<c:otherwise>
											<span style="color:red;">
												<c:out value="Xin lỗi, không thể kích hoạt tài khoản. Vui lòng liên hệ admin để biết thêm thông tin."></c:out>
											</span>
										</c:otherwise>
									</c:choose>
									
								</h4>

							</div>
							<div class="row">
								<div class="col-sm-6" style="margin-bottom: 10px">
									<a class="btn btn-success btn-block">Go to Profile</a>
								</div>
								<div class="col-sm-6">
									<a class="btn btn-primary btn-block" href="home.html">Go to Home</a>
								</div>
							</div>
						</div>
					</div>

				</div>
			</div>

		</div>
		

		<br><br><br><br><br><br><br><br><br><br><br><br><br><br><hr>
		<%@ include file="includes/footer.jsp"%>
	</div>
	<!-- /.container -->

	<%@ include file="includes/script-footer.jsp"%>
	
</body>
</html>