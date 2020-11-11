package egovframework.example.cmmn.web;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import egovframework.example.board.service.UserVO;
import egovframework.example.cmmn.service.CommonService;
import egovframework.example.cmmn.service.MenuVO;
import egovframework.rte.fdl.property.EgovPropertyService;

@Controller
public class CommonController {
	
	/** EgovSampleService */
	@Resource(name = "commonService")
	private CommonService commonService;
	
	/** EgovPropertyService */
	@Resource(name = "propertiesService")
	protected EgovPropertyService propertiesService;
	
	@RequestMapping(value="managementMenu.do")
	public String managementMenu(ModelMap model, HttpSession session) throws Exception {
		
		String user_roll = ((UserVO)session.getAttribute("user")).getUser_roll();
		
		MenuVO mvo = new MenuVO();
		mvo.setMenu_auth(user_roll);
		
		model.addAttribute("menuList", commonService.selectMenuList(mvo));
		
		return "cmmn/managementMenu";
	}
	
	@RequestMapping(value="createMenu.do", method=RequestMethod.GET)
	public String createMenu(ModelMap model, HttpSession session) {
		
		String user_roll = ((UserVO)session.getAttribute("user")).getUser_roll();
		
		MenuVO mvo = new MenuVO();
		mvo.setMenu_auth(user_roll);
		
		model.addAttribute("menuList", commonService.selectMenuList(mvo));
		
		return "cmmn/menuForm";
	}
	
	@RequestMapping(value="createMenu.do", method=RequestMethod.POST)
	public String createMenu(ModelMap model, MenuVO mvo, HttpSession session, RedirectAttributes ra) {
		
		mvo.setMenu_create_user(((UserVO)session.getAttribute("user")).getUser_id());
		
		int result = commonService.insertMenu(mvo);
		
		if(result == 1) {
			ra.addFlashAttribute("insertResult", "success");
		} else {
			ra.addFlashAttribute("insertResult", "fail");
		}
		
		return "redirect:/managementMenu.do";
	}
	
	@RequestMapping(value="modifyMenu.do")
	public String modifyMenu(ModelMap model, MenuVO mvo) {
		
		model.addAttribute("menuList", commonService.selectMenuList(mvo));
		
		return "cmmn/menuForm";
	}
}
