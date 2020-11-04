package egovframework.example.baseball.web;

import java.util.List;
import java.util.Random;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import egovframework.example.baseball.service.BaseBallService;
import egovframework.example.baseball.service.BaseBallTryVO;
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
	public String baseballList(ModelMap model, HttpSession session) {
		
		model.addAttribute("boardKindsList", boardService.selectBoardKindsList());
		
		model.addAttribute("baseballList", baseballService.selectBaseballList(((UserVO)session.getAttribute("user")).getUser_id()));
		
		return "baseball/baseballList";
	}
	
	@RequestMapping(value="baseballMain.do")
	public String baseballMain(ModelMap model) {
		
		model.addAttribute("boardKindsList", boardService.selectBoardKindsList());
		
		return "baseball/baseballMain";
	}
	
	@RequestMapping(value="insertBaseball.do")
	public String insertBaseball(ModelMap model, HttpSession session) {
		
		model.addAttribute("boardKindsList", boardService.selectBoardKindsList());
		
		BaseBallVO baseball = new BaseBallVO();
		
		//로그인 된 유저 아이디로 userid Set
		baseball.setUser_id(((UserVO)session.getAttribute("user")).getUser_id());
		
		//숫자야구 양식에 맞는 3자리 숫자 생성 및 baseballVO에 입력
		//랜덤으로 숫자를 만드는 로직(메서드로 구현)
		baseball.setBaseball_num(createRandomNum());
		
		//baseball테이블에 게시글 레코드 입력
		baseballService.insertBaseball(baseball);
		
		return "redirect:/baseballPlay.do?baseball_seq=" + baseball.getBaseball_seq();
	}
	
	@RequestMapping(value="baseballPlay.do")
	public String baseballPlay(BaseBallVO bvo, ModelMap model, HttpSession session, RedirectAttributes ra) {
		
		model.addAttribute("boardKindsList", boardService.selectBoardKindsList());
		
		bvo = baseballService.selectBaseball(bvo);
		
		if(bvo != null && ((UserVO)session.getAttribute("user")).getUser_id().equals(bvo.getUser_id())) {
			model.addAttribute("baseball", baseballService.selectBaseball(bvo));
			
			model.addAttribute("baseballTryList", baseballService.selectBaseballTryList(bvo));
		} else {
			ra.addFlashAttribute("baseballErrMsg", "true");
			return "redirect:/baseballList.do";
		}
		
		return "baseball/baseballPlay";
	}
	
	@RequestMapping(value="baseballCheck.do", method=RequestMethod.POST)
	public String baseballCheck(BaseBallTryVO btvo, ModelMap model) {
		
		model.addAttribute("boardKindsList", boardService.selectBoardKindsList());
		
		// 현재 입력된 숫자야구 게임의 번호로 해당 숫자야구게임의 정답을 조회
		BaseBallVO bvo = new BaseBallVO();
		bvo.setBaseball_seq(btvo.getBaseball_seq());
		
		bvo = baseballService.selectBaseball(bvo);
		
		//사용자가 입력한 정답확인 번호와 정답의 숫자를 비교하여 스트라이크, 볼의 갯수를 체크한뒤 해당 정답 확인기록을 DB에 저장
		int[] result = checkNum(bvo.getBaseball_num(), btvo.getBt_num());
		
		btvo.setBt_strike(result[0]);
		btvo.setBt_ball(result[1]);
		baseballService.insertBaseballTry(btvo);
		
		if(result[0] == 3) { //사용자의 입력값이 Stike3 이면 ( 정답일 경우 ) baseball 레코드의 게임 완료 여부를 Y로 변경
			baseballService.doneBaseball(bvo);
		}
		
		return "redirect:/baseballPlay.do?baseball_seq=" + bvo.getBaseball_seq();
	}
	
	public int createRandomNum() {
		/*
		 숫자야구 랜덤 숫자 만들기
		 1. 각자 서로다른 1~9까지의 3자리 임의 숫자
		 2. 0은 허용되지않음
		 */
		
		int number = 0;
		Random random = new Random();
		boolean flag = false;
		
		do {
			number = random.nextInt(1000);
			
			if(number < 123 || number > 987) { //숫자야구에서 허용된 범위 (123~987범위밖의 난수이면 continue를 통해 재생성)
				continue;
			} else {
				String n = String.valueOf(number); //각 자릿수는 중복되면 안되므로, String형으로 변환하여 각 자릿수를 비교
			
				if (n.charAt(0) == n.charAt(1) || n.charAt(0) == n.charAt(2) || n.charAt(1) == n.charAt(2)) //중복값이 존재할 경우 continue
					continue;
				else if (n.charAt(0) == '0' || n.charAt(1) == '0' || n.charAt(2) == '0') // 0은 허용되지 않으므로, 0이 존재하면 continue
					continue;
			}
			
			flag = true;
			
		} while(!flag);
		
		
		return number;
	}
	
	public int[] checkNum(int baseball_num, int bt_num) {
		/*
		 숫자야구 입력 숫자 비교
		 사용자가 댓글에 입력한 3자리 숫자와, 시스템에서 생성된 3자리 숫자를 비교하여
		 배열형태로 Strike = result[0] / Ball = result[1]
		 반환함 (Strike가 3이면 유저 입력값이 정답)
		 */
		
	    int[] result = {0, 0};
	    
	    String answerNum = String.valueOf(baseball_num);
	    String userNum = String.valueOf(bt_num);
	    
	    for(int i=0; i<3; i++){
	    	for(int j=0; j<3; j++) {
	    		if(i == j && answerNum.charAt(i) == userNum.charAt(j)){ // 질문으로 오는 세자리 수랑 정답 후보랑 자리, 숫자 완전히 일치하면 
            		result[0]++; // 스트라이크 추가
            	}
            	if(i != j && answerNum.charAt(i) == userNum.charAt(j)){ // 숫자는 같은데, 자리가 다르면
            		result[1]++; // 볼 추가 
            	}
	    	}
	    }
	    
	    return result;
	}
}
