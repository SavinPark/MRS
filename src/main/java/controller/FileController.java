package controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class FileController {
	
	// 첨부파일 업로드
	@RequestMapping("/file/upload.do")
	public String uploadFile(MultipartFile[] upload, HttpServletRequest request) {

		// 파일이 업로드 될 경로 설정
		// C:\Users\jinyg\eclipse\eclipse-jee-2021-12-R-win32-x86_64\eclipse-workspace\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\MRStest\resources
		String saveDir = request.getSession().getServletContext().getRealPath("/resources/upload/file");

		// 위에서 설정한 경로의 폴더가 없을 경우 생성
		File dir = new File(saveDir);

		if (!dir.exists()) {
			dir.mkdirs();
		}

		// 파일 업로드
		for (MultipartFile f : upload) {
			if (!f.isEmpty()) {

				// 기존 파일 이름을 받고 확장자 저장
				String orifileName = f.getOriginalFilename();
				String ext = orifileName.substring(orifileName.lastIndexOf("."));

				// 이름 값 변경을 위한 설정
				SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd-HHmmssSSS");
				int rand = (int) (Math.random() * 1000);

				// 파일 이름 변경
				String reName = sdf.format(System.currentTimeMillis()) + "_" + rand + ext;

				// 파일 저장
				try {
					f.transferTo(new File(saveDir + "/" + reName));
				} catch (IllegalStateException | IOException e) {
					e.printStackTrace();
				}
			}
		}
		//return "redirect:/support/add?board_idx=";
		return "uploadEnd";
	}
	
	/*
	// 첨부파일 다운로드
	@RequestMapping("/file/filedownload")
	public void fileDownload(HttpServletRequest request, HttpServletResponse response) {
		String saveDir = request.getSession().getServletContext().getRealPath("/resources/upload/file");
		String fileName = "20190223-223005277_939.jpg";
		File file = new File(saveDir + "/" + fileName);
		FileInputStream fis = null;
		BufferedInputStream bis = null;
		ServletOutputStream sos = null;
		try {
			fis = new FileInputStream(file);
			bis = new BufferedInputStream(fis);
			sos = response.getOutputStream();
			String reFilename = "";
			boolean isMSIE = request.getHeader("user-agent").indexOf("MSIE") != -1
					|| request.getHeader("user-agent").indexOf("Trident") != -1;
			if (isMSIE) {
				reFilename = URLEncoder.encode("이미지 파일.jpg", "utf-8");
				reFilename = reFilename.replaceAll("\\+", "%20");
			} else {
				reFilename = new String("이미지 파일.jpg".getBytes("utf-8"), "ISO-8859-1");
			}
			response.setContentType("application/octet-stream;charset=utf-8");
			response.addHeader("Content-Disposition", "attachment;filename=\"" + reFilename + "\"");
			response.setContentLength((int) file.length());
			int read = 0;
			while ((read = bis.read()) != -1) {
				sos.write(read);
			}
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			try {
				sos.close();
				bis.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
	*/

}


// MainController Test
/*
// text Ajax
@RequestMapping(value = "plus")  // http://localhost:9000/MRStest/plus
public String hello() {
	return "/WEB-INF/jsp/test--x/plus.jsp";
}
@RequestMapping(value = "doPlusV1") // http://localhost:9000/MRStest/doPlus
@ResponseBody
int plus (int num1, int num2) {
	return num1 + num2;
}
@RequestMapping(value = "doPlusV2") // http://localhost:9000/MRStest/doPlus
@ResponseBody
String plusMsg (int num1, int num2) {
	String msg ="실행 성공";  // 메시지
	int rs = num1 + num2; // 연산 결과
	return rs + "/" + msg;
}
@RequestMapping(value = "doPlusV3") // http://localhost:9000/MRStest/doPlus
@ResponseBody
String plusMsgCode (int num1, int num2) {
	String msg ="실행 성공";  // 메시지
	int rs = num1 + num2; // 연산 결과
	String code = "S-1"; // 결과 코드 (성공-1)
	return rs + "/" + msg + "/" + code;
}
// ------------------------------- TEST --------------------------------- //
//// 첨부파일 저장 test
@RequestMapping(value = "filetest")
public String hello() {
	return "/WEB-INF/jsp/test/filetest.jsp";
}
//// HELLO
@RequestMapping(value = "hello")
public String hello() {
	return "/WEB-INF/jsp/test/hello.jsp";
}
//// BOARDWRITE
@RequestMapping(value = "boardwrite")
public String boardwrite() {
	return "/WEB-INF/jsp/test/boardWrite.jsp";
}
//// Employee
@RequestMapping(value = "employeeinfo", method = RequestMethod.GET)
public String employeeinfo(Locale locale, Model model) throws Exception {
	logger.info("employee");
	List<EmployeeVO> employeeList = employeeService.selectEmployee();
	model.addAttribute("employeeList", employeeList);
	return "/WEB-INF/jsp/test/employee.jsp";
}
////Customer 
@RequestMapping(value = "customerinfo", method = RequestMethod.GET )
public String customerinfo(Locale locale, Model model) throws Exception {
	logger.info("customer");
	List<CustomerVO> customerList = customerService.selectCustomer();
	model.addAttribute("customerList", customerList);
	return "/WEB-INF/jsp/test/customer.jsp";
}
////Support Info
@RequestMapping(value = "supportinfo", method = RequestMethod.GET )
public String homeinfo(Locale locale, Model model) throws Exception {
	logger.info("support");
	List<SupportVO> supportList = supportService.selectSupport();
	model.addAttribute("supportList", supportList);
	return "/WEB-INF/jsp/test/support.jsp";
}
////File Info 
@RequestMapping(value = "fileinfo", method = RequestMethod.GET)
public String fileinfo (Locale locale, Model model) throws Exception {
	logger.info("file");
	List<FileVO> fileList = fileService.selectFile();
	model.addAttribute("fileList", fileList);
	return "/WEB-INF/jsp/test/file.jsp";
}
//// Board Info 
@RequestMapping(value = "info/board", method = RequestMethod.GET)
public String boardinfo (Locale locale, Model model) throws Exception {
	logger.info("board");
	List<BoardVO> boardList = boardService.selectBoard();
	model.addAttribute("boardList", boardList);
	return "/WEB-INF/jsp/test/board.jsp";
}
*/


