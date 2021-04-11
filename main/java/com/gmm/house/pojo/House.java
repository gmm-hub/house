package com.gmm.house.pojo;

import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;
import java.util.List;

/**
 * 房源类
 */
public class House {
    //房屋id
    private int hid;
    //房屋标题
    private String title;
//    房型（几室几厅）
    private String model;
    //房屋面积
    private int area;
    //房屋出租方式(整租合租短租)
    private String type;
    //房屋价格
    private int price;
    // 房屋地址
    private String address;
    //房屋主要图片
    private String image;
    //房屋朝向
    private String orientation;
    //房屋发布时间
    @DateTimeFormat(pattern = "yyyy-mm-dd")
    private Date releaseTime;
    //房屋楼层
    private String floor;
    //房屋描述
    private String detail;
    //联系人
    private String linkPeople;
    //联系电话
    private String linkPhone;
    private int status;

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    //所属用户
    private User user;

    public String getLinkPeople() {
        return linkPeople;
    }

    public void setLinkPeople(String linkPeople) {
        this.linkPeople = linkPeople;
    }

    public String getLinkPhone() {
        return linkPhone;
    }

    public void setLinkPhone(String linkPhone) {
        this.linkPhone = linkPhone;
    }
    public int getHid() {
        return hid;
    }

    public void setHid(int hid) {
        this.hid = hid;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getModel() {
        return model;
    }

    public void setModel(String model) {
        this.model = model;
    }

    public int getArea() {
        return area;
    }

    public void setArea(int area) {
        this.area = area;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getOrientation() {
        return orientation;
    }

    public void setOrientation(String orientation) {
        this.orientation = orientation;
    }

    public Date getReleaseTime() {
        return releaseTime;
    }

    public void setReleaseTime(Date releaseTime) {
        this.releaseTime = releaseTime;
    }

    public String getFloor() {
        return floor;
    }

    public void setFloor(String floor) {
        this.floor = floor;
    }

    public String getDetail() {
        return detail;
    }

    public void setDetail(String detail) {
        this.detail = detail;
    }


    @Override
    public String toString() {
        return "House{" +
                "hid=" + hid +
                ", title='" + title + '\'' +
                ", model='" + model + '\'' +
                ", area='" + area + '\'' +
                ", type='" + type + '\'' +
                ", price=" + price +
                ", address='" + address + '\'' +
                ", image='" + image + '\'' +
                ", orientation='" + orientation + '\'' +
                ", releaseTime=" + releaseTime +
                ", floor='" + floor + '\'' +
                ", detail='" + detail + '\'' +
                ", linkPeople='" + linkPeople + '\'' +
                ", linkPhone='" + linkPhone + '\'' +
                '}';
    }
}
