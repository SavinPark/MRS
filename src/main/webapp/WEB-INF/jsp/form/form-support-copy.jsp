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

	<!-- 네비게이션 바 [Support] -->
	<%@ include file="/WEB-INF/jsp/includes/nav--support.jsp"%>

	<!-- 보고서 작성 양식 -->
	<div class="container">
		<h2>보고서 작성</h2>
		
		<!-- NOTE -->
		<!--
		<c:forEach items="${supportList}" var="support" varStatus="status">
		        <% // support 테이블에 있는 모든 행에 대한 support_idx %>
				${support.support_idx}
				<% // support 테이블에서 마지막 행이면 (true), 새로운 보고서의 support_idx는 "마지막 행의 idx + 1"  %>
				<c:if test="${status.last}">
					<input id="board_idx" name="board_idx" value="${support.support_idx + 1}" />
				</c:if>
		</c:forEach>
		 -->

		<form class="row g-3" method="POST" action="${pageContext.request.contextPath}/support/addAction" enctype="multipart/form-data">
		
			<!-- support_idx 지정 : support List 불러와서 row 개수 파악 ( support_idx = board_idx ) -->
			<% 
				String boardIDX = request.getParameter("board_idx"); 
				System.out.println("yyyyyyyyyyyyyy"+boardIDX);
			%>
			<c:forEach items="${supportList}" var="support" varStatus="status">
				<c:if test="${status.last}">
					<input type="hidden" id="support_idx" name="support_idx" value="${support.support_idx + 1}" />
				</c:if>
			</c:forEach>
			
			<!-- 보고서 양식 (support, board) -->
			<div class="col-md-12">
				<input type="text" class="form-control" placeholder="고객사 (ID)" name="customer_id">
			</div>
			
			<div class="col-md-6">
				<input type="text" class="form-control" placeholder="지원타입" name="support_type">
			</div>
			<div class="col-md-6">
				<input type="text" class="form-control" placeholder="지원SE (ID)" name="employee_id">
			</div>
			<div class="col-md-6">
				<input type="text" class="form-control" placeholder="지원목적" name="support_purpose">
			</div>
			<div class="col-md-6">
				<input type="text" class="form-control" placeholder="지원일시 YYYY-MM-DD" name="support_date">
			</div>
			<div class="col-md-12">
				<input type="text" class="form-control" placeholder="Title" name="board_title">
			</div>
			<div class="col-md-12">
				<textarea class="form-control" placeholder="Contents" name="board_comment" style="height: 300px; resize: none;"></textarea>
			</div>
			
			<!-- 첨부파일 (file) -->
			<div class="col-md-12" id="file-list">
				<a href="#this" onclick="addFile()">파일추가</a>
				<div class="file-group">
					<input type="file" name="upload"> 
					<a href='#this' name='file-delete'>삭제</a>
				</div>
			</div>
			
			<!-- 첨부파일 개수 (임의 지정) -->
			<input type="hidden" id="filenum" name="support_number_of_files" value=2 />
			
			<!-- Save 버튼 -->
			<div class="col-md-12">
				<input type="submit" class="btn btn-primary pull-right" value="Save">
			</div>
		</form>

	</div>


	<!-- Script Tag -->
	<%@ include file="/WEB-INF/jsp/includes/script-tag.jsp"%>
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