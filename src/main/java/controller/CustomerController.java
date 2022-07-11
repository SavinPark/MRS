package controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import dto.CustomerVO;
import service.impl.CustomerServiceImpl;

@Controller
public class CustomerController {
	
	@Resource(name = "CustomerService")
	private CustomerServiceImpl customerService;
	
	// ===================================
	// Customer Info
	// ===================================
	
	// 고객 리스트 페이지
	@RequestMapping(value = "customer", method = RequestMethod.GET)
	public String customer(HttpServletRequest request, Model model) throws Exception {
		String pageParam = request.getParameter("pageNumber");
		int page;
		if (pageParam == null || pageParam == "1") {
			page = 0;
		} else {
			page = (Integer.parseInt(pageParam)-1) * 10; 
		}
		// 한 페이지에 10건 조회
		List<CustomerVO> customerList = customerService.selectTenCustomer(page);
		model.addAttribute("customerList", customerList);
		// 고객사 테이블 행 개수 
		int countCust = customerService.countCustomer();
		model.addAttribute("countCust", countCust);
		model.addAttribute("pageParam", pageParam);
		model.addAttribute("page", page);
		return "/WEB-INF/jsp/customer.jsp";
	}

	// 고객 정보 등록 페이지
	@RequestMapping(value = "customer/add")
	public String formCustomer() {
		return "/WEB-INF/jsp/form/form-customer.jsp";
	}

	// 고객 정보 등록 완료 후, 고객 리스트 페이지로 이동
	@RequestMapping(value = "customer/addAction", method = { RequestMethod.POST, RequestMethod.GET })
	public String addCustomer(Model model, CustomerVO newCustomer) throws Exception {
		customerService.insertCustomer(newCustomer);
		return "redirect:/customer";
	}

	// 고객 정보 상세 페이지
	@RequestMapping(value = "customer/view**", method = RequestMethod.GET)
	public String viewCustomer(HttpServletRequest request, Model model, CustomerVO customerVO) throws Exception {
		int custID = Integer.parseInt(request.getParameter("customer_id"));
		CustomerVO custInfoVO = customerService.selectCustById(custID);
		model.addAttribute("custInfoVO", custInfoVO);
		return "/WEB-INF/jsp/view/view-customer.jsp";
	}

	// 고객 정보 수정 페이지
	@RequestMapping(value = "customer/edit**", method = RequestMethod.GET)
	public String eidtCustomer(HttpServletRequest request, Model model, CustomerVO customerVO) throws Exception {
		int custID = Integer.parseInt(request.getParameter("customer_id"));
		CustomerVO custInfoVO = customerService.selectCustById(custID);
		model.addAttribute("custInfoVO", custInfoVO);
		return "/WEB-INF/jsp/edit/edit-customer.jsp";
	}

	// 고객 정보 수정 후, 해당 고객 정보 상세보기 페이지
	@RequestMapping(value = "customer/updateAction**", method = { RequestMethod.POST })
	public String updateCustomer(CustomerVO customerVO) throws Exception {
		customerService.updateCustomer(customerVO);
		return "redirect:/customer/view?customer_id=" + customerVO.getCustomer_id();
	}

	// 고객 정보 삭제 후, 고객 리스트 페이지로 이동
	@RequestMapping(value = "customer/deleteAction", method = { RequestMethod.POST })
	public String deleteCustomer(CustomerVO customerVO) throws Exception {
		customerService.deleteCustomer(customerVO.getCustomer_id());
		return "redirect:/customer";
	}

}
