<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<%@ include file="includes/meta.jsp"%>

<title>Learning more - Home page
</title>
<%@ include file="includes/script-style-common.jsp"%>
</head>

<body>
	<%@ include file="includes/header.jsp"%>
	
		<!-- Header Carousel -->
		<header id="myCarousel" class="container carousel slide">
			<!-- Indicators -->
			<ol class="carousel-indicators">
				<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
				<li data-target="#myCarousel" data-slide-to="1"></li>
				<li data-target="#myCarousel" data-slide-to="2"></li>
				<li data-target="#myCarousel" data-slide-to="3"></li>
				<li data-target="#myCarousel" data-slide-to="4"></li>
				<li data-target="#myCarousel" data-slide-to="5"></li>
				<li data-target="#myCarousel" data-slide-to="6"></li>
				<li data-target="#myCarousel" data-slide-to="7"></li>
			</ol>

			<!-- Wrapper for slides -->
			<div class="carousel-inner">
				<div class="item active">
					<div class="fill"
						style="background-image: url('resources/images/slide/pic1.jpg');"></div>
					<div class="carousel-caption">
						<h2>Caption 1</h2>
					</div>
				</div>
				<div class="item">
					<div class="fill"
						style="background-image: url('resources/images/slide/pic2.jpg');"></div>
					<div class="carousel-caption">
						<h2>Caption 2</h2>
					</div>
				</div>
				<div class="item">
					<div class="fill"
						style="background-image: url('resources/images/slide/pic3.jpg');"></div>
					<div class="carousel-caption">
						<h2>Caption 3</h2>
					</div>
				</div>
				<div class="item">
					<div class="fill"
						style="background-image: url('resources/images/slide/pic4.jpg');"></div>
					<div class="carousel-caption">
						<h2>Caption 3</h2>
					</div>
				</div>
				<div class="item">
					<div class="fill"
						style="background-image: url('resources/images/slide/pic5.jpg');"></div>
					<div class="carousel-caption">
						<h2>Caption 3</h2>
					</div>
				</div>
				<div class="item">
					<div class="fill"
						style="background-image: url('resources/images/slide/pic6.jpg');"></div>
					<div class="carousel-caption">
						<h2>Caption 3</h2>
					</div>
				</div>
				<div class="item">
					<div class="fill"
						style="background-image: url('resources/images/slide/pic7.jpg');"></div>
					<div class="carousel-caption">
						<h2>Caption 3</h2>
					</div>
				</div>
				<div class="item">
					<div class="fill"
						style="background-image: url('resources/images/slide/pic8.jpg') no-repeat center center fixed;"></div>
					<div class="carousel-caption">
						<h2>Caption 3</h2>
					</div>
				</div>
			</div>

			<!-- Controls -->
			<a class="left carousel-control" href="#myCarousel" data-slide="prev">
				<span class="icon-prev"></span>
			</a> <a class="right carousel-control" href="#myCarousel"
				data-slide="next"> <span class="icon-next"></span>
			</a>
		</header>

	<!-- Page Content -->
	<div class="container">

		<!-- Newest Section -->
		<div class="row">
			<div class="col-lg-12">
				<h2 class="page-header">Newest courses </h2>
			</div>
			<c:forEach items="${newCourseList}" var="course">
				<div class="col-md-3 col-sm-6">
					<div class="panel panel-default text-center">
						<div class="panel-heading">
							<a href="enrollment/detail_course?courseID=${course.courseID }"><img class="img-responsive img-hover img-related" style="width: 400px; height: 200px;"
										src="management_course/image_cover/${course.courseID }" alt=""></a>
							<h4 class="text-right">
							<c:choose>
								<c:when test="${course.price eq 0}"><span class="label label-danger">Free</span></c:when>
								<c:otherwise><span class="label label-success">${course.price } VND</span></c:otherwise>
							</c:choose>
							</h4>
						</div>
						<div class="panel-body">
							<h4><strong>${course.courseName }</strong></h4>
							<input type="number" data-disabled="true"
									class="rating hide course-rate" min=0 max=5 step=0.1 value="${course.rate}"
									data-size="xs" data-show-clear="false">
						</div>
						<ul class="list-group">
							<li class="list-group-item"><strong>
									${course.registerCount }</strong> Members</li>
							<li class="list-group-item"><a href="enrollment/detail_course?courseID=${course.courseID }" class="btn btn-primary">See More</a></li>
						</ul>
					</div>
				</div>
			</c:forEach>
		</div>
		<!-- /.row -->
		<!-- most popular courses  Section -->
		<div class="row">
			<div class="col-lg-12">
				<h2 class="page-header">Most popular courses </h2>
			</div>
			<c:forEach items="${topCourseList}" var="course">
				<div class="col-md-3 col-sm-6">
					<div class="panel panel-default text-center">
						<div class="panel-heading">
							<a href="enrollment/detail_course?courseID=${course.courseID }"><img class="img-responsive img-hover img-related" style="width: 400px; height: 200px;"
										src="management_course/image_cover/${course.courseID }" alt=""></a>
							<h4 class="text-right">
							<c:choose>
								<c:when test="${course.price eq 0}"><span class="label label-danger">Free</span></c:when>
								<c:otherwise><span class="label label-success">${course.price } VND</span></c:otherwise>
							</c:choose>
							</h4>
						</div>
						<div class="panel-body">
							<h4><strong>${course.courseName }</strong></h4>
							<input type="number" data-disabled="true"
									class="rating hide course-rate" min=0 max=5 step=0.1 value="${course.rate}"
									data-size="xs" data-show-clear="false">
						</div>
						<ul class="list-group">
							<li class="list-group-item"><strong>
									${course.registerCount }</strong> Members</li>
							<li class="list-group-item"><a href="enrollment/detail_course?courseID=${course.courseID }" class="btn btn-primary">See More</a></li>
						</ul>
					</div>
				</div>
			</c:forEach>
		</div>
		<!-- /.row -->
		<hr>

		<%@ include file="includes/footer.jsp"%>

	</div>
	<!-- /.container -->

	<%@ include file="includes/script-footer.jsp"%>

	<!-- Script to Activate the Carousel -->
	<script>
		$('.carousel').carousel({
			interval : 5000
		//changes the speed
		})
		$('.course-rate').rating();
	</script>

</body>

</html>
