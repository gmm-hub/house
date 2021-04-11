package com.gmm.house.test;

import com.github.pagehelper.PageInfo;
import com.gmm.house.pojo.Evaluate;
import com.gmm.house.pojo.House;
import com.gmm.house.pojo.Query;
import com.gmm.house.pojo.User;
import com.gmm.house.service.HouseService;
import com.gmm.house.service.UserService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.Date;
import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:applicationContext-dao.xml","classpath:applicationContext-service.xml"})
public class HouseTest {
    @Autowired
    private HouseService houseService;
    @Autowired
    private UserService userService;

    @Test
    public void test(){
        PageInfo<House> pageInfo = houseService.housePriceDesc(1, 5);
        List<House> list = pageInfo.getList();
        for (House house : list) {
            System.out.println(house);
        }
    }
    @Test
    public void test1(){
        List<House> userHouse = houseService.findUserHouse(2);
        for (House house : userHouse) {
            System.out.println(house);
        }
    }
    @Test
    public void test2(){
        houseService.delHouseById(28);
    }

    @Test
    public void test3(){
        User userById = userService.findUserById(16);
        House house = new House();
        house.setTitle("安徽淮北测试");
        house.setReleaseTime(new Date());
        house.setImage("ssdfsdfsdfdd");
        house.setAddress("上海 浦东");
        house.setArea(123);
        house.setDetail("好房子");
        house.setFloor("高层");
        house.setModel("三室一厅");
        house.setLinkPeople("张三");
        house.setLinkPhone("155655");
        house.setOrientation("东北");
        house.setUser(userById);
        houseService.addHouse(house);
    }
    @Test
    public void test4(){
        Query query = new Query();
        query.setSearchName("淮北");
        PageInfo<House> pageInfo = houseService.findHouseList(query, 1, 10);
        List<House> houseList = pageInfo.getList();
        for (House house : houseList) {
            System.out.println(house);
        }
    }
    @Test
    public void test5(){
        int saleCount = houseService.findSaleCount();
        int unSaleCount = houseService.findUnSaleCount();
        System.out.println(saleCount);
        System.out.println(unSaleCount);
    }
    @Test
    public void test6(){
        House houseById = houseService.findHouseById(31);
        houseById.setType("整租");
        houseService.updateHouse(houseById);
    }

}
