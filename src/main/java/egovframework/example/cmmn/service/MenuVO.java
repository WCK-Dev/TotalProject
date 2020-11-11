package egovframework.example.cmmn.service;

import java.sql.Date;

public class MenuVO {

	private int menu_id;
	private String menu_name;
	private Date menu_create_dttm;
	private String menu_create_user;
	private Date menu_modify_dttm;
	private String menu_modify_user;
	private String menu_use_yn;
	private int menu_level;
	private int menu_ref;
	private int menu_origin;
	private String menu_auth;
	private String menu_info;
	private String menu_type;

	public int getMenu_id() {
		return menu_id;
	}
	public void setMenu_id(int menu_id) {
		this.menu_id = menu_id;
	}
	public String getMenu_name() {
		return menu_name;
	}
	public void setMenu_name(String menu_name) {
		this.menu_name = menu_name;
	}
	public Date getMenu_create_dttm() {
		return menu_create_dttm;
	}
	public void setMenu_create_dttm(Date menu_create_dttm) {
		this.menu_create_dttm = menu_create_dttm;
	}
	public String getMenu_create_user() {
		return menu_create_user;
	}
	public void setMenu_create_user(String menu_create_user) {
		this.menu_create_user = menu_create_user;
	}
	public Date getMenu_modify_dttm() {
		return menu_modify_dttm;
	}
	public void setMenu_modify_dttm(Date menu_modify_dttm) {
		this.menu_modify_dttm = menu_modify_dttm;
	}
	public String getMenu_modify_user() {
		return menu_modify_user;
	}
	public void setMenu_modify_user(String menu_modify_user) {
		this.menu_modify_user = menu_modify_user;
	}
	public String getMenu_use_yn() {
		return menu_use_yn;
	}
	public void setMenu_use_yn(String menu_use_yn) {
		this.menu_use_yn = menu_use_yn;
	}
	public int getMenu_level() {
		return menu_level;
	}
	public void setMenu_level(int menu_level) {
		this.menu_level = menu_level;
	}
	public int getMenu_ref() {
		return menu_ref;
	}
	public void setMenu_ref(int menu_ref) {
		this.menu_ref = menu_ref;
	}
	public int getMenu_origin() {
		return menu_origin;
	}
	public void setMenu_origin(int menu_origin) {
		this.menu_origin = menu_origin;
	}
	public String getMenu_auth() {
		return menu_auth;
	}
	public void setMenu_auth(String menu_auth) {
		this.menu_auth = menu_auth;
	}
	public String getMenu_info() {
		return menu_info;
	}
	public void setMenu_info(String menu_info) {
		this.menu_info = menu_info;
	}
	public String getMenu_type() {
		return menu_type;
	}
	public void setMenu_type(String menu_type) {
		this.menu_type = menu_type;
	}
	
}
