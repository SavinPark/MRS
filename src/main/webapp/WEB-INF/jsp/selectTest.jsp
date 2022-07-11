<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Select & Form Tag</title>
</head>
<body>

	<h3>Form & Select 태그</h3>
		
	<form id="numbers" action="selectTest"  method="get">
		<select name="numbers">
			<option value="" disabled>num</option>
			<option value="1">1</option>
			<option value="2">2</option>
			<option value="3">3</option>
			<option value="4">4</option>
		</select>
		<br/>
		<select name="eng">
			<option value="" disabled>eng</option>
			<option value="a">a</option>
			<option value="b">b</option>
			<option value="c">c</option>
			<option value="d">d</option>
		</select>
		<br/>
		<select name="kor">
			<option value="" disabled>kor</option>
			<option value="ㄱ">ㄱ</option>
			<option value="ㄴ">ㄴ</option>
			<option value="ㄷ">ㄷ</option>
			<option value="ㄹ">ㄹ</option>
		</select> 
		
		<!-- jQuery test -->
		<select id="slctColors" name="slctColors">
			<optgroup label="- Red Colors">
				<option value="#cd5c5c" selected>Indian-Red</option>
				<option value="#ff0000" disabled>Red</option>
				<option value="#8b0000">Dark-Red</option>
			</optgroup>
			<optgroup label="- Green Colors">
				<option value="#90ee90">Light-Green</option>
				<option value="#008000">Green</option>
				<option value="#006400">Dark-Green</option>
			</optgroup>
			<optgroup label="- Blue Colors">
				<option value="#add8e6">Light-Blue</option>
				<option value="#0000ff">Blue</option>
				<option value="#00008b">Dark-Blue</option>
			</optgroup>
			<option value="#808080">Gray</option>
			<option value="#000000">Black</option>
		</select>
		
	</form>
	
	<!-- Script -->
	<script type="text/javascript">
		// check box 
		$('#slctColors').change(function() {
			let value = $(this).val();
			$(this).css('color', value);
		});
		
		// selected value
		let text = $('#slctColors option:selected');
		let value = $('#slctColors').val();
		
		// deselected value
		let str ="";
		$('#slctColors option:not(:selected)').each(function() {
			let text = $(this).text();
			let value = $(this).val();
			
			str += text + "/" + value + ", ";
		});
	</script>
	
</body>
</html>