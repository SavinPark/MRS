<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
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
	.pagination {
		justify-content: center;
		background-color: pink;
	}
</style>
<!-- BODY -->
<body>

	<!-- 네비게이션 바 -->
	<%@ include file="/WEB-INF/jsp/includes/nav.jsp"%>
	
	<!-- Pagination -->
	<!--  %@ include file="/WEB-INF/jsp/includes/pagination.jsp"% -->

	<!-- Support Board -->
	<div class="container">
		<div class="row">
		
			<table class="table table-striped" id="supportTable" style="text-align: center; border: 1px solid #dddddd; margin-top: 25px;">
				<thead>
					<tr>
						<th style="background-color: #eeeeee; text-align: center;">번호</th>
						<th style="background-color: #eeeeee; text-align: center;">제목</th>
						<th style="background-color: #eeeeee; text-align: center;">지원 유형</th>
						<th style="background-color: #eeeeee; text-align: center;">작성일</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${boardList}" var="board" varStatus="status">
						<tr>
							<td>${status.count}</td>
							<td><a href="http://localhost:9000/MRStest/support/view?support_idx=${board.support_idx}" class="view">${board.board_title}</a></td>
							<td>
								<c:forEach items="${supportList}" var="support">
								<c:if test="${board.support_idx == support.support_idx}">
								   ${support.support_type}
								</c:if>
								</c:forEach>
							</td>
							<td>${board.board_date}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			  
			<!-- 페이지네이션 (Bootstrap) -->

			<c:if test="${employee != null }">
				<a href="http://localhost:9000/MRStest/support/add?board_idx=${maxSupportIdx + 1}" class="btn btn-primary pull-right">ADD</a>
			</c:if>
					
		</div>
	</div>

	<!-- Script Tag -->
	<%@ include file="/WEB-INF/jsp/includes/script-tag.jsp"%>

	<script src="/js/pathname.js"></script>
	
	<script type="text/javascript">
		// 총 페이지 수
		console.log("보고서 총 개수 : " + ${ countBoard });
		
		let url = new URL(window.location.href);
		let urlParams = url.searchParams;
		let thisPage = urlParams.get('pageNumber');
		console.log("현재 페이지 : " + thisPage);
		
		let pageLimit;
		
		if (${ countBoard } % 10 == 0) {
			pageLimit = ${ countBoard } / 10
		} else {
			pageLimit = Math.ceil(${ countBoard } / 10)
		}
		console.log("countBoard % 10 = " + ${ countBoard } % 10 + " , Total page = " + pageLimit);
		
		if ( thisPage != null && (thisPage <= 0 || thisPage > pageLimit)) {
			//alert("존재하지 않는 페이지 입니다.");
			//window.history.back();
		}
	</script>
</body>
</html>