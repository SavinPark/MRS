<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!-- 
<%@ page import="java.io.PrintWriter"%>
<%@ page import="controller.MainController"%>
<%@ page import="dto.BoardVO"%>
<%@ page import="java.util.ArrayList"%>
-->

<!DOCTYPE html>
<html>
<!-- Head Tag -->
<%@ include file="/WEB-INF/jsp/includes/head-tag.jsp"%>
<style>
	.view:link {
		color: #000;
		text-decoration:none;
	}
	.view:visited {
		color: #000;
		text-decoration:none;
	}
	.view:hover {
		color: purple;
		text-decoration:none;
	}
</style>
<!-- BODY -->
<body>

	<%
		// 로그인을 한 사람은 로그인 정보를 담을 수 있도록
		// 현재 세션이 존재하는 사람은 userID, 아닌 사람은 null값이 담김
		//String userID = null;
		//if (session.getAttribute("userID") != null) {
		//	userID = (String) session.getAttribute("userID");
		//}
		int pageNumber = 1; // 기본 페이지
		if (request.getParameter("pageNumber") != null) {
			pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
		}
	%>

	<!-- 네비게이션 바 -->
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
				<li><a href="http://localhost:9000/MRStest/employee">Employee Info</a></li>
				<li><a href="http://localhost:9000/MRStest/customer">Customer Info</a></li>
				<li class="active"><a href="http://localhost:9000/MRStest/support">Support Board</a></li>
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expanded="false">접속하기<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a class="dropdown-item" href="http://localhost:9000/MRStest/login">로그인</a></li>
						<li><a class="dropdown-item" href="http://localhost:9000/MRStest/join">회원가입</a></li>
					</ul>
				</li>
			</ul>
		</div>
	</nav>

	<!-- Support Board -->
	<div class="container">
		<div class="row">
			<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd; margin-top: 25px;">
				<thead>
					<tr>
						<th style="background-color: #eeeeee; text-align: center;">번호</th>
						<th style="background-color: #eeeeee; text-align: center;">제목</th>
						<th style="background-color: #eeeeee; text-align: center;">지원</th>
						<th style="background-color: #eeeeee; text-align: center;">지원일</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${boardList}" var="board">
						<tr>
							<td>${board.board_idx}</td>
							<td><a href="http://localhost:9000/MRStest/board/view?boardID=${board.support_idx}" class="view">${board.board_title}</a></td>
							<td>${board.board_comment}</td>
							<td>${board.board_date}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			
			<a href="http://localhost:9000/MRStest/support/add" class="btn btn-primary pull-right">ADD</a>
		</div>
	</div>

	<!-- Script Tag -->
	<%@ include file="/WEB-INF/jsp/includes/script-tag.jsp"%>
</body>
</html>