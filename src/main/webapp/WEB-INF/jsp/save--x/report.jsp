<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<!-- Head Tag -->
<%@ include file="/WEB-INF/jsp/includes/head-tag.jsp"%>

<body>

	<!-- 네비게이션바 -->
	<nav class="navbar navbar-default">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
				aria-expanded="false">
				<span class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="http://localhost:9000/MRStest/">MRS</a>
		</div>
		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li><a href="http://localhost:9000/MRStest/home">Home</a></li>
				<li class="active"><a href="http://localhost:9000/MRStest/board">Board</a></li>
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expanded="false">접속하기<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="http://localhost:9000/MRStest/login">로그인</a></li>
						<li><a href="http://localhost:9000/MRStest/join">회원가입</a></li>
					</ul>
				</li>
			</ul>
		</div>
	</nav>
	
	<!-- 새로 등록한 보고서 양식 -->
	<h1>REPORT</h1>

</body>
</html>