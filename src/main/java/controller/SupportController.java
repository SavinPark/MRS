package controller;

import java.io.File;
import java.io.IOException;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import dto.BoardVO;
import dto.CustomerVO;
import dto.EmployeeVO;
import dto.FileVO;
import dto.SupportVO;
import service.impl.BoardServiceImpl;
import service.impl.CustomerServiceImpl;
import service.impl.EmployeeServiceImpl;
import service.impl.FileServiceImpl;
import service.impl.SupportServiceImpl;

@Controller
public class SupportController {
	
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
	
	// ===================================
	// Support Board
	// ===================================
	// 보고서 목록 게시판
	@RequestMapping(value = "support")
	public String support(HttpServletRequest request, Model model) throws Exception {
		String pageParam = request.getParameter("pageNumber");
		int page;
		if (pageParam == null || pageParam == "1") {
			page = 0;
		} else {
			page = (Integer.parseInt(pageParam)-1) * 10; 
		}
		List<BoardVO> boardList = boardService.selectTenBoard(page);
		model.addAttribute("boardList", boardList);
		List<SupportVO> supportList = supportService.selectTenSupport(page);
		model.addAttribute("supportList", supportList);
		// 새로 작성할 보고서 idx를 지정하기 위함
		int maxSupportIdx = supportService.maxSupportIdx(); 
		model.addAttribute("maxSupportIdx",maxSupportIdx);
		// 지원 테이블 행 개수
		int countBoard = boardService.countBoard();
		model.addAttribute("countBoard", countBoard);
		
		return "/WEB-INF/jsp/support.jsp";
	}

	// 보고서 작성 페이지
	@RequestMapping(value = "support/add**")
	public String formSupport(HttpServletRequest request, Model model, SupportVO newSupport, CustomerVO customerVO)
			throws Exception {
		// 고객사 ComboBox
		List<String> custCompanyCombo = customerService.selectCustCompany();
		model.addAttribute("custCompanyCombo", custCompanyCombo);
		// 지원SE ComboBox
		List<EmployeeVO> empCombo = employeeService.selectEmpIdAndManager();
		model.addAttribute("empCombo", empCombo);
		return "/WEB-INF/jsp/form/form-support.jsp";
	}

	// --------- getDepartmentData : 고객사 정보 받고, 소속 부서 정보 조회해서 리턴
	@RequestMapping(value = "support/getDepartmentData", produces = "application/text; charset=UTF-8")
	@ResponseBody
	public String getDepartmentData(String company) {
		// :: 고객사 소속 부서 조회 ::
		List<String> custDepartmentCombo = customerService.selectCustDepartByCompany(company);
		// System.out.println("=========== 부서 데이터 조회 결과 ===========" + custDepartmentCombo);
		// :: JSON 형태 리턴 (부서 리스트) ::
		String result = "{ \"departmentList\" : ";
		List<String> list = new ArrayList<>();
		for (String ele : custDepartmentCombo) {
			String listEle = "\"" + ele + "\"";
			list.add(listEle);
		}
		result = result + list + "}";
		System.out.println("=========== 리턴할 result ===========" + result);
		return result;
	}
	/* [AjaxDept 보류] 
	@RequestMapping(value = "support/getDepartmentData", produces = "application/text; charset=UTF-8")
	@ResponseBody
	public AjaxDept getDepartmentData(String company, Model model) {
		AjaxDept ret = new AjaxDept();
		// :: 고객사 소속 부서 조회 ::
		List<CustomerVO> custDepartmentCombo = customerService.selectCustDepartByCompany(company);
		// System.out.println("=========== 부서 데이터 조회 결과 ===========" + custDepartmentCombo);
		// :: JSON 형태 리턴 (부서 리스트) ::
		List<String> list = new ArrayList<>();
		for (CustomerVO ele : custDepartmentCombo) {
			list.add(ele.getCustomer_department());
		}
		ret.setCompany(company);
		ret.setDepartmentList(custDepartmentCombo);
		System.out.println("=========== 리턴할 ret ===========" + ret);
		System.out.println("=========== 고객사 ===========" + ret.getCompany());
		System.out.println("=========== 소속 부서 리스트 ===========" + ret.getDepartmentList());
		return ret;
	}
	*/

	// --------- getManagerData : 고객사/부서 정보 받고, 소속 담당자 정보 조회해서 리턴
	@RequestMapping(value = "support/getManagerData", produces = "application/text; charset=UTF-8")
	@ResponseBody
	public String getManagerData(String company, String department) {
		// :: 고객사 & 부서 소속 담당자 조회 ::
		CustomerVO customer = new CustomerVO();
		customer.setCustomer_company(company);
		customer.setCustomer_department(department);
		List<CustomerVO> custManagerCombo = customerService.selectCustManagerByCompDepart(customer);
		System.out.println("=========== 담당자 데이터 조회 결과 ===========" + custManagerCombo);
		// :: JSON 형태 리턴 (고객사, 부서 리스트) ::
		String result = "{ \"managerList\" : ";
		List<String> list = new ArrayList<>();
		for (CustomerVO ele : custManagerCombo) {
			String listEle = "\"" + ele.getCustomer_manager() + "\"";
			list.add(listEle);
		}
		result = result + list + "}";
		return result;
	}

