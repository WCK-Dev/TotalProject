package egovframework.example.servey.web;

import java.sql.Date;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import egovframework.example.board.service.UserVO;
import egovframework.example.cmmn.service.CommonService;
import egovframework.example.cmmn.service.MenuVO;
import egovframework.example.servey.service.ServeyAnswerVO;
import egovframework.example.servey.service.ServeyLogVO;
import egovframework.example.servey.service.ServeyQuestionVO;
import egovframework.example.servey.service.ServeyService;
import egovframework.example.servey.service.ServeyVO;
import egovframework.rte.fdl.property.EgovPropertyService;

@Controller
public class ServeyController {
	
	/** EgovSampleService */
	@Resource(name = "serveyService")
	private ServeyService serveyService;
	
	@Resource(name = "commonService")
	private CommonService commonService;
	
	/** EgovPropertyService */
	@Resource(name = "propertiesService")
	protected EgovPropertyService propertiesService;
	
	@RequestMapping(value="serveyList.do")
	public String serveyMain(ModelMap model, HttpSession session) {
		
		String user_roll = ((UserVO)session.getAttribute("user")).getUser_roll();
		
		MenuVO mvo = new MenuVO();
		mvo.setMenu_auth(user_roll);
		
		model.addAttribute("showMenuList", commonService.selectMenuList(mvo));
		
		model.addAttribute("serveyList", serveyService.selectServeyList());
		
		return "servey/serveyList";
	}

	@RequestMapping(value="serveyMain.do")
	public String serveyMain(ServeyVO serveyVO, ServeyLogVO logVO, ModelMap model, RedirectAttributes ra, HttpServletRequest request) {
		
			String user_roll = ((UserVO)request.getSession().getAttribute("user")).getUser_roll();
					
			MenuVO mvo = new MenuVO();
			mvo.setMenu_auth(user_roll);
			
			model.addAttribute("showMenuList", commonService.selectMenuList(mvo));
			
			int check = serveyService.checkServey(serveyVO);
			
			if(check == 0) { //요청된 s_seq값에 따라 DB조회결과, 해당 설문이 없을 때
				ra.addFlashAttribute("noneServey", "true");
				
				return "redirect:/serveyList.do"; 
			
			}else {
				String user_id = ((UserVO)request.getSession().getAttribute("user")).getUser_id();
				logVO.setUser_id(user_id);
				
				model.addAttribute("servey", serveyService.selectServey(serveyVO));
				model.addAttribute("log", serveyService.checkServeyLog(logVO));
				
				return "servey/serveyMain";
			}
			
	}
	
	@RequestMapping(value="serveyForm.do")
	public String serveyForm(ServeyVO serveyVO, ServeyQuestionVO questionVO, ServeyLogVO logVO, ModelMap model, RedirectAttributes ra, HttpServletRequest request) {
		
		int serveyCheck = serveyService.checkServey(serveyVO);
		
		if(serveyCheck == 0) {
			ra.addFlashAttribute("noneServey", "true");
			
			return "redirect:/serveyList.do"; 
		}
		
		/* 설문조사 기한에 맞는지 체크 */
		serveyVO = serveyService.selectServey(serveyVO);
		Date now = new Date(System.currentTimeMillis());
		Date s_stratdate = serveyVO.getS_startdate();
		Date s_enddate = serveyVO.getS_enddate();

		if(now.before(s_stratdate) || now.after(s_enddate)) { // 검사기한이 지나거나, 이전일때
			ra.addFlashAttribute("notPeriod", "true");
			
			return "redirect:/serveyMain.do?s_seq=" + questionVO.getS_seq();
		}
		
		/*이미 설문에 참여한 유저인지 로그를 확인*/
		String user_id = ((UserVO)request.getSession().getAttribute("user")).getUser_id();
		logVO.setUser_id(user_id);
		
		int check = serveyService.checkServeyLog(logVO);
		
		if(check == 1) { // 이미 설문작성 기록이 있을때
			ra.addFlashAttribute("Duplicate", "true");
			
			return "redirect:/serveyMain.do?s_seq=" + questionVO.getS_seq();
		} else { // 없을경우 정상수행
			
			model.addAttribute("questionList", serveyService.selectServeyQuestionList(questionVO));
			model.addAttribute("choiceList", serveyService.selectServeyChoiceList());
			
			return "servey/serveyForm";
		}
	}
	
