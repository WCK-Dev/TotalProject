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
package egovframework.example.board.service;

import java.sql.Timestamp;

/**
 * @Class Name : SampleVO.java
 * @Description : SampleVO Class
 * @Modification Information
 * @
 * @  수정일      수정자              수정내용
 * @ ---------   ---------   -------------------------------
 * @ 2009.03.16           최초생성
 *
 * @author 개발프레임웍크 실행환경 개발팀
 * @since 2009. 03.16
 * @version 1.0
 * @see
 *
 *  Copyright (C) by MOPAS All right reserved.
 */
public class BoardVO extends BoardKindsVO {

	private static final long serialVersionUID = 1L;

	/** 게시글 번호 */
	private int b_no;

	/** 제목 */
	private String b_title;

	/** 내용 */
	private String b_content;

	/** 게시자 */
	private String b_writer;
	
	/** 사용여부 */
	private Timestamp b_regdate;
	
	/** 조회수 */
	private int b_readcnt;

	/** 원글 번호 */
	private int b_refno;
	
	/** 답글의 계층 */
	private int b_depth;
	
	/** 글유형 (공지, 일반) */
	private int b_notice;
	
	/** 게시글 정렬 순서(원글 -댓글 그룹핑) */
	private int b_origin;
	
	/** 비밀글 여부(일반 글 = 0, 비밀글 = 1) */
	private int b_secret;
	
	/** 게시글 비밀번호(일반 글에는 NULL) */
	private String b_pwd;
	
	/** 게시판 번호 */
	private int b_bseq;

	/** 댓글 개수 */
	private int b_commentCnt;

	public int getB_no() {
		return b_no;
	}

	public void setB_no(int b_no) {
		this.b_no = b_no;
	}

	public String getB_title() {
		return b_title;
	}

	public void setB_title(String b_title) {
		this.b_title = b_title;
	}

	public String getB_content() {
		return b_content;
	}

	public void setB_content(String b_content) {
		this.b_content = b_content;
	}

	public String getB_writer() {
		return b_writer;
	}

	public void setB_writer(String b_writer) {
		this.b_writer = b_writer;
	}

	public Timestamp getB_regdate() {
		return b_regdate;
	}

	public void setB_regdate(Timestamp b_regdate) {
		this.b_regdate = b_regdate;
	}

	public int getB_readcnt() {
		return b_readcnt;
	}

	public void setB_readcnt(int b_readcnt) {
		this.b_readcnt = b_readcnt;
	}

	public int getB_refno() {
		return b_refno;
	}

	public void setB_refno(int b_refno) {
		this.b_refno = b_refno;
	}

	public int getB_depth() {
		return b_depth;
	}

	public void setB_depth(int b_depth) {
		this.b_depth = b_depth;
	}

	public int getB_notice() {
		return b_notice;
	}

	public void setB_notice(int b_notice) {
		this.b_notice = b_notice;
	}

	public int getB_origin() {
		return b_origin;
	}

	public void setB_origin(int b_origin) {
		this.b_origin = b_origin;
	}

	public int getB_secret() {
		return b_secret;
	}

	public void setB_secret(int b_secret) {
		this.b_secret = b_secret;
	}

	public String getB_pwd() {
		return b_pwd;
	}

	public void setB_pwd(String b_pwd) {
		this.b_pwd = b_pwd;
	}

	public int getB_bseq() {
		return b_bseq;
	}

	public void setB_bseq(int b_bseq) {
		this.b_bseq = b_bseq;
	}

	public int getB_commentCnt() {
		return b_commentCnt;
	}

	public void setB_commentCnt(int b_commentCnt) {
		this.b_commentCnt = b_commentCnt;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}
}
