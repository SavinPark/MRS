<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

    <!-- Pagination -->
	<% 
		int pageNumber = 1; // 기본 페이지
		if(request.getParameter("pageNumber") != null) {
			pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
			
			//System.out.println("===============================" + pageNumber);
			// pageNumber == null --> x
			// pageNumber != null --> number (>0)
		}
	%>
	
	
	<%@ include file="/WEB-INF/jsp/includes/pagination.jsp"%> 
	
	<!-- Employee.js 페이지 이동 -->