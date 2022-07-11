<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
	<title>Support Info</title>
</head>
<body>
    <h1>Support Information</h1>
 
    <table>
        <thead>
            <tr>
                <th>Idx</th>
                <th>Type</th>
                <th>employee_id</th>
                <th>customer_id</th>
                <th>Date</th>
                <th>Purpose</th>
                <th>Title</th>
                <th>Comment</th>
                <th>number_of_files</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${supportList}" var="support">
                <tr>
                    <td>${support.support_idx}</td>
                    <td>${support.support_type}</td>
                    <td>${support.employee_id}</td>
                    <td>${support.customer_id}</td>
                    <td>${support.support_date}</td>
                    <td>${support.support_purpose}</td>
                    <td>${support.support_title}</td>
                    <td>${support.support_comment}</td>
                    <td>${support.support_number_of_files}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
 
</body>
</html>