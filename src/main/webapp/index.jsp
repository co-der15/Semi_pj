<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login Main</title>
<link rel="stylesheet" type="text/css" href="http://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
<link rel="stylesheet" href="/travelMaker/resources/css/common.css">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script type="text/javascript" src="http://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
<script>
	$(function(){
		$('.continent').slick();
	})
</script>

<style>

.continent{
	position: relative;
	padding: 20px;
}

img{
	width: 70%;
	height: 70%;
	display: flex;
	transfrom: translateX(0);
}

.slick-arrow{
	position: absolute;
	border: none;
	text-indent: -9999px;
	top: 20%;
	width: 60px;
	height: 60px;
	z-index: 100;
}

.slick-prev{
	background: url(/travelMaker/resources/images/chevrons-left-solid-24.png) no-repeat 0 0;
}


.slick-next{
	background: url(/travelMaker/resources/images/chevrons-right-solid-24.png) no-repeat 0 0;
	left: 90%;
}

h1{
color: white;
}


</style>


</head>
<body>
	<%@ include file="/views/common/banner.jsp" %> 
	<%@ include file="/views/common/sidebar.jsp" %>  
	<%@ include file="/views/common/footer.jsp" %> 

			<div class="continent" data-slick='{"slidesToShow": 1, "slidesToScroll": 1}'>
  				<div class="1">
  					<a href="">
  					<h1>Asia</h1>
  					<img src="resources/images/continent/151642-2196f3.png" alt="" />  					
  					</a>
  				</div>
  				<div class="1">
  				<a href="">
					<h1>Australia</h1>  				
  					<img src="resources/images/continent/306393-2196f3.png" alt="" />
  				</a>
  				</div>
				 <div class="1">
				 	<a href="">
				 	<h1>North America</h1>
  					<img src="resources/images/continent/307195-2196f3.png" alt="" />				 	
				 	</a>
  				</div>
  				 <div class="1">
  				 <a href="">
					<h1>South America</h1>  				 
  					<img src="resources/images/continent/311014-2196f3.png" alt="" />
  				 </a>
  				</div>
  				<div class="1">
  				<a href="/travelMaker/views/movie/movie.jsp">
					<h1>Europe</h1>  				
  					<img src="resources/images/continent/151641-2196f3.png" alt="" />
  				</a>
  				</div>
  				<div class="1">
  					<a href="">
					<h1>Africa</h1>  					
  					<img src="resources/images/continent/151640-2196f3.png" alt="" />
  					</a>
  				</div>
  			</div>
	
</body>
</html>