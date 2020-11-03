package egovframework.example.servey.service;

import java.util.List;

public interface ServeyService {
	
	List<?> selectServeyList();
	
	int checkServey(ServeyVO vo);

	ServeyVO selectServey(ServeyVO vo);
	
	List<?> selectServeyQuestionList(ServeyQuestionVO vo);

	List<?> selectServeyChoiceList();
	
	int insertServeyAnswer(ServeyAnswerVO vo);

	int updateServeyAnswer(ServeyAnswerVO vo);
	
	int insertServeyLog(ServeyLogVO vo);
	
	int updateServeyLog(ServeyLogVO vo);
	
	int checkServeyLog(ServeyLogVO vo);
	
	List<?> selectServeyAnswerList(ServeyAnswerVO vo);
}
