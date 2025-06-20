package com.eschool.model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "proimage")
public class Image {

    @Id
    @Column(name = "email", nullable = false, unique = true) 
    private String email;

    @Column(name = "img", nullable = false) 
    private String image;

    public Image() {
    }

    public Image(String email, String image) {
        this.email = email;
        this.image = image;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }
}
