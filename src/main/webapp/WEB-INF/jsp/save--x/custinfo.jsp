<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<!-- Head Tag -->
<%@ include file="/WEB-INF/jsp/includes/head-tag.jsp"%>
<style>
	form {
		margin-top: 25px;
		margin-bottom: 50px;
	}
	input {
		margin-top: 25px;
	}
</style>
<!-- BODY -->
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
	
	<!-- 고객정보 입력 양식 -->
	<div class="container">
		<h2>1. 고객정보</h2>
		<form class="row g-3" method="POST" action="/MRStest/board/sprtinfo">
			<div class="col-md-12"> 
				<input type="text" class="form-control" placeholder="고객사" name="customer_company">
			</div>
			<div class="col-md-6">
				<input type="text" class="form-control" placeholder="담당자" name="customer_manager">
			</div>
			<div class="col-md-6">
				<input type="text" class="form-control" placeholder="부서" name="customer_department">
			</div>
			<div class="col-md-12">
				<input type="email" class="form-control"placeholder="이메일" name="customer_email">
			</div>
			<div class="col-md-12">
				<input type="text" class="form-control" placeholder="연락처" name="customer_contact">
			</div>
			<input type="submit" class="btn btn-primary pull-right" value="다음">
		</form>
	</div>

	
	<!-- Script Tag -->
	<%@ include file="/WEB-INF/jsp/includes/script-tag.jsp"%>
</body>
</html>