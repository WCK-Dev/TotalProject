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
	public List<MenuVO> selectMenuList() {
		return commonDAO.selectMenuList();
	}
	
	@Override
	public int insertMenu(MenuVO mvo) {
		
		mvo.setMenu_id(commonDAO.nextMenuId());
		
		return commonDAO.insertMenu(mvo);
	}
}
