package egovframework.example.servey.service;

public class ServeyQuestionVO {
	
	private int s_seq;
	private String q_no;
	private String q_text;
	private String q_category;
	private int c_type;
	private String q_required;
	private int q_multiple;
	
	
	public int getS_seq() {
		return s_seq;
	}
	public void setS_seq(int s_seq) {
		this.s_seq = s_seq;
	}
	public String getQ_no() {
		return q_no;
	}
	public void setQ_no(String q_no) {
		this.q_no = q_no;
	}
	public String getQ_text() {
		return q_text;
	}
	public void setQ_text(String q_text) {
		this.q_text = q_text;
	}
	public String getQ_category() {
		return q_category;
	}
	public void setQ_category(String q_category) {
		this.q_category = q_category;
	}
	public int getC_type() {
		return c_type;
	}
	public void setC_type(int c_type) {
		this.c_type = c_type;
	}
	public String getQ_required() {
		return q_required;
	}
	public void setQ_required(String q_required) {
		this.q_required = q_required;
	}
	public int getQ_multiple() {
		return q_multiple;
	}
	public void setQ_multiple(int q_multiple) {
		this.q_multiple = q_multiple;
	}
	
}
