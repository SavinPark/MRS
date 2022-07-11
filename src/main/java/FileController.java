

import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.log;

import java.util.List;
import java.util.Locale;

import javax.activation.CommandMap;
import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import dto.FileVO;
import service.impl.FileServiceImpl;

@Controller
@RequestMapping("/")
public class FileController {
	
	private static final Logger logger = (Logger) LoggerFactory.getLogger(CustomerController.class);
	
	@Resource(name = "FileService")
	private FileServiceImpl fileService;
	
	// -------------------------------- TEST ---------------------------------- //
	//// File Info 파일 정보
	@RequestMapping(value = "file", method = RequestMethod.GET)
	public String file (Locale locale, Model model) throws Exception {
		logger.info("file");
		List<FileVO> fileList = fileService.selectFile();
		model.addAttribute("fileList", fileList);
		return "/WEB-INF/jsp/test/file.jsp";
	}
	

	// ------------------------------- 파일 업로드 ------------------------------- //
	// [참고] https://to-dy.tistory.com/95?category=700248
	//@RequestMapping("/board/boardInsert")
    //public ModelAndView boardInsert(CommandMap commandMap, MultipartFile[] file) throws Exception {
    //    ModelAndView mav = new ModelAndView("redirect:/board/boardList");
    //    fileService.insertBoard(commandMap, file);
     //   return mav;
    //}


}
