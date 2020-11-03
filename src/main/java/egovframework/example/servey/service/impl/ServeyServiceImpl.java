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
package egovframework.example.servey.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import egovframework.example.servey.service.ServeyAnswerVO;
import egovframework.example.servey.service.ServeyLogVO;
import egovframework.example.servey.service.ServeyQuestionVO;
import egovframework.example.servey.service.ServeyService;
import egovframework.example.servey.service.ServeyVO;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;

@Service("serveyService")
public class ServeyServiceImpl extends EgovAbstractServiceImpl implements ServeyService {

	private static final Logger LOGGER = LoggerFactory.getLogger(ServeyServiceImpl.class);

	// mybatis 사용
	@Resource(name="serveyMapper")
	private ServeyMapper serveyDAO;

	@Resource(name = "egovIdGnrService")
	private EgovIdGnrService egovIdGnrService;

	@Override
	public List<?> selectServeyList() {
		return serveyDAO.selectServeyList();
	}


	@Override
	public int checkServey(ServeyVO vo) {
		return serveyDAO.checkServey(vo);
	}
	
	@Override
	public ServeyVO selectServey(ServeyVO vo) {
		return serveyDAO.selectServey(vo);
	}

	@Override
	public List<?> selectServeyQuestionList(ServeyQuestionVO vo) {
		return serveyDAO.selectServeyQuestionList(vo);
	}

	@Override
	public List<?> selectServeyChoiceList() {
		return serveyDAO.selectServeyChoiceList();
	}

	@Override
	public int insertServeyAnswer(ServeyAnswerVO vo) {
		return serveyDAO.insertServeyAnswer(vo);
	}

	@Override
	public int insertServeyLog(ServeyLogVO vo) {
		return serveyDAO.insertServeyLog(vo);
	}
	
	@Override
	public int updateServeyLog(ServeyLogVO vo) {
		return serveyDAO.updateServeyLog(vo);
	}
	
	@Override
	public int updateServeyAnswer(ServeyAnswerVO vo) {
		return serveyDAO.updateServeyAnswer(vo);
	}

	@Override
	public int checkServeyLog(ServeyLogVO vo) {
		return serveyDAO.checkServeyLog(vo);
	}

	@Override
	public List<?> selectServeyAnswerList(ServeyAnswerVO vo) {
		return serveyDAO.selectServeyAnswerList(vo);
	}

}
