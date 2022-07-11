<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<!-- Head Tag -->
<%@ include file="/WEB-INF/jsp/includes/head-tag.jsp"%>
<body>

	<!-- 네비게이션 바 -->
	<%@ include file="/WEB-INF/jsp/includes/nav.jsp"%>

	<!-- 로그인 양식 -->
	<div class="container" style="margin-top: 50px;">
		<div class="col-lg-4"></div>
		<div class="col-lg-4">
			<div class="jumbotron" style="padding-top: 20px;">
				<form method="POST" action="loginAction">
				
					<c:if test="${employee == null}">
						<h3 style="text-align: center;">로그인</h3>
						<div class="form-group">
							<input type="text" class="form-control" id="empID" placeholder="ID" name="employee_id" maxlength="20">
						</div>
						<div class="form-group">
							<input type="password" class="form-control" id="empPW" placeholder="Password" name="employee_password" maxlength="255">
						</div>
						<input type="submit" class="btn btn-primary form-control" value="로그인">
					</c:if>
					
					<c:if test="${employee != null }">
						<div>
							<h3>로그인 성공!</h3>
							<p style="margin: 20px 0;">${employee.employee_manager} 님 환영합니다 :)</p>
							<button id="logoutBtn" class="btn btn-primary form-control" type="button">로그아웃</button>
						</div>
					</c:if>
					
					<c:if test="${msg == false}">
						<h4 style="color: red; margin-top: 20px;">로그인 실패!</h4>
						<p style="font-size: 16px; color: red;">아이디와 비밀번호 확인해주세요.</p>
					</c:if>
				</form>
			</div>
		</div>
		<div class="col-lg-4"></div>
	</div>

	<!-- Script Tag -->
	<%@ include file="/WEB-INF/jsp/includes/script-tag.jsp"%>
	<script type="text/javascript"><%@ include file="/js/pathname.js" %></script>
	<script type="text/javascript">
		$(document).ready(function() {
			$("#logoutBtn").on("click", function() {
				location.href = "logoutAction";
			})
		})
	</script>
</body>
</html>