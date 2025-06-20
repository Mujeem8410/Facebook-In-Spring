package com.eschool.model;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name="wallpost")
public class Wallpost {
	@Id
	int wid;
	String sender, message, dop, img;

	public Wallpost(int wid, String sender, String message, String dop, String img) {

		this.wid = wid;
		this.sender = sender;
		this.message = message;
		this.dop = dop;
		this.img = img;
	}

	public Wallpost() {

	}

	public int getWid() {
		return wid;
	}

	public void setWid(int wid) {
		this.wid = wid;
	}

	public String getSender() {
		return sender;
	}

	public void setSender(String sender) {
		this.sender = sender;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	public String getDop() {
		return dop;
	}

	public void setDop(String dop) {
		this.dop = dop;
	}
}
