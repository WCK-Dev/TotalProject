package egovframework.example.board.service;

import java.sql.Timestamp;

public class CommentVO {
	private int c_no;
	private String c_writer;
	private String c_content;
	private Timestamp c_regdate;
	private int b_no;
	private int c_parent;
	private int c_origin;
	private int c_depth;
	
	public int getC_no() {
		return c_no;
	}
	public void setC_no(int c_no) {
		this.c_no = c_no;
	}
	public String getC_writer() {
		return c_writer;
	}
	public void setC_writer(String c_writer) {
		this.c_writer = c_writer;
	}
	public String getC_content() {
		return c_content;
	}
	public void setC_content(String c_content) {
		this.c_content = c_content;
	}
	public Timestamp getC_regdate() {
		return c_regdate;
	}
	public void setC_regdate(Timestamp c_regdate) {
		this.c_regdate = c_regdate;
	}
	public int getB_no() {
		return b_no;
	}
	public void setB_no(int b_no) {
		this.b_no = b_no;
	}
	public int getC_parent() {
		return c_parent;
	}
	public void setC_parent(int c_parent) {
		this.c_parent = c_parent;
	}
	public int getC_origin() {
		return c_origin;
	}
	public void setC_origin(int c_origin) {
		this.c_origin = c_origin;
	}
	public int getC_depth() {
		return c_depth;
	}
	public void setC_depth(int c_depth) {
		this.c_depth = c_depth;
	}
	
}
