package com.gmm.house.pojo;

import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

/**
 * 评价类
 */
public class Evaluate {
    private int eid;
    private String content;
    @DateTimeFormat(pattern = "yyy-mm-dd")
    private Date create_time;
    private double grade;//等级
    private User user;//一对一用户
    private House house;//一对一房源

    public int getEid() {
        return eid;
    }

    public void setEid(int eid) {
        this.eid = eid;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Date getCreate_time() {
        return create_time;
    }

    public void setCreate_time(Date create_time) {
        this.create_time = create_time;
    }

    public double getGrade() {
        return grade;
    }

    public void setGrade(double grade) {
        this.grade = grade;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public House getHouse() {
        return house;
    }

    public void setHouse(House house) {
        this.house = house;
    }

    @Override
    public String toString() {
        return "Evaluate{" +
                "eid=" + eid +
                ", content='" + content + '\'' +
                ", create_time=" + create_time +
                ", grade=" + grade +
                ", user=" + user +
                ", house=" + house +
                '}';
    }
}
