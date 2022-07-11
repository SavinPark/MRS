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
		font-size: 40px;
		text-align: center;
	}
	h3 { margin-top: 40px; }
	table {
		margin-top: 20px;
		margin-bottom: 20px;
	}
	th { text-align: center; }
	input { border: none; }
	input:focus { outline: none; }
	.btn { margin-left: 20px; }
	#backBtn { margin-left: 0px; }
</style>
<body>

	<!-- 네비게이션 바 -->
	<%@ include file="/WEB-INF/jsp/includes/nav.jsp"%>

	<!-- 보고서 상세보기 -->
	<div class="container">
		<!-- ${param.support_idx} -->
		<c:forEach items="${supportList}" var="support">
		<c:if test="${ support.support_idx == param.support_idx}">
		<!-- ${support.support_idx} -->
		<h2>Report</h2>
		<form name="readForm" role="form" method="POST">
			<input type="hidden" id="support_idx" name="support_idx" value="${support.support_idx}" />
		</form>
		<h3>1. 고객 정보</h3>
		<c:forEach items="${customerList}" var="customer">
		<c:if test="${ support.customer_id == customer.customer_id}">
		<table class="table table-bordered">
			<tbody>
				<tr>
					<th scope="row">고객사</th>
					<td colspan="3">
						<input type="text" id="customer_company" name="customer_company" value="${customer.customer_company}" readonly="readonly" />
					</td>
				</tr>
				<tr>
					<th scope="row">부서</th>
					<td>
						<input type="text" id="customer_department" name="customer_department" value="${customer.customer_department}" readonly="readonly" />
					</td>
					<th scope="row">담당자</th>
					<td>
						<input type="text" id="customer_manager" name="customer_manager" value="${customer.customer_manager}" readonly="readonly" />
					</td>
				</tr>
				<tr>
					<th scope="row">이메일</th>
					<td>
						<input type="text" id="customer_email" name="customer_email" value="${customer.customer_email}" readonly="readonly" />
					</td>
					<th scope="row">연락처</th>
					<td>
						<input type="text" id="customer_contact" name="customer_contact" value="${customer.customer_contact}" readonly="readonly" />
					</td>
				</tr>
			</tbody>
		</table>
		</c:if>
		</c:forEach>
		
		<h3>2. 지원 정보</h3>
		<c:forEach items="${employeeList}" var="employee">
		<c:if test="${support.employee_id == employee.employee_id}">
		<table class="table table-bordered">
			<tbody>
				<tr>
					<th scope="row">지원일시</th>
					<!-- <td>${support.support_date}</td> -->
					<td>
						<input type="text" id="support_date" name="support_date" value="${support.support_date}" readonly="readonly" />
					</td>
					<th scope="row">지원 SE</th>
					<!-- <td>${employee.employee_manager}</td> -->
					<td>
						<input type="text" id="employee_manager" name="employee_manager" value="${employee.employee_manager}" readonly="readonly" />
					</td>
				</tr>
				<tr>
					<th scope="row">지원유형</th>
					<!-- <td>${support.support_type}</td> -->
					<td>
						<input type="text" id="support_type" name="support_type" value="${support.support_type}" readonly="readonly" />
					</td>
					<th scope="row">지원목적</th>
					<!-- <td>${support.support_purpose}</td> -->
					<td>
						<input type="text" id="support_purpose" name="support_purpose" value="${support.support_purpose}" readonly="readonly" />
					</td>
				</tr>
			</tbody>
		</table>
		</c:if>
		</c:forEach>
		
		<h3>3. 내용</h3>
		<c:forEach items="${boardList}" var="board">
		<c:if test="${support.support_idx == board.support_idx}">
		<table class="table table-bordered">
			<tbody>
				<tr>
					<th scope="row">제목</th>
					<!-- <td colspan="3">${board.board_title}</td> -->
					<td colspan="3">
						<input type="text" id="board_title" name="board_title" value="${board.board_title}" readonly="readonly" />
					</td>
				</tr>
				<tr>
					<th scope="row">내용</th>
					<!-- <td colspan="3">${board.board_comment}</td> -->
					<td colspan="3">
						<input type="text" id="board_comment" name="board_comment" value="${board.board_comment}" readonly="readonly" />
					</td>
				</tr>
				<tr>
					<th scope="row">첨부파일</th>
					<c:forEach items="${fileList}" var="file">
					<c:if test="${support.support_idx == file.support_idx}">
						<!-- <td>${file.file_original_name}</td> -->
						<td>
						<input type="text" id="file_original_name" name="file_original_name" value="${file.file_original_name}" readonly="readonly" />
						</td>
					</c:if>
					</c:forEach>
					<!-- <td><img style="width: 450px; height: 300px;" src="https://t1.daumcdn.net/cfile/tistory/996DF93C5E17C54122"/></td> -->
				</tr>
			</tbody>
		</table>
		</c:if>
		</c:forEach>
		
		<a href="http://localhost:9000/MRStest/support" class="btn btn-primary pull-left" id="backBtn">BACK</a>

		<!-- 
		<a href="http://localhost:9000/MRStest/support/delete" class="btn btn-primary pull-right">DELETE</a>
		<a href="http://localhost:9000/MRStest/support/edit" class="btn btn-primary pull-right">EDIT</a>
		 -->
		<c:if test="${employee != null }">
			<button type="submit" class="delete_btn btn btn btn-danger pull-right">DELETE</button>
			<a href="http://localhost:9000/MRStest/support/edit?support_idx=${support.support_idx}" class="btn btn-success pull-right">EDIT</a>
		</c:if>
		
	</c:if>
	</c:forEach>
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