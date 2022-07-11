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
	
	<% 
		int pageNumber = 1; // 기본 페이지
		if(request.getParameter("pageNumber") != null) {
			pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
		}
	%>

	<!-- Employee Information -->
	<div class="container">
		<div class="row">
			<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd; margin-top: 25px;">
				<thead>
					<tr>
						<th style="background-color: #eeeeee; text-align: center;">부서</th>
						<th style="background-color: #eeeeee; text-align: center;">담당자</th>
						<th style="background-color: #eeeeee; text-align: center;">이메일</th>
						<th style="background-color: #eeeeee; text-align: center;">연락처</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${employeeList}" var="employee">
						<tr>
							<td>${employee.employee_department}</td>
							<td>${employee.employee_manager}</td>
							<td>${employee.employee_email}</td>
							<td>${employee.employee_contact}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
	
	
	<h2><c:out value='${totalPage}'/></h2>
<% 
	//System.out.println(request.getAttribute("countEmply"));
	int countEmply =(int) request.getAttribute("countEmply");
	int totalPage;
	if ( countEmply % 10 == 0 ) {
		totalPage = countEmply / 10;
	} else {
		totalPage = (countEmply / 10) + 1;
	}
	//System.out.println("총 직원 수 : " + countEmply);
	//System.out.println("총 페이지 수 : " + request.getAttribute("totalPage"));
%>
	
	
	<!-- 페이지네이션 (Bootstrap) -->
	<div class="text-center">
		<ul class="pagination">
			<li class="page-item">
				<% if (pageNumber > 1) { %>
					<a class="page-link" href="http://localhost:9000/MRStest/employee?pageNumber=${pageNumber-1}" aria-label="Previous"> 
						<span aria-hidden="true">&laquo;</span>
					</a>
				<% } %>	
			</li>
			<li class="page-item">
				<a class="page-link">
					<span aria-hidden="true"><%= pageNumber%></span>
				</a>
			</li>
			<li class="page-item">
				<% if (pageNumber <=  totalPage) { %>
					<a class="page-link" href="http://localhost:9000/MRStest/employee?pageNumber=${pageNumber+1}"aria-label="Next"> 
						<span aria-hidden="true">&raquo;</span>
					</a>	
				<% } %>	
			</li>
		</ul>
	</div>

	<!-- Script Tag -->
	<%@ include file="/WEB-INF/jsp/includes/script-tag.jsp"%>
	<script type="text/javascript"><%@ include file="/js/pathname.js" %></script>
	<script type="text/javascript">
		// 총 페이지 수 
		console.log("Total Employee : " + ${ countEmply });

		let url = new URL(window.location.href);
		let urlParams = url.searchParams;
		let thisPage = urlParams.get('pageNumber');
		console.log("현재 페이지 : " + thisPage);
		
		let pageLimit;
	
		if (${ countEmply } % 10 == 0) {
			pageLimit = ${ countEmply } / 10
		} else {
			pageLimit = Math.ceil(${ countEmply } / 10);
		}
		console.log("countEmply % 10 = " + ${ countEmply } % 10 + " , Total page = " + pageLimit);
	
		if ( thisPage != null && (thisPage <= 0 || thisPage > pageLimit) ) {
			//alert("존재하지 않는 페이지 입니다.");
			window.history.back();
		}
	</script>
	
</body>
</html>