	// --------- getCustomerId : 고객사/부서/담당자 정보를 받고, 이에 해당하는 고객 ID 리턴
	@RequestMapping(value = "support/getCustomerId", produces = "application/text; charset=UTF-8")
	@ResponseBody
	public String getCustomerId(String company, String department, String manager) {
		// :: 고객사 & 부서 & 담당자 정보에 해당하는 고객ID 조회 ::
		CustomerVO customer = new CustomerVO();
		customer.setCustomer_company(company);
		customer.setCustomer_department(department);
		customer.setCustomer_manager(manager);
		int customer_id = customerService.selectCustIDByCompDprtMngr(customer);
		System.out.println("=========== 고객ID 조회 결과 ===========" + customer_id);
		String result = "{ \"id\" : " + customer_id + "}";
		return result;
	}

	// 보고서 등록 후, 지원 정보 게시판 페이지로 이동
	@RequestMapping(value = "support/addAction", method = RequestMethod.POST)
	public String addSupport(SupportVO newSupport, BoardVO newBoard, FileVO newFile, MultipartFile[] upload, HttpServletRequest request) throws Exception {
		System.out.println("========== 보고서 DB 등록 시작 ==========");
		supportService.insertSupport(newSupport);
		boardService.insertBoard(newBoard);
		System.out.println("========== 보고서 DB 등록 완료 ==========");
		// --------------- 첨부파일 (시작) ----------------- //
		System.out.println("========== 파일 서버 저장 시작 ==========");
		// [첨부파일 저장 위치]
		// (1) C:\mrs\file
		//String saveDir = "C:\\mrs\\file\\"; 
		// (2) C:\Users\jinyg\eclipse\eclipse-jee-2021-12-R-win32-x86_64\eclipse-workspace\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\MRStest\resources
		String saveDir = request.getSession().getServletContext().getRealPath("/resources/upload/file");
		File dir = new File(saveDir);
		// 위에서 설정한 경로의 폴더가 없을 경우 생성
		if (!dir.exists()) { 
			dir.mkdirs();
		}
		// :: 파일 업로드 ::
		if(upload != null ) {		
			for (MultipartFile f : upload) {
				if (!f.isEmpty()) {
					String orifileName = f.getOriginalFilename();  // 원래 파일명
					String ext = orifileName.substring(orifileName.lastIndexOf(".")); // 확장자
					// 물리적 서버에 저장될 파일명
					SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd-HHmmssSSS");
					int rand = (int) (Math.random() * 1000);
					String reName = sdf.format(System.currentTimeMillis()) + "_" + rand + ext;
					// 첨부파일 업로드
					try {
						f.transferTo(new File(saveDir + "/" + reName));
					} catch (IllegalStateException | IOException e) {
						e.printStackTrace();
					}
					// DB 등록 
					newFile.setFile_original_name(orifileName); // 사용자 지정 파일명 file_original_name
					newFile.setFile_save_name(reName); // 서버에 저장되는 파일명 file_save_name
					int bytes = (int) f.getSize();
					newFile.setFile_size(bytes); // 크기 file_size
					newFile.setFile_extension(ext); // 확장자 file_extension
					fileService.insertFile(newFile);
				}
			}
		}
		return "redirect:/support";
	}

	// 보고서 상세 페이지
	@RequestMapping(value = "support/view**", method = RequestMethod.GET)
	public String viewSupport(HttpServletRequest request, Model model) throws Exception {
		int sprtIDX = Integer.parseInt(request.getParameter("support_idx"));
		// (support_idx에 해당하는) support, board, file 조회
		SupportVO sprtInfoVO = supportService.selectSprtByIdx(sprtIDX);
		model.addAttribute("sprtInfoVO", sprtInfoVO);
		BoardVO boardInfoVO = boardService.selectBrdBySprtIdx(sprtIDX);
		model.addAttribute("boardInfoVO", boardInfoVO);
		List<FileVO> fileInfoVO = fileService.selectFileIdxOrinameBySprtIdx(sprtIDX);
		model.addAttribute("fileInfoVO", fileInfoVO);
		// 직원 정보
		String empID = sprtInfoVO.getEmployee_id();
		EmployeeVO empInfoVO = employeeService.selectEmpById(empID);
		model.addAttribute("empInfoVO", empInfoVO);
		// 고객 정보
		int custID = sprtInfoVO.getCustomer_id();
		CustomerVO custInfoVO = customerService.selectCustById(custID);
		model.addAttribute("custInfoVO", custInfoVO);
		return "/WEB-INF/jsp/view/view-support.jsp";
	}

