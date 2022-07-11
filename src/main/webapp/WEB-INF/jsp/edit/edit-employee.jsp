<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<!-- Head Tag -->
<%@ include file="/WEB-INF/jsp/includes/head-tag.jsp"%>
<style>
	form {
		margin-top: 50px;
	}
	label { margin-bottom: 10px; }
	input {
		margin-bottom: 30px;
	}
</style>
<body>

	<!-- 네비게이션 바 -->
	<%@ include file="/WEB-INF/jsp/includes/nav.jsp"%>

	<!-- 내정보 수정 양식 -->
	<div class="container">
		<h2>내 정보 수정</h2>
		
		<form class="row g-3" method="POST" action="/MRStest/mypage/updateAction">
			<!--
			<div class="col-md-12"> 
				<label for="employee_id" class="form-label">ID</label>
				<p style="color:red;">ID는 수정할 수 없습니다.</p>
				<input type="text" class="form-control" id="employee_id" placeholder="${employee.employee_id}" value="${employee.employee_id}" name="employee_id">
			</div>
			-->
			<div class="col-md-10"> 
				<label for="employee_id" class="form-label">ID</label>
				<input type="text" class="form-control" id="employee_id" placeholder="${myInfoVO.employee_id}" value="${myInfoVO.employee_id}" name="employee_id">
			</div>
			<div class="col-md-2"> 
				<label for="empID_check" class="form-label">ID 중복 확인</label>
				<!-- <a href="http://localhost:9000/MRStest/mypage/IDcheck?employee_id=${myInfoVO.employee_id}" id="empID_check" class="IDcheck form-control btn btn btn-danger pull-right">Check</a> -->
				<button type="submit" id="empID_check" class="IDcheck form-control btn btn-danger pull-right">Check</button>
			</div>
			
			<div class="col-md-12"> 
				<label for="employee_password" class="form-label">Password</label>
				<input type="text" class="form-control" id="employee_password" placeholder="${myInfoVO.employee_password}" value="${myInfoVO.employee_password}" name="employee_password">
			</div>
			<div class="col-md-6">
				<label for="employee_manager" class="form-label">이름</label>
				<input type="text" class="form-control" id="employee_manager" placeholder="${myInfoVO.employee_manager}" value="${myInfoVO.employee_manager}" name="employee_manager">
			</div>
			<div class="col-md-6">
				<label for="employee_department" class="form-label">부서</label>
				<input type="text" class="form-control" id="employee_department" placeholder="${myInfoVO.employee_department}" value="${myInfoVO.employee_department}" name="employee_department">
			</div>
			<div class="col-md-12">
				<label for="employee_email" class="form-label">이메일</label>
				<input type="email" class="form-control" id="employee_email" placeholder="${myInfoVO.employee_email}" value="${myInfoVO.employee_email}" name="employee_email">
			</div>
			<div class="col-md-12">
				<label for="employee_contact" class="form-label">연락처</label>
				<input type="text" class="form-control" id="employee_contact" placeholder="${myInfoVO.employee_contact}" value="${myInfoVO.employee_contact}" name="employee_contact">
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