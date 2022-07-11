<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<!-- HEAD -->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width" initial-scale="1">
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<title>MRS</title>
<body>

	<%@ include file="/WEB-INF/jsp/includes/nav.jsp" %>
    <h1>Customer Information</h1>
 
    <table>
        <thead>
            <tr>
                <th>ID</th>
                <th>Company</th>
                <th>Department</th>
                <th>Manager</th>
                <th>Email</th>
                <th>Contact</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${customerList}" var="customer">
                <tr>
                    <td>${customer.customer_id}</td>
                    <td>${customer.customer_company}</td>
                    <td>${customer.customer_department}</td>
                    <td>${customer.customer_manager}</td>
                    <td>${customer.customer_email}</td>
                    <td>${customer.customer_contact}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
 
 	<!-- Script -->
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>