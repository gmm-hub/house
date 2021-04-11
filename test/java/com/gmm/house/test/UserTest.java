package com.gmm.house.test;

import com.gmm.house.pojo.User;
import com.gmm.house.service.UserService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:applicationContext-dao.xml","classpath:applicationContext-service.xml"})
public class UserTest {
    @Autowired
    private UserService service;

    @Test
    public void test1(){
        User user = service.findUserByName("王五");
        System.out.println(user);
    }
    @Test
    public void test2(){
        User user  = new User();
        user.setUsername("王五");
        user.setPassword("123456");
        User login = service.login(user);
        System.out.println(login);
    }
}
