<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isErrorPage="true"%>
    
<%
	String msg = (String)request.getAttribute("error-msg");
%>
<!doctype html>
<html>
<head>
	<meta charset="UTF-8" />
	<title>에러 페이지</title>
<link rel="stylesheet" href="/travelMaker/resources/css/common.css">
	<script src="/travelMaker/resources/js/jquery-3.6.0.min.js"></script>
	<style>
		section {
			width : 600px;
			padding : 20px;
			background : white;
			margin-left : auto;
			margin-right: auto;
			margin-top:30px;
		}
	</style>
</head>
<body>
	<%@ include file="../common/banner.jsp" %>
	<%@ include file="/views/common/sidebar.jsp" %>  
	<%@ include file="/views/common/footer.jsp" %> 	
	
	<section>
		<h1>서비스 에러 발생!</h1>
		<h3 style="color : red;"> ERROR :: <%= msg %> </h3>
		<p>
		서비스 수행 중 에러가 발생하였습니다.<br>
		해당 페이지가 계속 보인다면, 담당자에게 문의 하세요.<br>
		<br>
		<a href="/travelMaker/index.jsp">홈 화면으로 돌아가기....</a>
		
		</p>
	</section>
	
	<%@ include file="footer.jsp" %>
</body>
</html>