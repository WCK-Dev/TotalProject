package egovframework.example.cmmn.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import egovframework.example.board.service.impl.BoardMapper;
import egovframework.example.board.service.impl.BoardServiceImpl;
import egovframework.example.cmmn.service.CommonService;
import egovframework.example.cmmn.service.MenuVO;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;

@Service("commonService")
public class CommonServiceImpl extends EgovAbstractServiceImpl implements CommonService {

	private static final Logger LOGGER = LoggerFactory.getLogger(BoardServiceImpl.class);

	// mybatis 사용
	@Resource(name="commonMapper")
	private CommonMapper commonDAO;

	@Resource(name = "egovIdGnrService")
	private EgovIdGnrService egovIdGnrService;
	
	@Override
	public List<MenuVO> selectMenuList(MenuVO mvo) {
		return commonDAO.selectMenuList(mvo);
	}
	
	@Override
	public List<MenuVO> selectMenuListAll() {
		return commonDAO.selectMenuListAll();
	}
	
	@Override
	public MenuVO selectMenu(MenuVO mvo) {
		return commonDAO.selectMenu(mvo);
	}
	
	@Override
	public int updateMenu(MenuVO mvo) {
		return commonDAO.updateMenu(mvo);
	}
	
	@Override
	public int updateLowerMenuAuth(MenuVO mvo) {
		return commonDAO.updateLowerMenuAuth(mvo);
	}
	
	@Override
	public int deleteMenu(MenuVO mvo) {
		return commonDAO.deleteMenu(mvo);
	}
	
	@Override
	public int insertMenu(MenuVO mvo) {
		
		mvo.setMenu_id(commonDAO.nextMenuId());
		
		return commonDAO.insertMenu(mvo);
	}
	
	@Override
	public List<MenuVO> checkLowerMenu(MenuVO mvo) {
		return commonDAO.checkLowerMenu(mvo);
	}
}
