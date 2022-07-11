package controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import dto.EmployeeVO;
import service.impl.EmployeeServiceImpl;

@Controller
public class EmployeeController {
	
	@Resource(name = "EmployeeService")
	private EmployeeServiceImpl employeeService;
	
	// ===================================
	// Employee Info
	// ===================================
	
	// 직원 리스트 페이지
	@RequestMapping(value = "employee")
	public String employee(HttpServletRequest request, Model model) throws Exception {
		// 현재 페이지 (url 파라미터)
		String pageParam = request.getParameter("pageNumber");
		int page;
		if (pageParam == null || pageParam == "1") {
			page = 0;
		} else {
			page = (Integer.parseInt(pageParam)-1) * 10; 
		}
		// 한 페이지에 10건 조회
		List<EmployeeVO> employeeList = employeeService.selectTenEmployee(page);
		model.addAttribute("employeeList", employeeList);
		// 직원 테이블 총 행 개수
		int countEmply = employeeService.countEmployee();
		model.addAttribute("countEmply", countEmply);
		// 총 페이지 수 
		int totalPage;
		if (countEmply % 10 == 0) {
			totalPage = countEmply / 10;
		} else {
			totalPage = (countEmply / 10) + 1;
		}
		model.addAttribute("totalPage", totalPage);
		
		System.out.println("----- 페이지 파라미터 ----- " + pageParam);
		System.out.println("----- 현재 페이지 ----- " + page);
		System.out.println("----- 총 직원 수 ----- " + countEmply);
		System.out.println("----- 총 페이지 수 ----- " + totalPage);
		return "/WEB-INF/jsp/employee.jsp";
	}

}
