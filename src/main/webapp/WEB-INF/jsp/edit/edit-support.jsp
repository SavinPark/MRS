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
			<!-- 보고서 수정 양식 -->
			<h2>보고서 수정</h2>
			<!-- 고객 정보 -->
			<!-- 1) 고객사 getDepartmentData : 고객사 정보를 보내고, 소속 부서 데이터를 받아옴 -->
			<select id="custCompanyCombo" class="form-control col-md-4" onchange="getDepartmentData()" style="width: 32%; margin-right: 2%;">
			 	<option value="" disabled>고객사</option>
			 	<c:forEach items="${custCompanyCombo}" var="custCompanyCombo">
		 			<option value="${custCompanyCombo}">${custCompanyCombo}</option>
		 		</c:forEach>
		 	</select>
			<!-- 2) 부서 getManagerData : 고객사와 부서 정보를 보내고, 소속 담당자 데이터를 받아옴 -->
		 	<select id="custDepartmentCombo" class="form-control col-md-4" onchange="getManagerData()" style="width: 32%; margin-right: 2%;">
		 		<option value="" disabled>부서</option>
		 		<c:forEach items="${custDepartCombo}" var="custDepartCombo">
		 			<option value="${custDepartCombo}">${custDepartCombo}</option>
		 		</c:forEach>
		 	</select>

			<!-- 3) 담당자 getCustomerId : 고객사/ 부서/ 담당자 정보를 보내고, 고객 Id(customer_id)를 받아옴 -->
			<select id="custManagerCombo" class="form-control col-md-4" onchange="getCustomerId()" style="width: 32%;">
			    <option value="" disabled>담당자</option>
			    <c:forEach items="${custManagerCombo}" var="custManagerCombo">
			    	<option value="${custManagerCombo.customer_manager}">${custManagerCombo.customer_manager}</option>
			    </c:forEach>
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
			<input id="sprtDateInput" type="text" name="support_date" placeholder="YYYY-MM-DD" class="form-control col-md-6" style="width: 49%;" value="${sprtInfoVO.support_date}"/>
			
		<!-- 내용 -->
			<!-- 1) 제목 -->
			<input id="brdTitleInput" type="text" class="form-control col-md-12" placeholder="Title" name="board_title" style="margin-bottom: 25px;" value="${boardInfoVO.board_title}" />
		</div>
			<!-- 2) 내용 -->
			<div class="form-group container">
				<div id="toolbar-container"></div>
				<div id="editor" style="outline: 1px solid #d1cfc9">
					${boardInfoVO.board_comment}
				</div>
			</div>
			
			<!-- ** 원래 웝로드 되었던 첨부파일 리스트 받아서 뿌리기 (조회 기준 : support_idx) ** -->
			<div class="container">
				<a href="#this" onclick="addFile()">파일추가</a>
				<table class="table table-bordered">
					<tbody>
						<tr>
							<th scope="row">첨부파일</th>
							<td id="file-list">
								<c:forEach items="${fileInfoVO}" var="file">
									<div class="file-group">
										<a href="#">${file.file_original_name}</a>
										<button href='#this' name='file-delete' type="button">삭제</button>
									</div>
								</c:forEach>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
			
			
			<!-- 보고서 등록 Form & Save 버튼 -->
			<form class="container" method="POST" action="updateAction">
				<input type="text" name="support_idx" id="support_idx" value="${sprtInfoVO.support_idx}" />
				<input type="text" name="customer_id" id="customer_id" value="${sprtInfoVO.customer_id}" />
				<input type="text" name="employee_id" id="employee_id" value="${sprtInfoVO.employee_id}" />
				<input type="text" name="support_type" id="support_type" value="${sprtInfoVO.support_type}" />
				<input type="text" name="support_purpose" id="support_purpose" value="${sprtInfoVO.support_purpose}" />
				<input type="text" name="support_date" id="support_date" value="${sprtInfoVO.support_date}" />
				<input type="text" name="support_number_of_files" id="support_number_of_files" value="${sprtInfoVO.support_number_of_files}" />
				<input type="text" name="board_idx" id="board_idx" value="${boardInfoVO.board_idx}" />
				<input type="text" name="board_title" id="board_title" value="${boardInfoVO.board_title}" />
				<input type="text" name="board_comment" id="board_comment" value="${boardInfoVO.board_comment}" />
				<input type="submit" id="submit" class="btn btn-primary pull-right" value="Save">
				
				<!-- 첨부파일 
				<div id="file-list" style="margin-left: 5%;">
					<a href="#this" onclick="addFile()">파일추가</a>
					<div class="file-group">
						<input type="file" name="upload"> 
						<a href='#this' name='file-delete'>삭제</a>
					</div>
				</div>
				-->		
			</form>
		</c:if>
		
	
	<!-- Script Tag -->
	<%@ include file="/WEB-INF/jsp/includes/script-tag.jsp"%>
	<script type="text/javascript"><%@ include file="/js/pathname.js" %></script>
	<script type="text/javascript">	
		/* :: CKEditor5 (Document) :: */
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

		/* :: Multi Combo Box :: */
		// getDepartmentData : 선택한 고객사 정보를 보내고, 고객사 및 해당 고객사 소속 부서 정보를 json 형태로 받아옴
		function getDepartmentData() {
			let company = $("#custCompanyCombo option:selected").val();
			$.ajax({
				url: "./getDepartmentData", 
				data: { company : company }, 
				method: "get",
				dataType: "json"
			})
			.done( function(json) {	
				$("#custDepartmentCombo option").remove();
				$("#custManagerCombo").val("").prop("selected",true);
				let departmentList = json.departmentList;
				$("#custDepartmentCombo").append("<option value='' selected disabled>부서</option>");
				$.each(departmentList, function (k,v) { 
					$('<option></option>').val(v).text(v).appendTo($('#custDepartmentCombo')); 
				});
				$("#custManagerCombo option").remove();
				$("#custManagerCombo").append("<option value='' selected disabled>담당자</option>");
			})
			.fail( function() {
				alert("[ getDepartmentData ] ERROR");
			})
		}
		// getManagerData : 선택한 고객사 및 부서 정보를 보내고, 고객사 및 부서 그리고 해당 고객사와 부서 소속 담당자 정보를 json 형태로 받아옴
		function getManagerData() {		
			let company = $("#custCompanyCombo option:selected").val();
			let department = $("#custDepartmentCombo option:selected").val();
			$.ajax({
				url: "./getManagerData",
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
				alert("[ getManagerData ] ERROR");
			}) 
		}
		// getCustomerId : 선택한 고객사&부서&담당자 정보를 보내고, 고객사&부서&담당자&고객ID 정보를 json 형태로 받아옴
		function getCustomerId() {
			let company = $("#custCompanyCombo option:selected").val();
			let department = $("#custDepartmentCombo option:selected").val();
			let manager = $("#custManagerCombo option:selected").val();
			$.ajax({
				url: "./getCustomerId",
				data: { company : company,
						department : department,
						manager : manager },
				method: "get",
				dataType: "json" 
			})
			.done( function(json) {
				$("#customer_id").attr("value", json.id);
			})
			.fail( function() {
				alert("[ getCustomerId ] ERROR");
			})
		}
		
		// 첨부파일
		$(document).ready(function() {
			$("a[name='file-delete']").on("click", function(e) {
				e.preventDefault();
				deleteFile($(this));
			});
		})
		function addFile() {
			var str = '<div class="file-group"><input name="upload" value="${file.file_original_name}"/><a href="#this" name="file-delete" class="btn btn-danger pull-right">삭제</a></div>';
			$("#file-list").append(str);
			$("a[name='file-delete']").on("click", function(e) {
				e.preventDefault();
				deleteFile($(this));
			});
		}
		function deleteFile(obj) {
			obj.parent().remove();
		}
		
		/* :: 초깃값 세팅 :: */
		$(document).ready(function() {
			$("#custCompanyCombo").val("${custInfoVO.customer_company}") // 고객사 선택
			$("#custDepartmentCombo").val("${custInfoVO.customer_department}") // 부서 
			$("#custManagerCombo").val("${custInfoVO.customer_manager}") // 담당자
			$("#sprtTypeCombo").val("${sprtInfoVO.support_type}") // 지원유형
			$("#sprtPurposeCombo").val("${sprtInfoVO.support_purpose}") // 지원목적
			$("#empCombo").val("${empInfoVO.employee_id}") // 지원SE
		})
		
		/* :: 수정된 보고서 저장 :: */
		$('#submit').on('click', function() {
			const url = new URL(window.location.href);
			const urlParams = url.searchParams;
			console.log(urlParams.get('support_idx'));
			console.log("${custInfoVO.customer_manager}");
			$("#support_idx").val(urlParams.get('support_idx'));
			// customer_id는 getCustomerId에서 값 넣음
			$("#employee_id").val($("#empCombo").val());
			$("#support_type").val($("#sprtTypeCombo").val());
			$("#support_purpose").val($("#sprtPurposeCombo").val());
			$("#support_date").val($("#sprtDateInput").val());
			$("#support_number_of_files").val($("#filenum").val());
			$("#board_idx").val(urlParams.get('support_idx'));
			$("#board_title").val($("#brdTitleInput").val());
			$("#board_comment").val(contents.getData());
		})
		
	</script>

</body>
</html>