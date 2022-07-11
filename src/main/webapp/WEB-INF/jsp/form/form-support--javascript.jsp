<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<!-- Head Tag -->
<%@ include file="/WEB-INF/jsp/includes/head-tag.jsp"%>
<style>
form {
	margin-top: 25px;
	margin-bottom: 50px;
}
input, select, #file-list {
	margin-top: 25px;
}
.ck-editor__editable {
	min-height: 300px;
	max-height: 300px;
}

</style>
<body>

	<!-- 네비게이션 바 -->
	<%@ include file="/WEB-INF/jsp/includes/nav.jsp"%>

	<!-- 보고서 작성 양식 -->
		<div class="container">
			<h2>보고서 작성</h2>
		</div>
		<c:if test="${employee == null}">
			<p style="text-align: center; margin-top: 200px; font-size: 25px;">세션이 만료되었습니다. 다시 로그인하세요.</p>
		</c:if>
		
		<c:if test="${employee != null }">
		<div class="container">
		<!-- 고객 정보 -->
			<!--  1. 고객사 -->
			<select id="custCompanyCombo" name="customer_company" class="form-control col-md-4" style="width: 32%;"
					onchange="comboSelected(this, 'customer_company');">
				<option value="" selected disabled>고객사</option>
				<c:forEach items="${custCompanyCombo}" var="custCompanyCombo">
					<option value="${custCompanyCombo.customer_company}">${custCompanyCombo.customer_company}</option>
				</c:forEach>
			</select>
			
			<!-- (2) 부서 -->
			<select id="custDepartCombo" name="customer_department" class="form-control col-md-4" style="width: 32%; margin-left: 2%; margin-right: 2%;"
					onchange="comboSelected(this, 'customer_department');">
				<option value="" selected disabled>부서</option>
				<c:forEach items="${custDepartCombo}" var="custDepartCombo">
					<option value="${custDepartCombo.customer_department}">${custDepartCombo.customer_department}</option>
				</c:forEach>
			</select>
			
			<!-- (3) 담당자 -->
			<select id="custManagerCombo" name="customer_manager" class="form-control col-md-4" style="width: 32%;"
					onchange="comboSelected(this, 'customer_manager');">
				<option value="" selected disabled>담당자</option>
				<c:forEach items="${custManagerCombo}" var="custManagerCombo">
					<option value="${custManagerCombo.customer_manager}">${custManagerCombo.customer_manager}</option>
				</c:forEach>
			</select>
			
		<!-- 지원 정보 -->
			<!-- (1) 지원 유형 -->
			<select id="sprtTypeCombo" name="support_type" class="form-control col-md-6" style="width: 49%; margin-right: 2%;">
				<option value="" selected disabled>지원 유형</option>
				<option value="JOB-PaSS">JOB-PaSS</option>
				<option value="Sybase">Sybase</option>
			</select>
			<!-- (2) 지원 목적  -->
			<select id="sprtPurposeCombo" name="support_purpose" class="form-control col-md-6" style="width: 49%;">
				<option value="" selected disabled>지원 목적</option>
				<option value="점검">점검</option>
				<option value="기술지원">기술지원</option>
			</select>
			<!-- (3) 지원SE -->
			<select id="empCombo" name="employee_id" class="form-control col-md-6" style="width: 49%; margin-right: 2%;">
				<option value="" selected disabled>지원SE</option>
				<c:forEach items="${empCombo}" var="empCombo">
					<option value="${empCombo.employee_id}">${empCombo.employee_manager}</option>
				</c:forEach>
			</select>
			<!-- (4) 지원일 -->
			<input type="text" name="support_date" placeholder="YYYY-MM-DD" class="form-control col-md-6" style="width: 49%;"/>
			
			<!-- 내용 -->
			<!-- (1) 제목 -->
			<input type="text" class="form-control col-md-12" placeholder="Title" name="board_title" style="margin-bottom: 25px;"/>
			
		</div>
			
			<!-- (2) 내용 -->
		<div class="container">
			<!-- The toolbar will be rendered in this container. -->
			<div id="toolbar-container" style="outline: 1px solid #d1cfc9"></div>
			<!-- This container will become the editable. -->
			<div id="editor" style="outline: 1px solid #d1cfc9" name="board_comment">
				<p>Comment</p>
			</div>
		</div>		
		
			<!-- (3) 첨부파일 -->
		<div class="container">
			<div class="container" id="file-list" style="margin-left: 5%;">
				<a href="#this" onclick="addFile()">파일추가</a>
				<div class="file-group">
					<input type="file" name="upload"> 
					<a href='#this' name='file-delete'>삭제</a>
				</div>
			</div>

			<!-- 첨부파일 개수 (임의 지정) -->
			<input type="hidden" id="filenum" name="support_number_of_files" value=2 />
		</div>
	</c:if>


	<!-- Script Tag -->
	<%@ include file="/WEB-INF/jsp/includes/script-tag.jsp"%>
	<script type="text/javascript"><%@ include file="/js/pathname.js" %></script>
	
	<!-- CKEditor (Document) -->
	<script src="https://cdn.ckeditor.com/ckeditor5/33.0.0/decoupled-document/ckeditor.js"></script>
	<script>
		DecoupledEditor
        .create( document.querySelector( '#editor' ) )
        .then( editor => {
            const toolbarContainer = document.querySelector( '#toolbar-container' );

            toolbarContainer.appendChild( editor.ui.view.toolbar.element );
        } )
        .catch( error => {
            console.error( error );
        } );
	</script>

	<!-- Javascript -->
	<script type="text/javascript">
		// URL
		let url = new URL(window.location.href);
		let urlParams = url.searchParams;
		// URL Params
		let board_idx = urlParams.get("board_idx"); // board_idx
		let customer_company = urlParams.get("customer_company"); // 고객사
		let customer_department = urlParams.get("customer_department"); // 고객사(부서)
		let customer_manager = urlParams.get("customer_manager"); // 고객사(담당자)
		
		// URL add param
		if(customer_company) { $("#custCompanyCombo").val(customer_company); }
		if(customer_department) { $("#custDepartCombo").val(customer_department); }
		if(customer_manager) { $("#custManagerCombo").val(customer_manager); }
		
		// Combo Box
		function comboSelected(e, param) {
			let ComboName = e.getAttribute("id");
			for(let i=0; i < e.options.length; i++) {
				const option = e.options[i]
				if(option.selected) {
					urlParams.append(param, option.value);
					location.href = url;
				}
			}
		}
		
		// PHP 부분 새로고침
		setInterval(function() {
			//$("#custCompanyCombo").load(location.href + " #custCompanyCombo", ""));
		    //$("#custDepartCombo").load(location.href + " #custDepartCombo>*",""));
		    //$("#custManagerCombo").load(location.href + " #custManagerCombo>*",""));
		}, 5000);
		
	
		// 첨부파일
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
	</script>

</body>
</html>