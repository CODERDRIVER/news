package com.xieyan.news.bean;

import java.io.Serializable;

/**
 * 用户Bean
 * Created by xieyan on 16/1/6.
 */
public class User implements Serializable {

    private Long id;

    private String userName;

    private String userPassword;

    private String valid;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getUserPassword() {
        return userPassword;
    }

    public void setUserPassword(String userPassword) {
        this.userPassword = userPassword;
    }

    public String getValid() {
        return valid;
    }

    public void setValid(String valid) {
        this.valid = valid;
    }

    public User(Long id, String userName, String valid) {
        this.id = id;
        this.userName = userName;
        this.valid = valid;
    }

    public User(String userName, String userPassword, String valid) {
        this.userName = userName;
        this.userPassword = userPassword;
        this.valid = valid;
    }

    public User() {
    }

    @Override
    public String toString() {
        return "User{" +
                "id=" + id +
                ", userName='" + userName + '\'' +
                ", userPassword='" + userPassword + '\'' +
                ", valid='" + valid + '\'' +
                '}';
    }
}
