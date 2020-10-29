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
package egovframework.example.baseball.service.impl;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import egovframework.example.baseball.service.BaseBallService;
import egovframework.example.baseball.service.BaseBallVO;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;

@Service("baseballService")
public class BaseBallServiceImpl extends EgovAbstractServiceImpl implements BaseBallService {

	private static final Logger LOGGER = LoggerFactory.getLogger(BaseBallServiceImpl.class);

	// mybatis 사용
	@Resource(name="baseballMapper")
	private BaseBallMapper baseballDAO;

	@Resource(name = "egovIdGnrService")
	private EgovIdGnrService egovIdGnrService;

	@Override
	public int insertBaseball(BaseBallVO bvo) {
		return baseballDAO.insertBaseball(bvo);
	}

}
