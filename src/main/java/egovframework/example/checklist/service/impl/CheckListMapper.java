/*
 * Copyright 2011 MOPAS(Ministry of Public Administration and Security).
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

import egovframework.example.board.service.UserVO;
import egovframework.example.checklist.service.AnswerVO;
import egovframework.example.checklist.service.CheckBoardVO;
import egovframework.example.checklist.service.CheckListVO;
import egovframework.example.checklist.service.LogVO;
import egovframework.example.checklist.service.ShowListVO;
import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("checkListMapper")
public interface CheckListMapper {
	
	List<UserVO> selectUserList();
	
	int insertCheckBoard(CheckBoardVO vo);
	
	int updateCheckBoard(CheckBoardVO vo);
	
	int deleteCheckBoard(CheckBoardVO vo);
	
	int insertCheckList(CheckListVO vo);
	
	int deleteCheckList(CheckListVO vo);
	
	int insertShowList(ShowListVO vo);
	
	int deleteShowList(ShowListVO vo);
	
	List<CheckBoardVO> selectCheckBoardListAll(CheckBoardVO vo);
	
	int selectCheckBoardListAllTotCnt(CheckBoardVO vo);
	
	List<CheckBoardVO> selectCheckBoardTopListAll();
	
	List<CheckBoardVO> selectCheckBoardList(CheckBoardVO vo);
	
	int selectCheckBoardListTotCnt(CheckBoardVO vo);
	
	List<CheckBoardVO> selectCheckBoardTopList(CheckBoardVO vo);
	
	CheckBoardVO selectCheckBoard(CheckBoardVO vo);
	
	LogVO selectLog(LogVO vo);
	
	int insertLog(LogVO vo);
	
	int updateLog(LogVO vo);
	
	List<CheckListVO> selectCheckList(CheckBoardVO vo);
	
	List<ShowListVO> selectShowList(CheckBoardVO vo);
	
	List<AnswerVO> selectAnswerList(CheckBoardVO vo);
	
	AnswerVO selectAnswerOne(AnswerVO vo);
	
	int insertAnswer(AnswerVO vo);
	
	int updateAnswer(AnswerVO vo);
	
	List<LogVO> selectLogList(CheckBoardVO vo);
	
	List<AnswerVO> selectUserAnswerList(CheckBoardVO vo);
	
}
