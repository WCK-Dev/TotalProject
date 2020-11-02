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

public class BaseBallTryVO {
	
	/** 댓글 번호(PK) */
	private int bt_seq;
	
	/** 사용자 입력값 */
	private int bt_num;
	
	/** 해당 댓글의 스트라이크 수(3일시 정답) */
	private int bt_strike;
	
	/** 해당 댓글 볼 숫자 */
	private int bt_ball;
	
	/** 게임 번호 */
	private int baseball_seq;

	public int getBt_seq() {
		return bt_seq;
	}

	public void setBt_seq(int bt_seq) {
		this.bt_seq = bt_seq;
	}
	
	public int getBt_num() {
		return bt_num;
	}

	public void setBt_num(int bt_num) {
		this.bt_num = bt_num;
	}

	public int getBt_strike() {
		return bt_strike;
	}

	public void setBt_strike(int bt_strike) {
		this.bt_strike = bt_strike;
	}

	public int getBt_ball() {
		return bt_ball;
	}

	public void setBt_ball(int bt_ball) {
		this.bt_ball = bt_ball;
	}

	public int getBaseball_seq() {
		return baseball_seq;
	}

	public void setBaseball_seq(int baseball_seq) {
		this.baseball_seq = baseball_seq;
	}
}
