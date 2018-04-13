<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>Learning...</title>

<!-- Bootstrap Core CSS -->
<link href="resources/css/bootstrap.min.css" rel="stylesheet">

<!-- Custom CSS -->
<link href="resources/css/modern-business.css" rel="stylesheet">

<!-- Custom Fonts -->
<link href="resources/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body>
<% response.sendRedirect("home.html"); %>
	<!-- Navigation -->
	<nav class="navbar navbar-default navbar-fixed-top" role="navigation">
		<div class="container">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#bs-example-navbar-collapse-1">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="index.html">Learning By Video</a>
			</div>
			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav navbar-right">
					<li><a href="about.html">About</a></li>
					<li><a href="services.html">Services</a></li>
					<li><a href="contact.html">Contact</a></li>
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown">Portfolio <b class="caret"></b></a>
						<ul class="dropdown-menu">
							<li><a href="portfolio-1-col.html">1 Column Portfolio</a></li>
							<li><a href="portfolio-2-col.html">2 Column Portfolio</a></li>
							<li><a href="portfolio-3-col.html">3 Column Portfolio</a></li>
							<li><a href="portfolio-4-col.html">4 Column Portfolio</a></li>
							<li><a href="portfolio-item.html">Single Portfolio Item</a>
							</li>
						</ul></li>
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown">Blog <b class="caret"></b></a>
						<ul class="dropdown-menu">
							<li><a href="blog-home-1.html">Blog Home 1</a></li>
							<li><a href="blog-home-2.html">Blog Home 2</a></li>
							<li><a href="blog-post.html">Blog Post</a></li>
						</ul></li>
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown">Other Pages <b class="caret"></b></a>
						<ul class="dropdown-menu">
							<li><a href="full-width.html">Full Width Page</a></li>
							<li><a href="sidebar.html">Sidebar Page</a></li>
							<li><a href="faq.html">FAQ</a></li>
							<li><a href="404.html">404</a></li>
							<li><a href="pricing.html">Pricing Table</a></li>
						</ul></li>
					<li role="presentation"><a href="views/signup">Sign up</a></li>
				</ul>
			</div>
			<!-- /.navbar-collapse -->
		</div>
		<!-- /.container -->
	</nav>

	<!-- Header Carousel -->
	<header id="myCarousel" class="carousel slide">
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

		<!-- Marketing Icons Section -->
		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">Welcome to Modern Business</h1>
			</div>
			<div class="col-md-4">
				<div class="panel panel-default">
					<div class="panel-heading">
						<h4>
							<i class="fa fa-fw fa-check"></i> Bootstrap v3.2.0
						</h4>
					</div>
					<div class="panel-body">
						<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
							Itaque, optio corporis quae nulla aspernatur in alias at numquam
							rerum ea excepturi expedita tenetur assumenda voluptatibus
							eveniet incidunt dicta nostrum quod?</p>
						<a href="#" class="btn btn-default">Learn More</a>
					</div>
				</div>
			</div>
			<div class="col-md-4">
				<div class="panel panel-default">
					<div class="panel-heading">
						<h4>
							<i class="fa fa-fw fa-gift"></i> Free &amp; Open Source
						</h4>
					</div>
					<div class="panel-body">
						<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
							Itaque, optio corporis quae nulla aspernatur in alias at numquam
							rerum ea excepturi expedita tenetur assumenda voluptatibus
							eveniet incidunt dicta nostrum quod?</p>
						<a href="#" class="btn btn-default">Learn More</a>
					</div>
				</div>
			</div>
			<div class="col-md-4">
				<div class="panel panel-default">
					<div class="panel-heading">
						<h4>
							<i class="fa fa-fw fa-compass"></i> Easy to Use
						</h4>
					</div>
					<div class="panel-body">
						<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
							Itaque, optio corporis quae nulla aspernatur in alias at numquam
							rerum ea excepturi expedita tenetur assumenda voluptatibus
							eveniet incidunt dicta nostrum quod?</p>
						<a href="#" class="btn btn-default">Learn More</a>
					</div>
				</div>
			</div>
		</div>
		<!-- /.row -->

		<!-- Portfolio Section -->
		<div class="row">
			<div class="col-lg-12">
				<h2 class="page-header">Portfolio Heading</h2>
			</div>
			<div class="col-md-4 col-sm-6">
				<a href="portfolio-item.html"> <img
					class="img-responsive img-portfolio img-hover"
					src="http://placehold.it/700x450" alt="">
				</a>
			</div>
			<div class="col-md-4 col-sm-6">
				<a href="portfolio-item.html"> <img
					class="img-responsive img-portfolio img-hover"
					src="http://placehold.it/700x450" alt="">
				</a>
			</div>
			<div class="col-md-4 col-sm-6">
				<a href="portfolio-item.html"> <img
					class="img-responsive img-portfolio img-hover"
					src="http://placehold.it/700x450" alt="">
				</a>
			</div>
			<div class="col-md-4 col-sm-6">
				<a href="portfolio-item.html"> <img
					class="img-responsive img-portfolio img-hover"
					src="http://placehold.it/700x450" alt="">
				</a>
			</div>
			<div class="col-md-4 col-sm-6">
				<a href="portfolio-item.html"> <img
					class="img-responsive img-portfolio img-hover"
					src="http://placehold.it/700x450" alt="">
				</a>
			</div>
			<div class="col-md-4 col-sm-6">
				<a href="portfolio-item.html"> <img
					class="img-responsive img-portfolio img-hover"
					src="http://placehold.it/700x450" alt="">
				</a>
			</div>
		</div>
		<!-- /.row -->

		<!-- Features Section -->
		<div class="row">
			<div class="col-lg-12">
				<h2 class="page-header">Modern Business Features</h2>
			</div>
			<div class="col-md-6">
				<p>The Modern Business template by Start Bootstrap includes:</p>
				<ul>
					<li><strong>Bootstrap v3.2.0</strong></li>
					<li>jQuery v1.11.0</li>
					<li>Font Awesome v4.1.0</li>
					<li>Working PHP contact form with validation</li>
					<li>Unstyled page elements for easy customization</li>
					<li>17 HTML pages</li>
				</ul>
				<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
					Corporis, omnis doloremque non cum id reprehenderit, quisquam totam
					aspernatur tempora minima unde aliquid ea culpa sunt. Reiciendis
					quia dolorum ducimus unde.</p>
			</div>
			<div class="col-md-6">
				<img class="img-responsive" src="http://placehold.it/700x450" alt="">
			</div>
		</div>
		<!-- /.row -->

		<hr>

		<!-- Call to Action Section -->
		<div class="well">
			<div class="row">
				<div class="col-md-8">
					<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
						Molestias, expedita, saepe, vero rerum deleniti beatae veniam
						harum neque nemo praesentium cum alias asperiores commodi.</p>
				</div>
				<div class="col-md-4">
					<a class="btn btn-lg btn-default btn-block" href="#">Call to
						Action</a>
				</div>
			</div>
		</div>

		<hr>

		<!-- Footer -->
		<footer>
			<div class="row">
				<div class="col-lg-12">
					<p>Copyright &copy; Your Website 2016</p>
				</div>
			</div>
		</footer>

	</div>
	<!-- /.container -->

	<!-- jQuery -->
	<script src="resources/js/jquery.js"></script>

	<!-- Bootstrap Core JavaScript -->
	<script src="resources/js/bootstrap.min.js"></script>

	<!-- Script to Activate the Carousel -->
	<script>
		$('.carousel').carousel({
			interval : 5000
		//changes the speed
		})
	</script>

</body>

</html>
