<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<!-- Head Tag -->
<head>
<%@ include file="/WEB-INF/jsp/includes/head-tag.jsp"%>
<script src="https://cdn.ckeditor.com/ckeditor5/33.0.0/decoupled-document/ckeditor.js"></script>
<style>
form {
	margin-top: 25px;
}
input, select, #file-list {
	margin-top: 25px;
}
.ck-editor__editable {
	min-height: 300px;
	max-height: 300px;
}
</style>
</head>
<body>
	
	<!-- 네비게이션 바 -->
	<%@ include file="/WEB-INF/jsp/includes/nav.jsp" %>
	
	<!-- 세션 만료 상태 -->
	<c:if test="${employee == null}">
		<p style="text-align: center; margin-top: 200px; font-size: 25px;">세션이 만료되었습니다. 다시 로그인하세요.</p>
	</c:if>
		
	<!-- 로그인 상태 -->
	<c:if test="${employee != null}">
		<div class="container"> 
			<!-- 보고서 작성 양식 -->
			<h2>보고서 작성</h2>
		
			<!-- 고객 정보 -->
			<!-- 1) 고객사 getDepartmentData : 고객사 정보를 보내고, 소속 부서 데이터를 받아옴 -->
			<select id="custCompanyCombo" class="form-control col-md-4" onchange="getDepartmentData()" style="width: 32%; margin-right: 2%;">
			 	<option value="" selected disabled>고객사</option>
			 	<c:forEach items="${custCompanyCombo}" var="custCompanyCombo">
		 			<option value="${custCompanyCombo.customer_company}">${custCompanyCombo.customer_company}</option>
		 		</c:forEach>
		 	</select>
			<!-- 2) 부서 getManagerData : 고객사와 부서 정보를 보내고, 소속 담당자 데이터를 받아옴 -->
		 	<select id="custDepartmentCombo" class="form-control col-md-4" onchange="getManagerData()" style="width: 32%; margin-right: 2%;">
		 		<option value="" selected disabled>부서</option>
		 	</select>

			<!-- 3) 담당자 getCustomerId : 고객사/ 부서/ 담당자 정보를 보내고, 고객 Id(customer_id)를 받아옴 -->
			<select id="custManagerCombo" class="form-control col-md-4" onchange="getCustomerId()" style="width: 32%;">
			 	<option value="" selected disabled>담당자</option>
			</select>
		 
			<!-- 지원 정보 -->
			<!-- 1) 지원 유형 -->
			<select id="sprtTypeCombo" name="support_type" class="form-control col-md-6" style="width: 49%; margin-right: 2%;">
				<option value="" selected disabled>지원 유형</option>
				<option value="JOB-PaSS">JOB-PaSS</option>
				<option value="Sybase">Sybase</option>
			</select>
			<!-- 2) 지원 목적 -->
			<select id="sprtPurposeCombo" name="support_purpose" class="form-control col-md-6" style="width: 49%;">
				<option value="" selected disabled>지원 목적</option>
				<option value="점검">점검</option>
				<option value="기술지원">기술지원</option>
			</select>
			<!-- 3) 지원 SE -->
			<select id="empCombo" name="employee_id" class="form-control col-md-6" style="width: 49%; margin-right: 2%;">
				<option value="" selected disabled>지원SE</option>
				<c:forEach items="${empCombo}" var="empCombo">
					<option value="${empCombo.employee_id}">${empCombo.employee_manager}</option>
				</c:forEach>
			</select>
			<!-- 4) 지원일 -->
			<input id="sprtDateInput" type="text" name="support_date" placeholder="YYYY-MM-DD" class="form-control col-md-6" style="width: 49%;"/>
			
		<!-- 내용 -->
			<!-- 1) 제목 -->
			<input id="brdTitleInput" type="text" class="form-control col-md-12" placeholder="Title" name="board_title" style="margin-bottom: 25px;"/>
		</div>
			<!-- 2) 내용 -->
			<div class="form-group container">
				<div id="toolbar-container"></div>
				<div id="editor" style="outline: 1px solid #d1cfc9">
				</div>
			</div>
			
			<!-- 보고서 등록 Form & 첨부파일 & Save 버튼 -->
			<form class="container" method="POST" action="/MRStest/support/addAction" enctype="multipart/form-data">
				<input type="hidden" name="support_idx" id="support_idx" value="" />
				<input type="hidden" name="customer_id" id="customer_id" value="" />
				<input type="hidden" name="employee_id" id="employee_id" value="" />
				<input type="hidden" name="support_type" id="support_type" value="" />
				<input type="hidden" name="support_purpose" id="support_purpose" value="" />
				<input type="hidden" name="support_date" id="support_date" value="" />
				<input type="hidden" name="support_number_of_files" id="support_number_of_files" value="" />
				<input type="hidden" name="board_idx" id="board_idx" value="" />
				<input type="hidden" name="board_title" id="board_title" value="" />
				<input type="hidden" name="board_comment" id="board_comment" value="" />
				<!-- 첨부파일 -->
				<div  id="file-list" >
					<a href="#this" onclick="addFile()">파일추가</a>
					<div class="file-group">
						<input type="file" name="upload"> 
						<a href='#this' name='file-delete'>삭제</a>
					</div>
				</div>
				<!-- 첨부파일 개수 (임의 지정) -->
				<input type="hidden" id="filenum" name="support_number_of_files" value=2 />
				<input type="submit" id="submit" class="btn btn-primary pull-right" value="Save">
			</form>
		</c:if>
		
	
	<!-- Script Tag -->
	<%@ include file="/WEB-INF/jsp/includes/script-tag.jsp"%>
	<script type="text/javascript"><%@ include file="/js/pathname.js" %></script>
	<script type="text/javascript">
	    // ::  CKEditor5 (Document) ::
		let contents;
		DecoupledEditor
        .create( document.querySelector( '#editor' ) )
        .then( editor => {
        	// toolbar
            const toolbarContainer = document.querySelector( '#toolbar-container' );
            toolbarContainer.appendChild( editor.ui.view.toolbar.element );
            contents = editor;
        } )
        .catch( error => {
            console.error( error );
        } );
		
		// getDepartmentData : 선택한 고객사 정보를 보내고, 고객사 및 해당 고객사 소속 부서 정보를 json 형태로 받아옴
		function getDepartmentData() {
			let company = $("#custCompanyCombo option:selected").val();
			$.ajax({
				url: "./getDepartmentData", // 클라이언트가 HTTP 요청을 보낼 서버의 URL 주소 ./add/getDepartmentData
				data: { company : company }, // HTTP 요청과 함께 서버로 보낼 데이터
				method: "get", // HTTP 요청 메소드(GET, POST 등)
				dataType: "json" // 서버에서 보내줄 데이터의 타입
			})
			.done( function(json) {	// HTTP 요청 성공 
				$("#custDepartmentCombo option").remove();
				let departmentList = json.departmentList;
				$("#custDepartmentCombo").append("<option value='' selected disabled>부서</option>");
				$.each(departmentList, function (k,v) { 
					$('<option></option>').val(v).text(v).appendTo($('#custDepartmentCombo')); 
				});
			})
			.fail( function() {	// HTTP 요청 실패
				alert("ERROR");
			}) /*
			.always(function() { // HTTP 요청 결과에 상관 없이 항상 실행
				//alert("END");
			}); */
		}
		// getManagerData : 선택한 고객사 및 부서 정보를 보내고, 고객사 및 부서 그리고 해당 고객사와 부서 소속 담당자 정보를 json 형태로 받아옴
		function getManagerData() {		
			let company = $("#custCompanyCombo option:selected").val();
			let department = $("#custDepartmentCombo option:selected").val();
			$.ajax({
				url: "./getManagerData", // ./add/getManagerData
				data: { company : company,
						department : department },
				method: "get",
				dataType: "json" 
			})
			.done( function(json) {
				$("#custManagerCombo option").remove();
				let managerList = json.managerList;
				$("#custManagerCombo").append("<option value='' selected disabled>담당자</option>");
				$.each(managerList, function (k,v) { 
					$('<option></option>').val(v).text(v).appendTo($('#custManagerCombo')); 
				});
			})
			.fail( function() {
				alert("ERROR");
			}) 
		}
		// getCustomerId : 선택한 고객사&부서&담당자 정보를 보내고, 고객사&부서&담당자&고객ID 정보를 json 형태로 받아옴
		function getCustomerId() {
			let company = $("#custCompanyCombo option:selected").val();
			let department = $("#custDepartmentCombo option:selected").val();
			let manager = $("#custManagerCombo option:selected").val();
			$.ajax({
				url: "./getCustomerId", // ./add/getCustomerId
				data: { company : company,
						department : department,
						manager : manager },
				method: "get",
				dataType: "json" 
			})
			.done( function(json) {
				//alert("id : " + json.id);
				$("#customer_id").attr("value", json.id);
			})
			.fail( function() {
				alert("ERROR");
			})
		}
		
		// :: 첨부파일 ::
		$(document).ready(function() {
			$("a[name='file-delete']").on("click", function(e) {
				e.preventDefault();
				deleteFile($(this));
			});
		})
		function addFile() {
			var str = "<div class='file-group'><input type='file' name='upload'><a href='#this' name='file-delete'>삭제</a></div>";
			$("#file-list").append(str);
			$("a[name='file-delete']").on("click", function(e) {
				e.preventDefault();
				deleteFile($(this));
			});
		}
		function deleteFile(obj) {
			obj.parent().remove();
		}
		
		// :: 보고서 등록 ::
		$('#submit').on('click', function() {
			const url = new URL(window.location.href);
			const urlParams = url.searchParams;
			$("#support_idx").attr("value", urlParams.get('board_idx'));
			// customer_id는 getCustomerId에서 값 넣음
			$("#employee_id").attr("value", $("#empCombo option:selected").val());
			$("#support_type").attr("value", $("#sprtTypeCombo option:selected").val());
			$("#support_purpose").attr("value", $("#sprtPurposeCombo option:selected").val());
			$("#support_date").attr("value", $("#sprtDateInput").val());
			$("#support_number_of_files").attr("value", $("#filenum").val());
			$("#board_idx").attr("value", urlParams.get('board_idx'));
			$("#board_title").attr("value", $("#brdTitleInput").val());
			$("#board_comment").attr("value", contents.getData());
		})
		
	</script>

</body>
</html>