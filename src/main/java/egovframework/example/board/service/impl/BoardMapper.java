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
package egovframework.example.board.service.impl;

import java.util.List;

import egovframework.example.board.service.BoardVO;
import egovframework.example.board.service.CommentVO;
import egovframework.example.board.service.HistoryVO;
import egovframework.example.board.service.UserVO;
import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("boardMapper")
public interface BoardMapper {
	
	BoardVO selectBoardKinds(BoardVO vo) throws Exception;
	
	List<?> selectBoardKindsList();
	
	int selectMaxBseq() throws Exception;
	
	int selectMaxBkOrder() throws Exception;
	
	int insertBoardKinds(BoardVO vo) throws Exception;
	
	int updateBoardKinds(BoardVO vo) throws Exception;
	
	int reOrderBoardKinds(BoardVO vo) throws Exception;
	
	int deleteBoardKinds(BoardVO vo) throws Exception;

	void insertBoard(BoardVO vo) throws Exception;

	int updateBoard(BoardVO vo) throws Exception;

	int deleteBoard(BoardVO vo) throws Exception;

	BoardVO selectBoard(BoardVO vo) throws Exception;

	void updateReadCnt(BoardVO vo) throws Exception;
	
	List<?> selectBoardList(BoardVO vo) throws Exception;

	int selectBoardListTotCnt(BoardVO vo);
	
	List<?> selectAlarmList(BoardVO vo) throws Exception;
	
	int selectAlarmListTotCnt(BoardVO vo) throws Exception;
	
	List<?> selectNoticeList(BoardVO vo) throws Exception;
	
	int selectMaxBno() throws Exception;
	
	int updateGrpord(BoardVO vo) throws Exception;
	
	int insertReply(BoardVO vo) throws Exception;
	
	String userIdCheck(String user_id) throws Exception;
	
	int insertUser(UserVO vo) throws Exception;
	
	UserVO loginCheck(UserVO vo) throws Exception;
	
	List<?> selectUserList(UserVO vo) throws Exception;
	
	int selectUserListTotCnt(UserVO vo) throws Exception;
	
	UserVO selectUser(UserVO vo) throws Exception;

	int updateUser(UserVO vo) throws Exception;
	
	int selectMaxCno() throws Exception;
	
	int insertComment(CommentVO vo) throws Exception;
	
	int insertRecomment(CommentVO vo) throws Exception;
	
	int deleteComment(CommentVO vo) throws Exception;

	List<?> selectCommentList(BoardVO vo) throws Exception;
	
	int insertHistory(HistoryVO vo) throws Exception;

	int checkHistory(HistoryVO vo) throws Exception;
	
}
