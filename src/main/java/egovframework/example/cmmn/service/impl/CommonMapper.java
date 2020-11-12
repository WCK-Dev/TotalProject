package egovframework.example.cmmn.service.impl;

import java.util.List;

import egovframework.example.cmmn.service.MenuVO;
import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("commonMapper")
public interface CommonMapper {

	List<MenuVO> selectMenuList(MenuVO mvo);

	List<MenuVO> selectMenuListAll();
	
	MenuVO selectMenu(MenuVO mvo);
	
	int updateMenu(MenuVO mvo);
	
	int updateLowerMenuAuth(MenuVO mvo);
	
	int deleteMenu(MenuVO mvo);
			
	int nextMenuId();
	
	int insertMenu(MenuVO mvo);
}
