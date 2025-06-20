package com.eschool.model;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "friends")
public class Friends {
	@Id
   int fid;
   public int getFid() {
	return fid;
}
public void setFid(int fid) {
	this.fid = fid;
}
public String getSender() {
	return sender;
}
public void setSender(String sender) {
	this.sender = sender;
}
public Friends(int fid, String sender, String rec, int status) {
	this.fid = fid;
	this.sender = sender;
	this.rec = rec;
	this.status = status;
}
public Friends() {

}
public String getRec() {
	return rec;
}
public void setRec(String rec) {
	this.rec = rec;
}
public int getStatus() {
	return status;
}
public void setStatus(int status) {
	this.status = status;
}
String sender ,rec;
   int status;
	
}
