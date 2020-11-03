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
package egovframework.example.servey.service.impl;

import java.util.List;

import egovframework.example.servey.service.ServeyAnswerVO;
import egovframework.example.servey.service.ServeyLogVO;
import egovframework.example.servey.service.ServeyQuestionVO;
import egovframework.example.servey.service.ServeyVO;
import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("serveyMapper")
public interface ServeyMapper {
	
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
