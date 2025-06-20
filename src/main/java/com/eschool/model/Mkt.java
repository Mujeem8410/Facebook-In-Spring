package com.eschool.model;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name="market")
public class Mkt {
	@Id
    int pid;
	String sender, pname, location, image;
	int price;

	public Mkt() {

	}

	public Mkt(int pid ,String sender, String pname, String location, String image, int price){
        this.pid = pid;
		this.sender = sender;
		this.pname = pname;
		this.location = location;
		this.image = image;
		this.price = price;
	}
    public int getPid() {
    	return pid;
    }
    public void setPid(int pid) {
    	this.pid = pid;
    }
	public String getSender() {
		return sender;
	}

	public void setSender(String sender) {
		this.sender = sender;
	}

	public String getPname() {
		return pname;
	}

	public void setPname(String pname) {
		this.pname = pname;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

}

