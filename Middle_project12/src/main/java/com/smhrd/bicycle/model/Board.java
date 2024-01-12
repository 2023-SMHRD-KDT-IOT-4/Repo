package com.smhrd.bicycle.model;


//게시판 객체
public class Board {
	
	private int comm_seq;
	private String comm_title;
	private String comm_content;
	private String comm_file;
	private String created_at;
	private String user_id;
	
	
	
	public Board() {
		super();
	}


	public Board(int comm_seq, String comm_title, String comm_content, String comm_file, String created_at,
			String user_id) {
		super();
		this.comm_seq = comm_seq;
		this.comm_title = comm_title;
		this.comm_content = comm_content;
		this.comm_file = comm_file;
		this.created_at = created_at;
		this.user_id = user_id;
	}
	
	
	public Board(String comm_title, String comm_content, String comm_file, String user_id) {
		super();
		this.comm_title = comm_title;
		this.comm_content = comm_content;
		this.comm_file = comm_file;
		this.user_id = user_id;
	}


	public int getComm_seq() {
		return comm_seq;
	}
	public void setComm_seq(int comm_seq) {
		this.comm_seq = comm_seq;
	}
	public String getComm_title() {
		return comm_title;
	}
	public void setComm_title(String comm_title) {
		this.comm_title = comm_title;
	}
	public String getComm_content() {
		return comm_content;
	}
	public void setComm_content(String comm_content) {
		this.comm_content = comm_content;
	}
	public String getComm_file() {
		return comm_file;
	}
	public void setComm_file(String comm_file) {
		this.comm_file = comm_file;
	}
	public String getCreated_at() {
		return created_at;
	}
	public void setCreated_at(String created_at) {
		this.created_at = created_at;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	
	
	
}
