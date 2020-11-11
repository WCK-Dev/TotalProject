package egovframework.example.cmmn.service;

import java.util.List;

public interface CommonService {

	List<MenuVO> selectMenuList();
	
	int insertMenu(MenuVO mvo);
}
