<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="EUC-KR">
	<title>Multi Combo Test</title>
	<!-- Ajax -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
	<!-- Bootstrap -->
 	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" />
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  	<!-- jQuery -->
 	<script src="jquery.lwMultiSelect.js"></script>
 	<link rel="stylesheet" href="jquery.lwMultiSelect.css" />
</head>
<body>

	<br />
	<br />
	<div class="container" style="width: 600px;">
		<h2 align="center">Insert Dynamic Multi Select Box Data using Jquery Ajax PHP</h2>
		<br />
		<br />
		<form method="post" id="insert_data">
			<select name="customer_company" id="customer_company" class="form-control action">
				<option value="">Select Company</option>
			</select> 
			<br /> 
			<select name="customer_department" id="customer_department" class="form-control action">
				<option value="">Select Department</option>
			</select> 
			<br /> 
			<select name="city" id="city" multiple class="form-control"></select> 
			<br /> 
			<input type="hidden" name="hidden_city" id="hidden_city" />
			<input type="submit" name="insert" id="action" class="btn btn-info" value="Insert" />
		</form>
	</div>
	
	<!-- Script -->
	<script type="text/javascript">
		function getDepartmentData() {
			if($("#customer_company").val() == '') {
				alert("고객사를 선택하세요"); 
				$("#customer_company").focus(); 
				return;
			}
		}
	</script>

</body>
</html>