package com.eschool.model;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name="game")
public class Game {
	@Id
	int gid;
	String gname, gimg, gplayer;
	public int getGid() {
		return gid;
	}
	public void setGid(int gid) {
		this.gid = gid;
	}

	
	public String getGname() {
		return gname;
	}

	public void setGname(String gname) {
		this.gname = gname;
	}

	public String getGimg() {
		return gimg;
	}

	public void setGimg(String gimg) {
		this.gimg = gimg;
	}

	public String getGplayer() {
		return gplayer;
	}

	public void setGplayer(String gplayer) {
		this.gplayer = gplayer;
	}

	public Game() {

	}

	public Game(String gname, String gimg, String gplayer) {

		this.gname = gname;
		this.gimg = gimg;
		this.gplayer = gplayer;
	}

}
