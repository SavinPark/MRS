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
		margin-bottom: 25px;
	}
	textarea {
		margin-bottom: 25px;
	}
</style>
<!-- BODY -->
<body>

	<!-- 네비게이션바 -->
	<nav class="navbar navbar-default">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
				aria-expanded="false">
				<span class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="http://localhost:9000/MRStest/">MRS</a>
		</div>
		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li><a href="http://localhost:9000/MRStest/home">Home</a></li>
				<li class="active"><a href="http://localhost:9000/MRStest/board">Board</a></li>
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expanded="false">접속하기<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="http://localhost:9000/MRStest/login">로그인</a></li>
						<li><a href="http://localhost:9000/MRStest/join">회원가입</a></li>
					</ul>
				</li>
			</ul>
		</div>
	</nav>


	<!-- 보고서 등록 양식 -->
	<div class="container">
		<h2>3. 보고서 등록</h2>
		<div class="container">
			<!-- Comment -->
			<form class="row g-3" method="POST" action="/MRStest/board/report">
				<div class="col-md-8">
					<input type="text" class="form-control" placeholder="Title" name="board_title">
				</div>
				<div class="col-md-4">
					<input type="text" class="form-control" placeholder="지원SE (아이디)" name="support_idx">
				</div>
				<div class="col-md-12">
					<textarea class="form-control" placeholder="Contents" name="board_comment" style="height: 300px; resize: none;"></textarea>
				</div>
				<input type="submit" class="btn btn-primary pull-right" value="완료">
			</form>
			
			<!-- 파일 업로드 -->
			<form action='<c:url value='/board/boardInsert'/>' method="POST" enctype="multipart/form-data">
				<div class="form-group" id="file-list">
					<a href="#this" onclick="addFile()">파일추가</a>
					<div class="file-group">
						<input type="file" name="file">
						<a href='#this' name='file-delete'>삭제</a>
					</div>
				</div>
				<button type="submit" class="btn btn-default">Upload</button>
			</form>
		</div>
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
			var str = "<div class='file-group'><input type='file' name='file'><a href='#this' name='file-delete'>삭제</a></div>";
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