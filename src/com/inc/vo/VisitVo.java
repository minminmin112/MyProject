package com.inc.vo;

public class VisitVo {
	private int id;
	private String u_id;
	private String content;
	private String regdate;

	public VisitVo() {
	}

	public VisitVo(int id, String u_id, String content, String regdate) {
		this.id = id;
		this.u_id = u_id;
		this.content = content;
		this.regdate = regdate;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getU_id() {
		return u_id;
	}

	public void setU_id(String u_id) {
		this.u_id = u_id;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}

}
