package egovframework.example.cmmn.service;

import java.util.List;

public interface CommonService {

	List<MenuVO> selectMenuList(MenuVO mvo);
	
	int insertMenu(MenuVO mvo);
}
