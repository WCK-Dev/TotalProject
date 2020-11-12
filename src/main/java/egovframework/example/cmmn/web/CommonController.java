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
	public String managementMenu(ModelMap model) throws Exception {
		
		model.addAttribute("menuListAll", commonService.selectMenuListAll());
		
		return "cmmn/managementMenu";
	}
	
	@RequestMapping(value="createMenu.do", method=RequestMethod.GET)
	public String createMenu(ModelMap model) {
		
		model.addAttribute("menuListAll", commonService.selectMenuListAll());
		
		return "cmmn/createMenu";
	}
	
	@RequestMapping(value="createMenu.do", method=RequestMethod.POST)
	public String createMenu(ModelMap model, MenuVO mvo, HttpSession session) {
		
		mvo.setMenu_create_user(((UserVO)session.getAttribute("user")).getUser_id());
		
		commonService.insertMenu(mvo);
		
		return "redirect:/managementMenu.do";
	}
	
	@RequestMapping(value="modifyMenu.do", method=RequestMethod.GET)
	public String modifyMenu(ModelMap model, MenuVO mvo) {
		
		model.addAttribute("menuListAll", commonService.selectMenuListAll());
		model.addAttribute("menuInfo", commonService.selectMenu(mvo));
		
		return "cmmn/modifyMenu";
	}
	
	@RequestMapping(value="modifyMenu.do", method=RequestMethod.POST)
	public String modifyMenu(MenuVO mvo, HttpSession session) {
		
		mvo.setMenu_modify_user(((UserVO)session.getAttribute("user")).getUser_id());
		
		commonService.updateMenu(mvo);
		
		if(mvo.getMenu_level() != 3) {
			commonService.updateLowerMenuAuth(mvo);
		}
		
		return "redirect:/managementMenu.do";
	}
	
	@RequestMapping(value="deleteMenu.do")
	public String deleteMenu(MenuVO mvo) {
		
		commonService.deleteMenu(mvo);
		
		return "redirect:/managementMenu.do";
	}
}
