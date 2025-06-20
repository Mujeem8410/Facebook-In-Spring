package com.eschool.model;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name= "video")
public class video {
	@Id
	 int vid; 
	 String sender , vname;

	public video(int vid,String sender ,String vname) {
		this.vid = vid;
		this.sender = sender;
		this.vname = vname;
	}

	public video () {
		
	}

	public int getVid() {
		return vid;
	}

	public void setSender(int vid) {
		this.vid = vid;
	}
	public String getSender() {
		return sender;
	}

	public void setSender(String sender) {
		this.sender = sender;
	}

	public String getVname() {
		return vname;
	}

	public void setVname(String vname) {
		this.vname = vname;
	}

}
