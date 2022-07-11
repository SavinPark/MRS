<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<!-- Head Tag -->
<%@ include file="/WEB-INF/jsp/includes/head-tag.jsp"%>
<body>

	<!-- 네비게이션 바 -->
	<%@ include file="/WEB-INF/jsp/includes/nav.jsp"%>

	<!-- 직원 정보 등록 양식 -->
	<div class="container">
		<div class="col-lg-4"></div>
		<div class="col-lg-4">
			<div class="jumbotron" style="padding-top: 20px;">
				<form method="POST" action="/MRStest/join/add">
					<h3 style="text-align: center;">직원 정보 등록</h3>
					<div class="form-group">
						<input type="text" class="form-control" placeholder="ID"
							name="employee_id" id="employee_id" maxlength="20">
					</div>
					<div class="form-group">
						<input type="password" class="form-control" placeholder="Password"
							name="employee_password" maxlength="255">
					</div>
					<div class="form-group">
						<input type="text" class="form-control" placeholder="이름"
							name="employee_manager" maxlength="20">
					</div>
					<div class="form-group">
						<input type="text" class="form-control" placeholder="부서"
							name="employee_department" maxlength="20">
					</div>
					<div class="form-group">
						<input type="text" class="form-control" placeholder="연락처"
							name="employee_contact" maxlength="20">
					</div>
					<div class="form-group">
						<input type="email" class="form-control" placeholder="이메일"
							name="employee_email" maxlength="255">
					</div>
					<input type="submit" class="btn btn-primary form-control" value="회원가입">
				</form>
			</div>
		</div>
		<div class="col-lg-4"></div>
	</div>

	<!-- Script Tag -->
	<%@ include file="/WEB-INF/jsp/includes/script-tag.jsp"%>
	<script type="text/javascript"><%@ include file="/js/pathname.js" %></script>
	
</body>
</html>