package com.gmm.house.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.gmm.house.dao.AdminMapper;
import com.gmm.house.pojo.Admin;
import com.gmm.house.pojo.Evaluate;
import com.gmm.house.pojo.House;
import com.gmm.house.pojo.User;
import com.gmm.house.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import java.util.List;


@Service
@Transactional
public class AdminServiceImpl implements AdminService {

    @Autowired
    private AdminMapper adminMapper;


    @Override
    public User findUserById(int id) {
        User user = adminMapper.findUserById(id);
        return user;
    }

    @Override
    public List<User> findHouseByUid() {
        List<User> userList = adminMapper.findHouseByUid();
        return userList;
    }

    @Override
    public PageInfo<User> findUserAll(int page,int size) {
        PageHelper.startPage(page,size);
        List<User> userList = adminMapper.findUserAll();
        PageInfo<User> pageInfo = new PageInfo<User>(userList);
        return pageInfo;
    }


    @Override
    public void addUser(User user) {
        adminMapper.addUser(user);
    }

    @Override
    public void updateUserById(User user) {
        adminMapper.updateUserById(user);
    }

    @Override
    public PageInfo<User> finds() {
        PageHelper.startPage(1,2);
        List<User> userList = adminMapper.findUserAll();
        PageInfo<User> pageInfo = new PageInfo<User>(userList);
        return pageInfo;
    }

    @Override
    public void delUserById(int id) {
        adminMapper.delUserById(id);
    }

    @Override
    public PageInfo<House> findAllHouse(int page, int size,String searchName) {
        PageHelper.startPage(page,size);
        List<House> houseList = adminMapper.findAllHouse(searchName);
        PageInfo<House> pageInfo = new PageInfo<>(houseList);
        return pageInfo;
    }

    @Override
    public void delHouseById(int id) {
        adminMapper.delHouseById(id);
    }

    @Override
    public void addHouse(House house) {
        adminMapper.addHouse(house);
    }

    @Override
    public House findHouseById(int id) {
        House house = adminMapper.findHouseById(id);
        return house;
    }

    @Override
    public void updateHouseById(House house) {
        adminMapper.updateHouseById(house);
    }

    @Override
    public Admin login(String username, String password) {
        return adminMapper.login(username,password);
    }

    @Override
    public PageInfo<Evaluate> findEvaluate(int size, int page, String searchName) {
        PageHelper.startPage(page,size);
        List<Evaluate> evaluateList = adminMapper.findEvaluate(searchName);
        PageInfo<Evaluate> pageInfo = new PageInfo<>(evaluateList);
        return pageInfo;
    }

    @Override
    public void delEvaluateById(int id) {
        adminMapper.delEvaluateById(id);
    }

    @Override
    public PageInfo<User> findByLikeName(String searchName,int page,int size) {
        PageHelper.startPage(page,size);
        List<User> userList = adminMapper.findByLikeName(searchName);
        PageInfo<User> pageInfo = new PageInfo<User>(userList);
        return pageInfo;
    }


}
