package controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import dto.EmployeeVO;
import service.impl.BoardServiceImpl;
import service.impl.CustomerServiceImpl;
import service.impl.EmployeeServiceImpl;
import service.impl.FileServiceImpl;
import service.impl.SupportServiceImpl;

@Controller
public class MainController {
	
	@Resource(name = "EmployeeService")
	private EmployeeServiceImpl employeeService;
	@Resource(name = "CustomerService")
	private CustomerServiceImpl customerService;
	@Resource(name = "SupportService")
	private SupportServiceImpl supportService;
	@Resource(name = "FileService")
	private FileServiceImpl fileService;
	@Resource(name = "BoardService")
	private BoardServiceImpl boardService;
	
	private static final Logger logger = (Logger) LoggerFactory.getLogger(MainController.class);

	// ---------------------------------------------------------- test
	@RequestMapping(value = "combo")
	public String combo() {
		return "/WEB-INF/jsp/multiCombo.jsp";
	}
	@RequestMapping(value = "selectTest")
	public String selectTest() {
		return "/WEB-INF/jsp/selectTest.jsp";
	}
	// ---------------------------------------------------------- test
	
	// ===================================
	//   HOME
	// ===================================
	@RequestMapping(value = {"/", "home"}, method = RequestMethod.GET)
	public String mrs() throws Exception {
		return "/WEB-INF/jsp/home.jsp";
	}
	
	
	// ===================================
	//   LOGIN
	// ===================================
	// 로그인 페이지 이동
	@RequestMapping(value = "login")
	public String login() {
		return "/WEB-INF/jsp/login.jsp";
	}
	// 로그인
	@RequestMapping(value = "loginAction", method = RequestMethod.POST) 
	public String loginAction(EmployeeVO employeeVO, HttpServletRequest req, RedirectAttributes rttr) throws Exception {
	 logger.info("post login");
		HttpSession session = req.getSession();
		EmployeeVO login = employeeService.selectEmpByIdPw(employeeVO);
		if(login == null) {
			session.setAttribute("employee", null);
			rttr.addFlashAttribute("msg", false);
		}else {
			// 세션 설정
			session.setAttribute("employee", login); // ("세션아이디", 세션에 넣을 값)
			session.setMaxInactiveInterval(60*60);  // 60분 (30분 = 30 * 60)
		}
		return "redirect:/login";
	}
	
	
	// ===================================
	//   LOGOUT
	// ===================================
	@RequestMapping(value = "logoutAction", method = RequestMethod.GET)
	public String logout(HttpSession session) throws Exception{
		session.invalidate();
		return "redirect:/";
	}
	
	
	// ===================================
	//   JOIN
	// ===================================
	// 회원가입 페이지 이동
	@RequestMapping(value = "join")
	public String join() throws Exception{
		return "/WEB-INF/jsp/join.jsp";
	}
	// 회원가입
	@RequestMapping(value = "join/add", method = RequestMethod.POST)
	public String join(Model model, EmployeeVO newEmployee) throws Exception {
		if (newEmployee == null || newEmployee.getEmployee_id() == null || newEmployee.getEmployee_id().isEmpty()
			|| newEmployee.getEmployee_password() == null || newEmployee.getEmployee_password().isEmpty()) {
			//PrintWriter writer = response.getWriter();
            //writer.println("<script>alert('입력해야하는 항목이 남아있습니다.'); history.back();</script>");
			System.out.println("=========================");
		} else {
			employeeService.insertEmployee(newEmployee);
		}
		return "redirect:/login";
    }
	
	
	// ===================================
	//   MYPAGE
	// ===================================
	// 마이페이지로 이동
	@RequestMapping(value = "mypage" , method = RequestMethod.GET)
	public String mypage(HttpServletRequest request, Model model, EmployeeVO employeeVO) throws Exception {
		String myID = request.getParameter("employee_id");
		EmployeeVO myInfoVO = employeeService.selectEmpById(myID);
		model.addAttribute("myInfoVO", myInfoVO);
		return "/WEB-INF/jsp/mypage.jsp";
	}
	// 계정 삭제 후, 홈으로 이동
	@RequestMapping(value = "mypage/deleteAction", method = { RequestMethod.POST })
	public String deleteEmployee(EmployeeVO employeeVO, HttpSession session) throws Exception {
		employeeService.deleteEmployee(employeeVO);
		session.invalidate();
		return "redirect:/";
	}
	// 내 정보 수정 페이지
	@RequestMapping(value = "mypage/edit**", method = RequestMethod.GET)
	public String eidtEmployee(HttpServletRequest request, Model model, EmployeeVO employeeVO) throws Exception {
		String myID = request.getParameter("employee_id");
		EmployeeVO myInfoVO = employeeService.selectEmpById(myID);
		model.addAttribute("myInfoVO", myInfoVO);
		return "/WEB-INF/jsp/edit/edit-employee.jsp";
	}
	// 아이디 중복 체크
	/*
	@RequestMapping(value = "mypage/IDcheck**", method = RequestMethod.GET)
	public String IDcheck(Model model, EmployeeVO employeeVO) throws Exception {
		List<EmployeeVO> employeeList = employeeService.selectEmployee();
		model.addAttribute("employeeList", employeeList);
		return "redirect:/mypage/edit?employee_id=" + employeeVO.getEmployee_id();
	}
	*/
	// 내 정보 수정 후, 마이페이지로 이동
	@RequestMapping(value = "mypage/updateAction", method = { RequestMethod.POST })
	public String updateEmployee(EmployeeVO employeeVO, HttpSession session) throws Exception {
		employeeService.updateEmployee(employeeVO);
		// 여기에 세션 업데이트..?
		return "redirect:/mypage?employee_id=" + employeeVO.getEmployee_id() ;
	}	

}
