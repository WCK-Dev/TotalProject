package egovframework.example.board.service;

public class UserVO extends BoardDefaultVO {
	
	private static final long serialVersionUID = 1L;
	
	private String user_id;
	private String user_pwd;
	private String user_name;
	private String read_YN;
	private String write_YN;
	private String update_YN;
	private String delete_YN;
	private String reply_YN;
	private String comment_YN;
	private String admin_YN;
	
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getUser_pwd() {
		return user_pwd;
	}
	public void setUser_pwd(String user_pwd) {
		this.user_pwd = user_pwd;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getRead_YN() {
		return read_YN;
	}
	public void setRead_YN(String read_YN) {
		this.read_YN = read_YN;
	}
	public String getWrite_YN() {
		return write_YN;
	}
	public void setWrite_YN(String write_YN) {
		this.write_YN = write_YN;
	}
	public String getUpdate_YN() {
		return update_YN;
	}
	public void setUpdate_YN(String update_YN) {
		this.update_YN = update_YN;
	}
	public String getDelete_YN() {
		return delete_YN;
	}
	public void setDelete_YN(String delete_YN) {
		this.delete_YN = delete_YN;
	}
	public String getReply_YN() {
		return reply_YN;
	}
	public void setReply_YN(String reply_YN) {
		this.reply_YN = reply_YN;
	}
	public String getComment_YN() {
		return comment_YN;
	}
	public void setComment_YN(String comment_YN) {
		this.comment_YN = comment_YN;
	}
	public String getAdmin_YN() {
		return admin_YN;
	}
	public void setAdmin_YN(String admin_YN) {
		this.admin_YN = admin_YN;
	}
	
}
