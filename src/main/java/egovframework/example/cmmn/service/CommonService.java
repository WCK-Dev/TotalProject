package egovframework.example.cmmn.service;

import java.util.List;

public interface CommonService {

	List<MenuVO> selectMenuList(MenuVO mvo);
	
	List<MenuVO> selectMenuListAll();
	
	MenuVO selectMenu(MenuVO mvo);
	
	int updateMenu(MenuVO mvo);
	
	int updateLowerMenuAuth(MenuVO mvo);
	
	int deleteMenu(MenuVO mvo);
	
	int insertMenu(MenuVO mvo);
	
	List<MenuVO> checkLowerMenu(MenuVO mvo);
	
}