	@RequestMapping(value="serveyModify.do")
	public String serveyModify(ServeyVO serveyVO, ServeyQuestionVO questionVO, ServeyLogVO logVO, ModelMap model, RedirectAttributes ra, HttpServletRequest request) {
		
		int serveyCheck = serveyService.checkServey(serveyVO);
		
		if(serveyCheck == 0) {
			ra.addFlashAttribute("noneServey", "true");
			
			return "redirect:/serveyList.do"; 
		}
		
		serveyVO = serveyService.selectServey(serveyVO);
		Date now = new Date(System.currentTimeMillis());
		Date s_stratdate = serveyVO.getS_startdate();
		Date s_enddate = serveyVO.getS_enddate();

		if(now.before(s_stratdate) || now.after(s_enddate)) {
			ra.addFlashAttribute("notPeriod", "true");
			
			return "redirect:/serveyMain.do?s_seq=" + questionVO.getS_seq();
		}
		
		/*이미 설문에 참여한 유저인지 로그를 확인*/
		String user_id = ((UserVO)request.getSession().getAttribute("user")).getUser_id();
		logVO.setUser_id(user_id);
		
		int check = serveyService.checkServeyLog(logVO);
		
		if(check == 0) { // 설문 작성 기록이 없을떄
			ra.addFlashAttribute("noneLog", "true");
			
			return "redirect:/serveyMain.do?s_seq=" + questionVO.getS_seq();
			
		} else { // 있을경우 정상수행
			
			ServeyAnswerVO answerVO = new ServeyAnswerVO();
			answerVO.setS_seq(questionVO.getS_seq());
			answerVO.setUser_id(user_id);
			
			model.addAttribute("questionList", serveyService.selectServeyQuestionList(questionVO));
			model.addAttribute("choiceList", serveyService.selectServeyChoiceList());
			model.addAttribute("answerList", serveyService.selectServeyAnswerList(answerVO));
			
			return "servey/serveyModify";
		}
	}
	
	@RequestMapping(value="insertAnswer.do", produces="application/json; charset=utf8")
	@ResponseBody
	public String insertAnswer(ServeyAnswerVO answerVO, HttpServletRequest request) {
		
        UserVO user = (UserVO)request.getSession().getAttribute("user");
        answerVO.setUser_id(user.getUser_id());

        return serveyService.insertServeyAnswer(answerVO) + "";
	}
	
	@RequestMapping(value="updateAnswer.do")
	@ResponseBody
	public String updateAnswer(ServeyAnswerVO answerVO, HttpServletRequest request) {
		
		UserVO user = (UserVO)request.getSession().getAttribute("user");
		answerVO.setUser_id(user.getUser_id());
		
		return serveyService.updateServeyAnswer(answerVO) + "";
	}
	
	@RequestMapping(value="insertLog.do")
	@ResponseBody
	public String insertLog(ServeyLogVO logVO, HttpServletRequest request) {
		
		UserVO user = (UserVO)request.getSession().getAttribute("user");
		logVO.setUser_id(user.getUser_id());
		
		return serveyService.insertServeyLog(logVO) + "";
	}
	
	@RequestMapping(value="updateLog.do")
	@ResponseBody
	public String updateLog(ServeyLogVO logVO, HttpServletRequest request) {
		
		UserVO user = (UserVO)request.getSession().getAttribute("user");
		logVO.setUser_id(user.getUser_id());
		
		return serveyService.updateServeyLog(logVO) + "";
	}
	
}
