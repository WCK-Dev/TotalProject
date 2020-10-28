package egovframework.example.checklist.service;

import java.util.List;

import egovframework.example.board.service.UserVO;

public interface CheckListService {
	
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
