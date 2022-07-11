<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!-- 네비게이션 바 [ Home ] -->
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
				<li class="active"><a href="http://localhost:9000/MRStest/home">Home</a></li>
				<li><a href="http://localhost:9000/MRStest/employee">Employee Info</a></li>
				<li><a href="http://localhost:9000/MRStest/customer">Customer Info</a></li>
				<li><a href="http://localhost:9000/MRStest/support">Support Board</a></li>
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown">
					<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
						<c:if test="${employee == null}">접속하기</c:if>
						<c:if test="${employee != null }">MY</c:if>
						<span class="caret"></span>
					</a>
					<c:if test="${employee == null}">
					<ul class="dropdown-menu">
						<li style="cursor: pointer;"><a class="dropdown-item" href="http://localhost:9000/MRStest/login">로그인</a></li>
						<li><a class="dropdown-item" href="http://localhost:9000/MRStest/join">회원가입</a></li>
					</ul>
					</c:if>
					
					<c:if test="${employee != null }">
						<ul class="dropdown-menu">
							<li><a class="dropdown-item" href="http://localhost:9000/MRStest/logoutAction">로그아웃</a></li>
							<li><a class="dropdown-item" href="http://localhost:9000/MRStest/mypage">마이페이지</a></li>
						</ul>
					</c:if>
				</li>
			</ul>
		</div>
	</nav>