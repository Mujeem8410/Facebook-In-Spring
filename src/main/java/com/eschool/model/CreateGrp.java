package com.eschool.model;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "grp")
public class CreateGrp {
	@Id
  int gid;
  String admin;
  String Gname;	
  String gtype;

public CreateGrp() {
 
}

public CreateGrp(int gid,String admin, String Gname, String gtype) {
	this.gid =  gid;
	this.admin = admin;
	this.Gname = Gname;
	this.gtype = gtype;
}
public int getGid() {
	return gid;
}
public void setGid(int gid) {
	this.gid = gid;
}

public String getAdmin() {
	return admin;
}

public void setAdmin(String admin) {
	this.admin = admin;
}

public String getGname() {
	return Gname;
}

public void setGname(String gname) {
	Gname = gname;
}

public String getGtype() {
	return gtype;
}

public void setGtype(String gtype) {
	this.gtype = gtype;
}

}
