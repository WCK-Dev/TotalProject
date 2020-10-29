package egovframework.example.baseball.web;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import egovframework.example.baseball.service.BaseBallService;
import egovframework.example.baseball.service.BaseBallVO;
import egovframework.example.board.service.BoardService;
import egovframework.example.board.service.UserVO;
import egovframework.rte.fdl.property.EgovPropertyService;

@Controller
public class BaseBallController {
	
	/** EgovSampleService */
	@Resource(name = "baseballService")
	private BaseBallService baseballService;
	
	@Resource(name = "boardService")
	private BoardService boardService;
	
	/** EgovPropertyService */
	@Resource(name = "propertiesService")
	protected EgovPropertyService propertiesService;
	
	
	@RequestMapping(value="baseballList.do")
	public String baseballList(ModelMap model) {
		
		model.addAttribute("boardKindsList", boardService.selectBoardKindsList());
		
		return "baseball/baseballList";
	}
	
	@RequestMapping(value="baseballMain.do")
	public String baseballMain(ModelMap model) {
		
		model.addAttribute("boardKindsList", boardService.selectBoardKindsList());
		
		return "baseball/baseballMain";
	}
	
	@RequestMapping(value="baseballPlay.do")
	public String bassballPlay(ModelMap model, HttpSession session) {
		
		model.addAttribute("boardKindsList", boardService.selectBoardKindsList());
		
		BaseBallVO baseball = new BaseBallVO();
		
		//로그인 된 유저 아이디로 userid Set
		baseball.setUser_id(((UserVO)session.getAttribute("user")).getUser_id());
		
		
		//숫자야구 양식에 맞는 3자리 숫자 생성 및 baseballVO에 입력
		/*
		 랜덤으로 숫자를 만드는 로직(메서드로 구현) 
		 */
		baseball.setBaseball_num(new Integer(487));
		
		//baseball테이블에 게시글 레코드 입력
		baseballService.insertBaseball(baseball);
		
		return "baseball/baseballPlay";
	}
}
