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
package egovframework.example.baseball.service;

import java.sql.Timestamp;

public class BaseBallVO {

	/** 게임 번호 */
	private int baseball_seq;

	/** 생성 시간 */
	private Timestamp baseball_regdate;

	/** 생성된 난수 */
	private int baseball_num;
	
	/** 유저 아이디 */
	private String user_id;

	public int getBaseball_seq() {
		return baseball_seq;
	}

	public void setBaseball_seq(int baseball_seq) {
		this.baseball_seq = baseball_seq;
	}

	public Timestamp getBaseball_regdate() {
		return baseball_regdate;
	}

	public void setBaseball_regdate(Timestamp baseball_regdate) {
		this.baseball_regdate = baseball_regdate;
	}

	public int getBaseball_num() {
		return baseball_num;
	}

	public void setBaseball_num(int baseball_num) {
		this.baseball_num = baseball_num;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
}
