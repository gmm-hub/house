package com.gmm.house.test;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.gmm.house.dao.AdminMapper;
import com.gmm.house.pojo.Admin;
import com.gmm.house.pojo.House;
import com.gmm.house.pojo.User;
import com.gmm.house.service.AdminService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.Date;
import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:applicationContext-dao.xml","classpath:applicationContext-service.xml"})
public class AdminTest {
    @Autowired
    private AdminService adminService;
    @Test
    public void test(){
        User user = adminService.findUserById(2);
        System.out.println(user);
    }
    @Test
    public void test1() {
        List<User> userList = adminService.findHouseByUid();
        for (User user : userList) {
            System.out.println(user);
        }
    }
//    @Test
//    public void test2() {
//        List<User> userList = adminService.findUserAll();
//        for (User user : userList) {
//            System.out.println(user);
//        }
//    }
//    @Test
//    public void test3() {
//        List<House> houseList = adminService.findHouseAll();
//        for (House house : houseList) {
//            System.out.println(house);
//        }
//    }
//    @Test
//    public void test4() {
//        List<User> userList = adminService.findUserByName("王");
//        for (User user : userList) {
//            System.out.println(user);
//        }
//    }
    @Test
    public void test5(){
        User user = adminService.findUserById(5);
        user.setUsername("王红");
        user.setPassword("1234");
        user.setPhone("13064");
        System.out.println(user.getUid());
        adminService.updateUserById(user);
    }
    @Test
    public void test6(){
        PageInfo<User> pageInfo = adminService.finds();
        System.out.println("总条数："+pageInfo.getTotal());
        System.out.println("总页数："+pageInfo.getPages());
        System.out.println("当前页："+pageInfo.getPageNum());
        System.out.println("每页显示长度："+pageInfo.getPageSize());
        System.out.println("是否第一页："+pageInfo.isIsFirstPage());
        System.out.println("是否最后一页："+pageInfo.isIsLastPage());
        System.out.println(new Date());
    }
    @Test
    public void test7(){
        PageInfo<User> pageInfo = adminService.findByLikeName("王",1,1);
        List<User> userList = pageInfo.getList();
        for (User user : userList) {
            System.out.println(user);
        }
    }
    @Test
    public void test8(){
        House house = new House();
        house.setTitle("测试");
        house.setReleaseTime(new Date());
        house.setImage("ssdfsdfsdfdd");
        house.setAddress("上海");
        house.setArea(245);
        house.setDetail("好房子");
        house.setFloor("高层");
        house.setModel("三室一厅");
        house.setLinkPeople("张三");
        house.setLinkPhone("155655");
        house.setOrientation("东北");
        adminService.addHouse(house);
    }
    @Test
    public void test9(){
        House house = adminService.findHouseById(10);
        System.out.println(house);
    }
    @Test
    public void test10(){
        House house = adminService.findHouseById(10);
        house.setTitle("修改测试");
        adminService.updateHouseById(house);
        System.out.println(adminService.findHouseById(10));
    }
    @Test
    public void test11(){
        Admin admin = adminService.login("gmm", "199823");
        System.out.println(admin);
    }
}
