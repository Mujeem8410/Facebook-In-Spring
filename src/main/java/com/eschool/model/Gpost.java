package com.eschool.model;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "gpost")
public class Gpost {
	@Id
	int gpid;
	String sender, tagline, related, img;

	public Gpost(int gpid, String sender, String tagline, String related, String img) {
		this.gpid = gpid;
		this.sender = sender;
		this.tagline = tagline;
		this.related = related;
		this.img = img;
	}

	public Gpost() {

	}

	public int getGpid() {
		return gpid;
	}

	public void setGpid(int gpid) {
		this.gpid = gpid;
	}

	public String getSender() {
		return sender;
	}

	public void setSender(String sender) {
		this.sender = sender;
	}

	public String getTagline() {
		return tagline;
	}

	public void setTagline(String tagline) {
		this.tagline = tagline;
	}

	public String getRelaetd() {
		return related;
	}

	public void setRelaetd(String relaetd) {
		this.related = relaetd;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

}
