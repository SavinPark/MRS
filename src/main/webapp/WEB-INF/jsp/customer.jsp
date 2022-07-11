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
	
	<!-- 네비게이션 바 -->
	<%@ include file="/WEB-INF/jsp/includes/nav.jsp"%>
	
	<!-- Pagination -->
	<%@ include file="/WEB-INF/jsp/includes/pagination.jsp"%>
	
	<!-- Customer Information -->
	<div class="container">
		<div class="row">
			<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd; margin-top: 25px;">
				<thead>
					<tr>
						<th style="background-color: #eeeeee; text-align: center;">고객사</th>
						<th style="background-color: #eeeeee; text-align: center;">부서</th>
						<th style="background-color: #eeeeee; text-align: center;">담당자</th>
						<th style="background-color: #eeeeee; text-align: center;">이메일</th>
						<th style="background-color: #eeeeee; text-align: center;">연락처</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${customerList}" var="customer">
						<tr onclick={edit()} id="${customer.customer_id}" class="custData" style="cursor: pointer;">
							<td>${customer.customer_company}</td>
							<td>${customer.customer_department}</td>
							<td>${customer.customer_manager}</td>
							<td>${customer.customer_email}</td>
							<td>${customer.customer_contact}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>


			<!-- 페이지네이션 (Bootstrap) -->
			<div class="text-center">
				<ul class="pagination">
					<li class="page-item">
						<c:if test="<%=pageNumber - 1 <= 0%>">
							<a class="page-link" href="#" aria-label="Previous"> 
								<span aria-hidden="true">&laquo;</span>
							</a>
						</c:if>
						<c:if test="<%=pageNumber - 1 > 0%>">
							<a class="page-link" href="http://localhost:9000/MRStest/customer?pageNumber=<%=pageNumber - 1%>" aria-label="Previous"> 
								<span aria-hidden="true">&laquo;</span>
							</a>
						</c:if>
					</li>
					<li class="page-item">
						<a class="page-link">
							<%=pageNumber%>
						</a>
					</li>
					<li class="page-item">
						<a class="page-link" href="http://localhost:9000/MRStest/customer?pageNumber=<%=pageNumber + 1%>" aria-label="Next"> 
							<span aria-hidden="true">&raquo;</span>
						</a>
					</li>
				</ul>
			</div>

			<c:if test="${employee != null }">
				<a class="btn btn-primary pull-right" href="http://localhost:9000/MRStest/customer/add">New Customer</a>
			</c:if>
			
		</div>
	</div>

	<!-- Script Tag -->
	<%@ include file="/WEB-INF/jsp/includes/script-tag.jsp"%>
	<script type="text/javascript"><%@ include file="/js/pathname.js" %></script>
	<script>
		function edit() {
			//console.log("edit",  event.target.textContent, "ID:" + event.target.parentNode.id);
			location.href= "http://localhost:9000/MRStest/customer/view?customer_id=" + event.target.parentNode.id;
		}

			
		// 총 페이지 수 
		console.log("고객사 총 개수 : " + ${ countCust });
		
		let url = new URL(window.location.href);
		let urlParams = url.searchParams;
		let thisPage = urlParams.get('pageNumber');
		console.log("현재 페이지 : " + thisPage);
		
		let pageLimit;
		
		if (${ countCust } % 10 == 0) {
			pageLimit = ${ countCust } / 10
		} else {
			pageLimit = Math.ceil(${ countCust } / 10)
		}
		console.log("countCust % 10 = " + ${ countCust } % 10 + " , Total page = " + pageLimit);
		
		if ( thisPage != null && (thisPage <= 0 || thisPage > pageLimit)) {
			//alert("존재하지 않는 페이지 입니다.");
			window.history.back();
		}

		
	</script>
</body>
</html>