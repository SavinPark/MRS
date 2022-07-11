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
	input, textarea, #file-list {
		margin-top: 25px;
	}
	
</style>
<body>

	<!-- 네비게이션 바 -->
	<%@ include file="/WEB-INF/jsp/includes/nav.jsp"%>

	<!-- 보고서 수정 양식 -->
	<div class="container">
		<h2>보고서 수정</h2>
			
			<!-- 보고서 양식 (support, board) -->
			
			<form class="row g-3" method="POST" action="${pageContext.request.contextPath}/support/updateAction?${sprtInfoVO.support_idx}" enctype="multipart/form-data">
				<input type="hidden" id="support_idx" name="support_idx" value="${sprtInfoVO.support_idx}" />

				<div class="col-md-12">
					<input type="text" class="form-control" value="${sprtInfoVO.customer_id}" name="customer_id">
				</div>
				<div class="col-md-6">
					<input type="text" class="form-control" value="${sprtInfoVO.support_type}" name="support_type">
				</div>
				<div class="col-md-6">
					<input type="text" class="form-control" value="${sprtInfoVO.employee_id}" name="employee_id">
				</div>
				<div class="col-md-6">
					<input type="text" class="form-control" value="${sprtInfoVO.support_purpose}" name="support_purpose">
				</div>
				<div class="col-md-6">
					<input type="text" class="form-control" value="${sprtInfoVO.support_date}" name="support_date">
				</div>

				<input type="hidden" id="board_idx" name="board_idx" value="${boardInfoVO.board_idx}" />
				<div class="col-md-12">
					<input type="text" class="form-control" value="${boardInfoVO.board_title}" name="board_title">
				</div>
				<div class="col-md-12">
					<textarea class="form-control" name="board_comment" style="height: 300px; resize: none;">${boardInfoVO.board_comment}</textarea>
				</div>

					
				<!-- 첨부파일 (file) 
				<c:forEach items="${fileList}" var="file">
				<c:if test="${file.support_idx == param.suppport_idx}">
					<div class="col-md-12" id="file-list">
					${file.file_original_name}
						<a href="#this" onclick="addFile()">파일추가</a>
						<div class="file-group">
							<input type="file" name="upload" value="${file.file_original_name}"> 
							<a href='#this' name='file-delete'>삭제</a>
						</div>
					</div>
				</c:if>
				</c:forEach> -->
			
			
			<!-- Save 버튼 -->
			<div class="col-md-12">
				<input type="submit" class="btn btn-primary pull-right" value="Save">
			</div>
			
		</form>

	</div>

	<!-- Script Tag -->
	<%@ include file="/WEB-INF/jsp/includes/script-tag.jsp"%>
	<script type="text/javascript"><%@ include file="/js/pathname.js" %></script>
	<script type="text/javascript">
		$(document).ready(function() {
			$("a[name='file-delete']").on("click", function(e) {
				e.preventDefault();
				deleteFile($(this));
			});
		})

		function addFile() {
			var str = "<div class='file-group'><input type='file' name='upload'><a href='#this' name='file-delete'>삭제</a></div>";
			$("#file-list").append(str);
			$("a[name='file-delete']").on("click", function(e) {
				e.preventDefault();
				deleteFile($(this));
			});
		}

		function deleteFile(obj) {
			obj.parent().remove();
		}
	</script>
</body>
</html>