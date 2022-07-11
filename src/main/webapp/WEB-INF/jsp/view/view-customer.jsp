<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

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
	#backBtn { margin-left: 0px; }
</style>
<body>

	<!-- 네비게이션 바 -->
	<%@ include file="/WEB-INF/jsp/includes/nav.jsp"%>

	<!-- 고객 정보 상세보기 -->
	<div class="container" >
		<h2>고객 정보</h2>
	

	
		<form name="readForm" role="form" method="POST">
			<input type="hidden" id="customer_id" name="customer_id" value="${custInfoVO.customer_id}" />
		</form>
		<table class="table table-bordered">
			<tbody>
				<tr>
					<th scope="row">고객사</th>
					<td>
						<input type="text" id="customer_company" name="customer_company" value="${custInfoVO.customer_company}" readonly="readonly" />
					</td>
				</tr>
				<tr >
					<th scope="row">부서</th>
					<td>
						<input type="text" id="customer_department" name="customer_department" value="${custInfoVO.customer_department}" readonly="readonly" />
					</td>
				</tr>
				<tr>
					<th scope="row">담당자</th>
					<td>
						<input type="text" id="customer_manager" name="customer_manager" value="${custInfoVO.customer_manager}" readonly="readonly" />
					</td>
				</tr>
				<tr>
					<th scope="row">이메일</th>
					<td>
						<input type="text" id="customer_email" name="customer_email" value="${custInfoVO.customer_email}" readonly="readonly" />
					</td>
				</tr>
				<tr>
					<th scope="row">연락처</th>
					<td>
						<input type="text" id="customer_contact" name="customer_contact" value="${custInfoVO.customer_contact}" readonly="readonly" />
					</td>
				</tr>
			</tbody>
		</table>
		
		<a href="http://localhost:9000/MRStest/customer" class="btn btn-primary pull-left" id="backBtn">BACK</a>
		
		<!-- 
			<a href="http://localhost:9000/MRStest/customer/delete?customer_id=${customer.customer_id}" class="delete_btn btn btn-danger pull-right">DELETE</a> 
			<a href="http://localhost:9000/MRStest/customer/edit?customer_id=${customer.customer_id}" class="btn btn-success  pull-right">EDIT</a>
		-->
		<c:if test="${employee != null }">
			<button type="submit" class="delete_btn btn btn btn-danger pull-right">DELETE</button>
			<a href="http://localhost:9000/MRStest/customer/edit?customer_id=${custInfoVO.customer_id}" class="btn btn-success pull-right">EDIT</a>
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
				formObj.attr("action", "deleteAction");
				formObj.attr("method", "post");
				formObj.submit();
			})
		})
	</script>
</body>
</html>