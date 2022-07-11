<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>File</title>
</head>

<body>
	<h1>File TEST</h1>

	<form action="${pageContext.request.contextPath }/file/upload.do"
		method="post" enctype="multipart/form-data">
		<label><input type="file" name="upload" /></label> 
		<label><input type="file" name="upload" /></label> 
		<input type="submit" value="업로드" />
	</form>
	
	<!-- 첨부파일 (file) -->
	<!-- MSR에 사용된 ver -->
		<!-- <div class="form-group col-md-12" id="file-list"> -->
		<!-- 
		<form action="${pageContext.request.contextPath}/file/upload.do" method="POST" enctype="multipart/form-data">
			<div class="col-md-12" id="file-list">
				<a href="#this" onclick="addFile()">파일추가</a>
				<div class="file-group">
					<input type="file" name="upload"> 
					<a href='#this' name='file-delete'>삭제</a>
				</div>
			</div>
			<button type="submit" class="btn btn-default">Upload</button>
		</form>
		 -->

</body>
</html>