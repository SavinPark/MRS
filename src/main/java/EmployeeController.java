

import java.io.PrintWriter;
import java.util.List;
import java.util.Locale;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import dto.EmployeeVO;
import service.impl.EmployeeServiceImpl;

@Controller
@RequestMapping("/")
public class EmployeeController {

	private static final Logger logger = (Logger) LoggerFactory.getLogger(EmployeeController.class);
	
	@Resource(name = "EmployeeService")
	private EmployeeServiceImpl employeeService;
	
	// -------------------------------- TEST ---------------------------------- //
	//// Employee 직원
	@RequestMapping(value = "employee", method = RequestMethod.GET)
	public String employee(Locale locale, Model model) throws Exception {
		logger.info("employee");
		List<EmployeeVO> employeeList = employeeService.selectEmployee();
		model.addAttribute("employeeList", employeeList);
		return "/WEB-INF/jsp/test/employee.jsp";
	}
	
	////LOGIN
	@RequestMapping(value = "login")
	public String login(Model model) {
		return "/WEB-INF/jsp/login.jsp";
	}

	//// JOIN
	@RequestMapping(value = "join")
	public String join(Model model) {
		return "/WEB-INF/jsp/join.jsp";
	}
	
	//// 새로운 직원 등록
	@RequestMapping(value = "join/add", method = RequestMethod.POST)
    //public String join(Model model, EmployeeVO newEmployee, HttpServletResponse response) throws Exception {
	public String join(Model model, EmployeeVO newEmployee) throws Exception {
		if (newEmployee == null || newEmployee.getEmployee_id() == null || newEmployee.getEmployee_id().isEmpty()
			|| newEmployee.getEmployee_password() == null || newEmployee.getEmployee_password().isEmpty()) {
			//PrintWriter writer = response.getWriter();
            //writer.println("<script>alert('입력해야하는 항목이 남아있습니다.'); history.back();</script>");
		} else {
			employeeService.insertEmployee(newEmployee);
		}
		return "/WEB-INF/jsp/join.jsp";
    }


}