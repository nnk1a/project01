package com.malrang.board;

public class BoardDTO {
	private int bno, blike, commentcount;
	private String btitle, m_name, m_id, bcontent, bdate, bip, reply, uuid;
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	public int getBlike() {
		return blike;
	}
	public void setBlike(int blike) {
		this.blike = blike;
	}
	public int getCommentcount() {
		return commentcount;
	}
	public void setCommentcount(int commentcount) {
		this.commentcount = commentcount;
	}
	public String getBtitle() {
		return btitle;
	}
	public void setBtitle(String btitle) {
		this.btitle = btitle;
	}
	public String getM_name() {
		return m_name;
	}
	public void setM_name(String m_name) {
		this.m_name = m_name;
	}
	public String getM_id() {
		return m_id;
	}
	public void setM_id(String m_id) {
		this.m_id = m_id;
	}
	public String getBcontent() {
		return bcontent;
	}
	public void setBcontent(String bcontent) {
		this.bcontent = bcontent;
	}
	public String getBdate() {
		return bdate;
	}
	public void setBdate(String bdate) {
		this.bdate = bdate;
	}
	public String getBip() {
		return bip;
	}
	public void setBip(String bip) {
		this.bip = bip;
	}
	public String getReply() {
		return reply;
	}
	public void setReply(String reply) {
		this.reply = reply;
	}
	public String getUuid() {
		return uuid;
	}
	public void setUuid(String uuid) {
		this.uuid = uuid;
	}
}