	// --------- downloadFile : file_idx 데이터를 받아서 해당 첨부파일 다운로드
	@RequestMapping(value = "support/view/download", produces = "application/text; charset=UTF-8")
	public void downloadFile(int file_idx, HttpServletRequest request, HttpServletResponse response) throws Exception {
		// :: 첨부파일 조회 ::
		FileVO fileVO = fileService.selectFileByIdx(file_idx);
		String storedFileName = fileVO.getFile_save_name(); // 저장된 파일명
		String originFileName = fileVO.getFile_original_name(); // 원래 파일명
		String saveDir = request.getSession().getServletContext().getRealPath("/resources/upload/file"); // 파일 경로
		// :: 첨부파일 다운로드 :: 
		byte fileByte[] = FileUtils.readFileToByteArray(new File( saveDir + "\\"+storedFileName));
		response.setContentType("application/octet-stream"); 
		response.setContentLength(fileByte.length);
		response.setHeader("Content-Disposition", "attachment; fileName=\"" + URLEncoder.encode(originFileName,"UTF-8")+"\";"); 
		response.setHeader("Content-Transfer-Encoding", "binary"); 
		response.getOutputStream().write(fileByte); 
		response.getOutputStream().flush(); 
		response.getOutputStream().close();
	}
	

	// 보고서 삭제 후, 보고서 리스트 페이지로 이동
	@RequestMapping(value = "support/deleteAction", method = { RequestMethod.POST })
	public String deleteSupport(SupportVO supportVO, BoardVO boardVO, FileVO fileVO) throws Exception {
		boardService.deleteBoard(boardVO.getSupport_idx());
		fileService.deleteFile(fileVO.getSupport_idx());
		supportService.deleteSupport(supportVO.getSupport_idx());
		// fileService.deleteFile(fileVO.getSupport_idx());
		return "redirect:/support";
	}

	// 보고서 수정 페이지
	@RequestMapping(value = "support/edit")
	public String eidtSupport(HttpServletRequest request, Model model) throws Exception {
		int sprtIDX = Integer.parseInt(request.getParameter("support_idx"));
		SupportVO sprtInfoVO = supportService.selectSprtByIdx(sprtIDX);
		model.addAttribute("sprtInfoVO", sprtInfoVO);
		BoardVO boardInfoVO = boardService.selectBrdBySprtIdx(sprtIDX);
		model.addAttribute("boardInfoVO", boardInfoVO);
		List<FileVO> fileInfoVO = fileService.selectFileIdxOrinameBySprtIdx(sprtIDX);
		model.addAttribute("fileInfoVO", fileInfoVO);

		String empID = sprtInfoVO.getEmployee_id();
		EmployeeVO empInfoVO = employeeService.selectEmpById(empID);
		model.addAttribute("empInfoVO", empInfoVO);

		int custID = sprtInfoVO.getCustomer_id();
		CustomerVO custInfoVO = customerService.selectCustById(custID);
		model.addAttribute("custInfoVO", custInfoVO);

		// ComboBox (고객사 | 부서 | 담당자 ) : 기존 보고서 데이터에 맞는 옵션만
		List<String> custCompanyCombo = customerService.selectCustCompany();
		model.addAttribute("custCompanyCombo", custCompanyCombo);
		String company = custInfoVO.getCustomer_company();
		List<String> custDepartCombo = customerService.selectCustDepartByCompany(company);
		model.addAttribute("custDepartCombo", custDepartCombo);
		List<CustomerVO> custManagerCombo = customerService.selectCustManagerByCompDepart(custInfoVO);
		model.addAttribute("custManagerCombo", custManagerCombo);
		// ComboBox (지원SE) : 전체 옵션
		List<EmployeeVO> empCombo = employeeService.selectEmpIdAndManager();
		model.addAttribute("empCombo", empCombo);
		
		System.out.println("-===========================- 수정페이지");

		return "/WEB-INF/jsp/edit/edit-support.jsp";
	}

	// 첨부파일 개별 삭제
	
	// 보고서 수정 후, 해당 보고서 상세보기 페이지
	@RequestMapping(value = "support/updateAction", method = RequestMethod.POST )
	public String updateCustomer(SupportVO supportVO, BoardVO boardVO) throws Exception {
		System.out.println("------------------- 연결 O ");
		boardService.updateBoard(boardVO);
		System.out.println("------------------- 1 ");
		//fileService.updateFile(fileVO);
		//System.out.println("------------------- 2 ");
		supportService.updateSupport(supportVO);
		System.out.println("------------------- End ");
		return "redirect:/support/view?support_idx=" + supportVO.getSupport_idx();
	}

}
