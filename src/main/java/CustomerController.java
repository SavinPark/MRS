

import java.util.List;
import java.util.Locale;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import dto.CustomerVO;
import service.impl.CustomerServiceImpl;

@Controller
@RequestMapping("/")
public class CustomerController {
	
	private static final Logger logger = (Logger) LoggerFactory.getLogger(CustomerController.class);
	
	@Resource(name = "CustomerService")
	private CustomerServiceImpl customerService;

	// -------------------------------- TEST ---------------------------------- //
	//// Customer Info 고객 정보
	@RequestMapping(value = "customer", method = RequestMethod.GET )
	public String customer(Locale locale, Model model) throws Exception {
		logger.info("customer");
		List<CustomerVO> customerList = customerService.selectCustomer();
		model.addAttribute("customerList", customerList);
		return "/WEB-INF/jsp/test/customer.jsp";
	}
	
	
}
