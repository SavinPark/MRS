<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="false" %>
<%@ page import="java.util.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.net.*"%>
<%
	//파일 기본경로
	//String defaultPath = request.getSession().getServletContext().getRealPath("/");
	//파일 기본경로, 상세경로
	//String filePath = defaultPath + "ckEimg" + File.separator;
%>

<!-- CKEditor Test Sample -->

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>CKEditor</title>
<!-- CKEditor -->
<script src="https://cdn.ckeditor.com/ckeditor5/33.0.0/classic/ckeditor.js"></script>
</head>
<body>

	<div id="editor">This is some sample content.</div>
	<script>
        ClassicEditor.create( document.querySelector( '#editor' ) )
                     .then( editor => {console.log( editor ); } )
                     .catch( error => {console.error( error );} );
     </script>
 
</body>
</html>
