package egovframework.example.board.service;

public class BoardKindsVO extends BoardDefaultVO {
	
	private static final long serialVersionUID = 1L;
	
	/** 게시판 번호 */
	private int bk_bseq;
	
	/** 게시판 유형 (0이면 일반형 1이면 알림형) */
	private int bk_type;
	
	/** 게시판 노출순서 */
	private int bk_order;
	
	/** 게시판 이름 */
	private String bk_bname;
	
	/** 게시판 답글 사용여부 */
	private String bk_breply_YN; 
	
	/** 게시판 댓글 사용여부 */
	private String bk_bcomment_YN;
	
	/** 게시판 비밀글 사용여부 */
	private String bk_bsecret_YN;

	public int getBk_bseq() {
		return bk_bseq;
	}

	public void setBk_bseq(int bk_bseq) {
		this.bk_bseq = bk_bseq;
	}

	public int getBk_type() {
		return bk_type;
	}

	public void setBk_type(int bk_type) {
		this.bk_type = bk_type;
	}

	public int getBk_order() {
		return bk_order;
	}

	public void setBk_order(int bk_order) {
		this.bk_order = bk_order;
	}

	public String getBk_bname() {
		return bk_bname;
	}

	public void setBk_bname(String bk_bname) {
		this.bk_bname = bk_bname;
	}

	public String getBk_breply_YN() {
		return bk_breply_YN;
	}

	public void setBk_breply_YN(String bk_breply_YN) {
		this.bk_breply_YN = bk_breply_YN;
	}

	public String getBk_bcomment_YN() {
		return bk_bcomment_YN;
	}

	public void setBk_bcomment_YN(String bk_bcomment_YN) {
		this.bk_bcomment_YN = bk_bcomment_YN;
	}

	public String getBk_bsecret_YN() {
		return bk_bsecret_YN;
	}

	public void setBk_bsecret_YN(String bk_bsecret_YN) {
		this.bk_bsecret_YN = bk_bsecret_YN;
	}
	
}
