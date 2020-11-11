package egovframework.example.cmmn.service.impl;

import java.util.List;

import egovframework.example.cmmn.service.MenuVO;
import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("commonMapper")
public interface CommonMapper {

	List<MenuVO> selectMenuList(MenuVO mvo);
	
	int nextMenuId();
	
	int insertMenu(MenuVO mvo);
}
