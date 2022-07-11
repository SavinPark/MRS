<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
	<title>Employee Info</title>
</head>
<body>
    <h1>Employee Information</h1>
 
    <table>
        <thead>
            <tr>
                <th>ID</th>
                <th>Password</th>
                <th>Department</th>
                <th>Manager</th>
                <th>Email</th>
                <th>Contact</th>
                <th>Last Access Date</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${employeeList}" var="employee">
                <tr>
                    <td>${employee.employee_id}</td>
                    <td>${employee.employee_password}</td>
                    <td>${employee.employee_department}</td>
                    <td>${employee.employee_manager}</td>
                    <td>${employee.employee_email}</td>
                    <td>${employee.employee_contact}</td>
                    <td>${employee.employee_last_access_date}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
 
</body>
</html>