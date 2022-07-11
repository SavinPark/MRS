<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- <%@ page import="java.io.PrintWriter"%> -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<!-- Head Tag -->
<%@ include file="/WEB-INF/jsp/includes/head-tag.jsp"%>
<!-- BODY -->
<body>
	<% // System.out.println("세션 :"+request.getSession().getAttribute("employee")); %>
	
	<!-- 네비게이션 바 -->
	<%@ include file="/WEB-INF/jsp/includes/nav.jsp"%>
	
	<!-- About Spring (jumbotron 사용) -->
	<div class="container">
		<div class="jumbotron">
			<div class="container">
				<h1>MRS</h1>
				<p>이 웹 페이지는 유지보수 보고서 관리시스템 MRS 입니다. <br/>Spring 기반에 MyBatis와 MySQL을 활용하였고, 디자인 템플릿으로는 Bootstrap을 사용하였습니다.</p>
				<h2>Spring Framework</h2>
				<p>
					스프링 프레임워크는 자바 플랫폼을 위한 오픈 소스 애플리케이션 프레임워크로서 간단히 스프링이라고도 합니다. 
					동적인 웹 사이트를 개발하기 위한 여러 가지 서비스를 제공하고 있습니다.
				</p>
				<h2>Bootstrap</h2>
				<p>
					부트스트랩은 웹사이트를 쉽게 만들 수 있게 도와주는 HTML, CSS, JS 프레임워크입니다.<br>하나의
					CSS로 휴대폰, 태블릿, 데스크탑까지 다양한 기기에서 작동합니다.<br>다양한 기능을 제공하여 사용자가 쉽게
					웹사이트를 제작, 유지, 보수할 수 있도록 도와줍니다.
				</p>
				<p>
					<a class="btn btn-primary btn-pull"
						href="https://spring.io/" role="button">more about
						Spring</a>
					<a class="btn btn-primary btn-pull"
						href="https://getbootstrap.com/" role="button">more about
						Bootstrap</a>
				</p>
			</div>
		</div>
	</div>

	<!-- 이미지 슬라이드 --> 
	<div class="container">
		<div id="myCarousel" class="carousel slide" data-ride="carousel">
			<ol class="carousel-indicators">
				<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
				<li data-target="#myCarousel" data-slide-to="1"></li>
				<li data-target="#myCarousel" data-slide-to="2"></li>
			</ol>
			<div class="carousel-inner" style="height: 700px">
				<div class="item active">
					<img src="http://maple9192.cafe24.com/pages/upload/board/m212/1612/08/20161208_662b11f10ae4946e7c1008da14d7fa4c.jpg">
				</div>
				<div class="item">
					<img src="https://t1.daumcdn.net/cfile/tistory/996DF93C5E17C54122">
				</div>
				<div class="item">
					<img src="https://bingvsdevportalprodgbl.blob.core.windows.net/demo-images/9b3b22ca-d065-40a9-b5d8-2296beb8c717.jpeg">
				</div>
			</div>
			<a class="left carousel-control" href="#myCarousel" data-slide="prev">
				<span class="glyphicon glyphicon-chevron-left"></span>
			</a> <a class="right carousel-control" href="#myCarousel"
				data-slide="next"> <span
				class="glyphicon glyphicon-chevron-right"></span>
			</a>
		</div>
	</div>


	<!-- Script Tag -->
	<%@ include file="/WEB-INF/jsp/includes/script-tag.jsp"%>
	<script type="text/javascript"><%@ include file="/js/pathname.js" %></script>
	
</body>
</html>