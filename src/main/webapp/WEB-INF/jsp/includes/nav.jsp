<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!-- 네비게이션 바 [ Primary ] -->
<!-- class="active" 속성을 제외시킨 기본형. 
	 URL의 pathname과 일치하는 각 메뉴의 id값으로 해당 요소를 찾아 동적으로 class="active"를 추가 -->
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
				<li id="/MRStest/home"><a href="http://localhost:9000/MRStest/home">Home</a></li>
				<li id="/MRStest/employee"><a href="http://localhost:9000/MRStest/employee">Employee Info</a></li>
				<li id="/MRStest/customer"><a href="http://localhost:9000/MRStest/customer">Customer Info</a></li>
				<li id="/MRStest/support"><a href="http://localhost:9000/MRStest/support">Support Board</a></li>
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
						<li id="/MRStest/login" style="cursor: pointer;"><a class="dropdown-item" href="http://localhost:9000/MRStest/login">로그인</a></li>
						<li id="/MRStest/join"><a class="dropdown-item" href="http://localhost:9000/MRStest/join">회원가입</a></li>
					</ul>
					</c:if>
					
					<c:if test="${employee != null }">
						<ul class="dropdown-menu">
							<li id="/MRStest/logout"><a class="dropdown-item" href="http://localhost:9000/MRStest/logoutAction">로그아웃</a></li>
							<li id="/MRStest/mypage"><a class="dropdown-item" href="http://localhost:9000/MRStest/mypage?employee_id=${employee.employee_id}">마이페이지</a></li>
						</ul>
					</c:if>
				</li>
			</ul>
		</div>
		<!-- 현재 로그인 계정 : ${employee.employee_id} -->
	</nav>