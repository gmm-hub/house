package com.gmm.house.service;

import com.github.pagehelper.PageInfo;
import com.gmm.house.pojo.Admin;
import com.gmm.house.pojo.Evaluate;
import com.gmm.house.pojo.House;
import com.gmm.house.pojo.User;

import java.util.List;

public interface AdminService {
    public User findUserById(int id);
    List<User> findHouseByUid();
    PageInfo<User> findUserAll(int page, int size);
    //按照姓名模糊查找用户
    PageInfo<User> findByLikeName(String searchName,int page,int size);
    void addUser(User user);
    void updateUserById(User user);
    PageInfo<User> finds();
    void delUserById(int id);


    PageInfo<House> findAllHouse(int page, int size,String searchName);

    void delHouseById(int id);

    void addHouse(House house);

    House findHouseById(int id);

    void updateHouseById(House house);

    Admin login(String username, String password);

    PageInfo<Evaluate> findEvaluate(int size, int page, String searchName);

    void delEvaluateById(int id);
}
