<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

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
<body>

	<!-- 네비게이션 바 -->
	<%@ include file="/WEB-INF/jsp/includes/nav.jsp"%>

	<!-- 직원 정보 등록 양식 -->
	<div class="container">
		<h2>고객 정보 등록</h2>
		
		<form class="row g-3" method="POST" action="/MRStest/customer/addAction">
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
			<div class="col-md-12">
				<input type="submit" class="btn btn-primary pull-right" value="Save">
			</div>
		</form>
	</div>

	<!-- Script Tag -->
	<%@ include file="/WEB-INF/jsp/includes/script-tag.jsp"%>
	<script type="text/javascript"><%@ include file="/js/pathname.js" %></script>
	
</body>
</html>