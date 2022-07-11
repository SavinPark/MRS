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

		<h2>Report</h2>
		
		<form name="readForm" role="form" method="POST">
			<input type="hidden" id="support_idx" name="support_idx" value="${sprtInfoVO.support_idx}" />
		</form>
		
		<h3>1. 고객 정보</h3>
		<table class="table table-bordered">
			<tbody>
				<tr>
					<th scope="row">고객사</th>
					<td colspan="3">
						<input type="text" id="customer_company" name="customer_company" value="${custInfoVO.customer_company}" readonly="readonly" />
					</td>
				</tr>
				<tr>
					<th scope="row">부서</th>
					<td>
						<input type="text" id="customer_department" name="customer_department" value="${custInfoVO.customer_department}" readonly="readonly" />
					</td>
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
					<th scope="row">연락처</th>
					<td>
						<input type="text" id="customer_contact" name="customer_contact" value="${custInfoVO.customer_contact}" readonly="readonly" />
					</td>
				</tr>
			</tbody>
		</table>
		
		<h3>2. 지원 정보</h3>
		<table class="table table-bordered">
			<tbody>
				<tr>
					<th scope="row">지원일시</th>
					<td>
						<input type="text" id="support_date" name="support_date" value="${sprtInfoVO.support_date}" readonly="readonly" />
					</td>
					<th scope="row">지원 SE</th>
					<td>
						<input type="text" id="employee_manager" name="employee_manager" value="${empInfoVO.employee_manager}" readonly="readonly" />
					</td>
				</tr>
				<tr>
					<th scope="row">지원유형</th>
					<td>
						<input type="text" id="support_type" name="support_type" value="${sprtInfoVO.support_type}" readonly="readonly" />
					</td>
					<th scope="row">지원목적</th>
					<td>
						<input type="text" id="support_purpose" name="support_purpose" value="${sprtInfoVO.support_purpose}" readonly="readonly" />
					</td>
				</tr>
			</tbody>
		</table>
		
		<h3>3. 내용</h3>
		<table class="table table-bordered">
			<tbody>
				<tr>
					<th scope="row">제목</th>
					<td colspan="3">
						<input type="text" id="board_title" name="board_title" value="${boardInfoVO.board_title}" readonly="readonly" />
					</td>
				</tr>
				<tr>
					<th scope="row">내용</th>
					<td colspan="3">
						${boardInfoVO.board_comment}
						<!--input type="text" id="board_comment" name="board_comment" value="${boardInfoVO.board_comment}" readonly="readonly" /-->
					</td>
				</tr>
				<tr>
					<th scope="row">첨부파일</th>
					<td>
						<c:forEach items="${fileInfoVO}" var="file">
							<c:if test="${employee == null}">
								<a href="#" onclick="loginFirst()" style="display: block;">${file.file_original_name}</a>
							</c:if>
							<c:if test="${employee != null}">
								<a href="./view/download?file_idx=${file.file_idx}" on-click="downloadFile('${file.file_idx}')" style="display: block;">${file.file_original_name}</a>
							</c:if>
							<!-- request.getContextPath -->
						</c:forEach>
					</td>
					<!-- <td><img style="width: 450px; height: 300px;" src="https://t1.daumcdn.net/cfile/tistory/996DF93C5E17C54122"/></td> -->
				</tr>
			</tbody>
		</table>

		
		<a href="http://localhost:9000/MRStest/support" class="btn btn-primary pull-left" id="backBtn">BACK</a>

		<!-- 
		<a href="http://localhost:9000/MRStest/support/delete" class="btn btn-primary pull-right">DELETE</a>
		<a href="http://localhost:9000/MRStest/support/edit" class="btn btn-primary pull-right">EDIT</a>
		 -->
		<c:if test="${employee != null }">
			<button type="submit" class="delete_btn btn btn btn-danger pull-right">DELETE</button>
			<a href="http://localhost:9000/MRStest/support/edit?support_idx=${sprtInfoVO.support_idx}" class="btn btn-success pull-right">EDIT</a>
		</c:if>

	</div>

	<!-- Script Tag -->
	<%@ include file="/WEB-INF/jsp/includes/script-tag.jsp"%>
	<script type="text/javascript"><%@ include file="/js/pathname.js" %></script>
	<script type="text/javascript">
		$(document).ready(function() {
			var formObj = $("form[name='readForm']")

			// 보고서 삭제 (file, board, support)
			$(".delete_btn").on("click", function() {
				formObj.attr("action", "deleteAction");
				formObj.attr("method", "post");
				formObj.submit();
			})
			
		})
		
		// :: 로그인 알림 ::
		function loginFirst() {
			alert('파일을 다운로드 할 수 없습니다.\n로그인을 해주세요.');
		}
		// :: 첨부파일 다운로드 ::
		function downloadFile(file_idx) {
			$.ajax({
				url: "./view/download", // support/view/download
				data: { file_idx : file_idx },
				method: "get",
			})
			.done( function() {
				alert("첨부파일이 성공적으로 다운로드 되었습니다.");
			})
			.fail( function() {
				alert("ERROR");
			}) 
		}
		
	</script>
</body>
</html>