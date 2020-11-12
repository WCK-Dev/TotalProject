package egovframework.example.cmmn.service;

import java.sql.Date;

public class MenuVO {

	private int menu_id;
	private String menu_name;
	private String menu_create_user;
	private Date menu_create_dttm;
	private String menu_modify_user;
	private Date menu_modify_dttm;
	private String menu_auth;
	private String menu_info;
	private String menu_url;
	private int menu_level;
	private int menu_depth1;
	private int menu_depth2;
	private int menu_depth3;
	
	private int menu_reflevel;
	private int menu_ref;
	
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
	public String getMenu_create_user() {
		return menu_create_user;
	}
	public void setMenu_create_user(String menu_create_user) {
		this.menu_create_user = menu_create_user;
	}
	public Date getMenu_create_dttm() {
		return menu_create_dttm;
	}
	public void setMenu_create_dttm(Date menu_create_dttm) {
		this.menu_create_dttm = menu_create_dttm;
	}
	public String getMenu_modify_user() {
		return menu_modify_user;
	}
	public void setMenu_modify_user(String menu_modify_user) {
		this.menu_modify_user = menu_modify_user;
	}
	public Date getMenu_modify_dttm() {
		return menu_modify_dttm;
	}
	public void setMenu_modify_dttm(Date menu_modify_dttm) {
		this.menu_modify_dttm = menu_modify_dttm;
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
	public String getMenu_url() {
		return menu_url;
	}
	public void setMenu_url(String menu_url) {
		this.menu_url = menu_url;
	}
	public int getMenu_level() {
		return menu_level;
	}
	public void setMenu_level(int menu_level) {
		this.menu_level = menu_level;
	}
	public int getMenu_depth1() {
		return menu_depth1;
	}
	public void setMenu_depth1(int menu_depth1) {
		this.menu_depth1 = menu_depth1;
	}
	public int getMenu_depth2() {
		return menu_depth2;
	}
	public void setMenu_depth2(int menu_depth2) {
		this.menu_depth2 = menu_depth2;
	}
	public int getMenu_depth3() {
		return menu_depth3;
	}
	public void setMenu_depth3(int menu_depth3) {
		this.menu_depth3 = menu_depth3;
	}
	public int getMenu_reflevel() {
		return menu_reflevel;
	}
	public void setMenu_reflevel(int menu_reflevel) {
		this.menu_reflevel = menu_reflevel;
	}
	public int getMenu_ref() {
		return menu_ref;
	}
	public void setMenu_ref(int menu_ref) {
		this.menu_ref = menu_ref;
	}
	
}
