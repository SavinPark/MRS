

import java.util.ArrayList;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import dto.SupportVO;
import service.impl.SupportServiceImpl;

@Controller
@RequestMapping("/")
public class SupportController {
	
	private static final Logger logger = (Logger) LoggerFactory.getLogger(SupportController.class);
	
	@Resource(name = "SupportService")
	private SupportServiceImpl supportService;
	
	// ------------------------------ TEST --------------------------------// 
	//// Support 지원
	@RequestMapping(value = "support", method = RequestMethod.GET )
	public String home(Locale locale, Model model) throws Exception {
		logger.info("support");
		List<SupportVO> supportList = supportService.selectSupport();
		model.addAttribute("supportList", supportList);
		return "/WEB-INF/jsp/test/support.jsp";
	}

	// 1) 데이터베이스에서 Support의 목록을 가져오는 함수
	@RequestMapping(value = "board", method = RequestMethod.GET )
	public String getSupportList(Locale locale, Model model) throws Exception {
		logger.info("support");
		List<SupportVO> supportList = supportService.selectSupport();
		model.addAttribute("supportList", supportList);
		return "/WEB-INF/jsp/board.jsp";
	}
	

}
