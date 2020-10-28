/*
 * Copyright 2008-2009 the original author or authors.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package egovframework.example.checklist.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import egovframework.example.board.service.UserVO;
import egovframework.example.checklist.service.AnswerVO;
import egovframework.example.checklist.service.CheckBoardVO;
import egovframework.example.checklist.service.CheckListService;
import egovframework.example.checklist.service.CheckListVO;
import egovframework.example.checklist.service.LogVO;
import egovframework.example.checklist.service.ShowListVO;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;

@Service("checkListService")
public class CheckListServiceImpl extends EgovAbstractServiceImpl implements CheckListService {

	private static final Logger LOGGER = LoggerFactory.getLogger(CheckListServiceImpl.class);

	// mybatis 사용
	@Resource(name="checkListMapper")
	private CheckListMapper checkListDAO;

	@Resource(name = "egovIdGnrService")
	private EgovIdGnrService egovIdGnrService;

	@Override
	public List<UserVO> selectUserList() {
		return checkListDAO.selectUserList();
	}

	@Override
	public int insertCheckBoard(CheckBoardVO vo) {
		return checkListDAO.insertCheckBoard(vo);
	}
	
	@Override
	public int updateCheckBoard(CheckBoardVO vo) {
		return checkListDAO.updateCheckBoard(vo);
	}
	
	@Override
	public int deleteCheckBoard(CheckBoardVO vo) {
		return checkListDAO.deleteCheckBoard(vo);
	}

	@Override
	public int insertCheckList(CheckListVO vo) {
		return checkListDAO.insertCheckList(vo);
	}
	
	@Override
	public int deleteCheckList(CheckListVO vo) {
		return checkListDAO.deleteCheckList(vo);
	}

	@Override
	public int insertShowList(ShowListVO vo) {
		return checkListDAO.insertShowList(vo);
	}
	
	@Override
	public int deleteShowList(ShowListVO vo) {
		return checkListDAO.deleteShowList(vo);
	}

	@Override
	public List<CheckBoardVO> selectCheckBoardListAll(CheckBoardVO vo) {
		return checkListDAO.selectCheckBoardListAll(vo);
	}
	
	@Override
	public int selectCheckBoardListAllTotCnt(CheckBoardVO vo) {
		return checkListDAO.selectCheckBoardListAllTotCnt(vo);
	}

	@Override
	public List<CheckBoardVO> selectCheckBoardTopListAll() {
		return checkListDAO.selectCheckBoardTopListAll();
	}
	
	@Override
	public List<CheckBoardVO> selectCheckBoardList(CheckBoardVO vo) {
		return checkListDAO.selectCheckBoardList(vo);
	}
	
	@Override
	public int selectCheckBoardListTotCnt(CheckBoardVO vo) {
		return checkListDAO.selectCheckBoardListTotCnt(vo);
	}

	@Override
	public List<CheckBoardVO> selectCheckBoardTopList(CheckBoardVO vo) {
		return checkListDAO.selectCheckBoardTopList(vo);
	}

	@Override
	public CheckBoardVO selectCheckBoard(CheckBoardVO vo) {
		return checkListDAO.selectCheckBoard(vo);
	}
	
	@Override
	public LogVO selectLog(LogVO vo) {
		return checkListDAO.selectLog(vo);
	}
	
	@Override
	public int insertLog(LogVO vo) {
		return checkListDAO.insertLog(vo);
	}
	
	@Override
	public int updateLog(LogVO vo) {
		return checkListDAO.updateLog(vo);
	}

	@Override
	public List<CheckListVO> selectCheckList(CheckBoardVO vo) {
		return checkListDAO.selectCheckList(vo);
	}

	@Override
	public List<ShowListVO> selectShowList(CheckBoardVO vo) {
		return checkListDAO.selectShowList(vo);
	}
	
	@Override
	public List<AnswerVO> selectAnswerList(CheckBoardVO vo) {
		return checkListDAO.selectAnswerList(vo);
	}
	
	@Override
	public AnswerVO selectAnswerOne(AnswerVO vo) {
		return checkListDAO.selectAnswerOne(vo);
	}
	
	@Override
	public int insertAnswer(AnswerVO vo) {
		return checkListDAO.insertAnswer(vo);
	}
	
	@Override
	public int updateAnswer(AnswerVO vo) {
		return checkListDAO.updateAnswer(vo);
	}

	@Override
	public List<LogVO> selectLogList(CheckBoardVO vo) {
		return checkListDAO.selectLogList(vo);
	}
	
	@Override
	public List<AnswerVO> selectUserAnswerList(CheckBoardVO vo) {
		return checkListDAO.selectUserAnswerList(vo);
	}
}
