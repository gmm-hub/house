package com.gmm.house.dao;

import com.github.pagehelper.PageHelper;
import com.gmm.house.pojo.Admin;
import com.gmm.house.pojo.Evaluate;
import com.gmm.house.pojo.House;
import com.gmm.house.pojo.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 管理员模块
 */
public interface AdminMapper {
    /**
     * 用户模块
     *
     */
    //通过id查询用户信息
    User findUserById(int id);
//    根据用户id查询用户发布的房源
    List<User> findHouseByUid();
    //查询所有用户信息findUserByName
    List<User> findUserAll();
    //按照姓名模糊查找用户
    List<User> findByLikeName(String searchName);
    //添加用户信息
    void addUser(User user);
    //根据用户id修改用户信息
    void updateUserById(User user);
    //删除用户
    void delUserById(int id);
    /**
     * 房源模块
     *
     */
    List<House> findAllHouse(String searchName);

    void delHouseById(int id);




    /**
     * 评价模块
     *
     */
//  查询所有评价信息
    List<Evaluate> findEvaluateAll();


    void addHouse(House house);

    House findHouseById(int id);

    void updateHouseById(House house);

    Admin login(@Param("username") String username, @Param("password") String password);

    List<Evaluate> findEvaluate(String searchName);

    void delEvaluateById(int id);
}
