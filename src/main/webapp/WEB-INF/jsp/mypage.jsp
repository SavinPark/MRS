<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<!-- Head Tag -->
<%@ include file="/WEB-INF/jsp/includes/head-tag.jsp"%>
<style>
	h2 {
		margin-top: 30px;
		margin-bottom: 20px;
		text-align: center;
	}
	table { margin-top: 40px; }
	th { text-align: center; }
	input { border: none; }
	input:focus { outline: none; }
	.btn { margin-left: 20px; }
</style>
<body>

	<!-- 네비게이션 바 -->
	<%@ include file="/WEB-INF/jsp/includes/nav.jsp"%>
	
	<% // System.out.println(session.getAttribute("employee"));  %>

	<!-- 내 정보 -->
	<div class="container">
		<h2>My Page</h2>
		
		<c:if test="${employee == null}">
			<p style="text-align: center; margin-top: 200px; font-size: 25px;">세션이 만료되었습니다. 다시 로그인하세요.</p>
		</c:if>
		
		<c:if test="${employee != null }">
			<table class="table table-bordered">
				<tbody>
					<tr>
						<th scope="row">ID</th>
						<td>
							<form name="readForm" role="form" method="POST">
								<input type="text" id="employee_id" name="employee_id" value="${myInfoVO.employee_id}" readonly="readonly" />
							</form>
						</td>
					</tr>
					<tr>
						<th scope="row">Password</th>
						<td>
							<input type="text" id="employee_password" name="employee_password" value="${myInfoVO.employee_password}" readonly="readonly" />
						</td>
					</tr>
					<tr>
						<th scope="row">부서</th>
						<td>
							<input type="text" id="employee_department" name="employee_department" value="${myInfoVO.employee_department}" readonly="readonly" />
						</td>
					</tr>
					<tr>
						<th scope="row">담당자</th>
						<td>
							<input type="text" id="employee_manager" name="employee_manager" value="${myInfoVO.employee_manager}" readonly="readonly" />
						</td>
					</tr>
					<tr>
						<th scope="row">이메일</th>
						<td>
							<input type="text" id="employee_email" name="employee_email" value="${myInfoVO.employee_email}" readonly="readonly" />
						</td>
					</tr>
					<tr>
						<th scope="row">연락처</th>
						<td>
							<input type="text" id="employee_contact" name="employee_contact" value="${myInfoVO.employee_contact}" readonly="readonly" />
						</td>
					</tr>
				</tbody>
			</table>

			<!-- <a href="http://localhost:9000/MRStest/employee/delete?employee_id=${employee.employee_id}" class="delete_btn btn btn-danger pull-right">DELETE</a> -->
			<button type="submit" class="delete_btn btn btn btn-danger pull-right">계정 삭제</button>
			<a href="http://localhost:9000/MRStest/mypage/edit?employee_id=${myInfoVO.employee_id}" class="btn btn-success  pull-right">내 정보 수정</a>
			
		</c:if>
		
		
	</div>


	<!-- Script Tag -->
	<%@ include file="/WEB-INF/jsp/includes/script-tag.jsp"%>
	<script type="text/javascript"><%@ include file="/js/pathname.js" %></script>
	<script type="text/javascript">
		$(document).ready(function() {
			var formObj = $("form[name='readForm']")

			// 삭제
			$(".delete_btn").on("click", function() {
				formObj.attr("action", "mypage/deleteAction");
				formObj.attr("method", "post");
				formObj.submit();
			})
		})
	</script>
</body>
</html>