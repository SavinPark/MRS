<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
	<title>File Info</title>
</head>
<body>
    <h1>File Information</h1>
 
    <table>
        <thead>
            <tr>
                <th>Idx</th>
                <th>Support_idx</th>
                <th>Original_Name</th>
                <th>Save_Name</th>
                <th>Size_num</th>
                <th>Extension</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${fileList}" var="file">
                <tr>
                    <td>${file.file_idx}</td>
                    <td>${file.support_idx}</td>
                    <td>${file.file_original_name}</td>
                    <td>${file.file_save_name}</td>
                    <td>${file.file_size}</td>
                    <td>${file.file_extension}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
 
</body>
</html>