package com.gmm.house.test;

import com.gmm.house.pojo.Evaluate;
import com.gmm.house.pojo.House;
import com.gmm.house.pojo.User;
import com.gmm.house.service.EvaluateService;
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
public class EvaluateTest {
    @Autowired
    private EvaluateService evaluateService;
    @Autowired
    private HouseService houseService;
    @Autowired
    private UserService userService;

    @Test
    public void test(){
        List<Evaluate> evaluateByHid = evaluateService.findEvaluateByHid(19);
        for (Evaluate evaluate : evaluateByHid) {
            System.out.println(evaluate);
        }
    }
    @Test
    public void test1(){
        Evaluate evaluate = new Evaluate();
        House houseById = houseService.findHouseById(19);
        User user = userService.findUserById(2);
        evaluate.setUser(user);
        evaluate.setHouse(houseById);
        evaluate.setCreate_time(new Date());
        evaluate.setGrade(4.3);
        evaluate.setContent("评价测试，房源符合标准");
        int i = evaluateService.addEvaluate(evaluate);
        System.out.println(i);
    }
}
