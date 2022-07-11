<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Ajax Test</title>
	
	<!-- Style -->
	<style>
		.rs {
			border: 10px dotted orange;
			padding: 30px;
			font-size: 3rem;
			width: 200px;
		}
		.rs-msg {
			border: 10px dotted pink;
			padding: 30px;
			font-size: 3rem;
			width: 200px;
		}
		.rs-code {
			border: 10px dotted powderblue;
			padding: 30px;
			font-size: 3rem;
			width: 200px;
		}
	</style>
	
	<!-- Script -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script>
		/* callByAjaxV1 : 연산결과 */
		function callByAjaxV1() {
			// alert("실행됨");
			var form = document.form1;
			
			var num1 = form.num1.value;
			var num2 = form.num2.value;
			
			// alert("num1 : " + num1);
			// alert("num2 : " + num2);
			// alert("Result : " + (num1 + num2));
			
			var action = form.action;
			//action = "./doPlus";
			
			// alert(action); // http://localhost:9000/MRStest/doPlus ( action = form.action = "./doPlus" )

			$.get( 
				   "./doPlusV1", // URL
				   {
						num1 : num1,	// DATA
						num2 : num2
				   },
				   function(data) {	// CALLBACK Function
				   		// alert(data);
				   	    // $('.rs').empty().append(data);
				   		$('.rs').text(data);
				   },
				   'html'
			);

		}
		
		// GET "/MRStest/doPlus?num1=2&num2=5", parameters={masked} ; 'doPlus'
		// GET "/MRStest/doPlus?num1=2&num2=5", parameters={masked} ; './doPlus'
		
		/* callByAjaxV2 : 연산결과 + 메시지 */
		function callByAjaxV2() {
			var form = document.form1;
			
			var num1 = form.num1.value;
			var num2 = form.num2.value;
			
			var action = form.action;
			
			$.get( 
				   "./doPlusV2", // URL
				   {
						num1 : num1,	// DATA
						num2 : num2
				   },
				   function(data) {	// CALLBACK Function
				   		var data = data.split('/');
				   		var rs = data[0];  // 연산결과
				   		var msg = data[1]; // 메시지
				   		
				   		$('.rs').text(rs);
				   		$('.rs-msg').text(msg);
				   },
				   'html'
			);

		}
		/* callByAjaxV1 : 연산결과 + 메시지 + 결과코드 */
		function callByAjaxV3() {
			var form = document.form1;
			
			var num1 = form.num1.value;
			var num2 = form.num2.value;
			
			var action = form.action;

			$.get( 
				   "./doPlusV3", // URL
				   {
						num1 : num1,	// DATA
						num2 : num2
				   },
				   function(data) {	// CALLBACK Function
				   		var data = data.split('/');
				   		var rs = data[0]; // 연산결과
				   		var msg = data[1]; // 메시지
				   		var code = data[2]; // 결과 코드
				   		
				   		$('.rs').text(rs);
				   		$('.rs-msg').text(msg);
				   		$('.rs-code').text(code);
				   },
				   'html'
			);

		}
	</script>
</head>

<body>
	<h1>Ajax Test</h1>
	
	<h2>Test Form</h2>
	<form name="form1" action="./doPlus" method="GET">
		<div>
			<input type="text" name="num1" placeholder="number 1" />
		</div>
		<div>
			<input type="text" name="num2" placeholder="number2" />
		</div>
		<div>
			<input type="submit" value="Result"/>
		</div>
		<div>
			<input onclick="callByAjaxV1()" type="button" value="ResultV1"/>
			<input onclick="callByAjaxV2()" type="button" value="ResultV2"/>
			<input onclick="callByAjaxV3()" type="button" value="ResultV3"/>
		</div>
	</form>
	
	<h2>Result</h2>
	<div class="rs"></div>
	
	<h2>MSG</h2>
	<div class="rs-msg"></div>
	
	<h2>CODE</h2>
	<div class="rs-code"></div>
	
</body>
</html>