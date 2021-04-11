package com.gmm.house.service.impl;

import com.gmm.house.dao.UserMapper;
import com.gmm.house.pojo.House;
import com.gmm.house.pojo.User;
import com.gmm.house.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class UserServiceImpl implements UserService {
    @Autowired
    private UserMapper userMapper;


    @Override
    public User login(User user) {
        User user1 = userMapper.login(user);
        return user1;
    }

    @Override
    public User findUserByName(String username) {
        return userMapper.findUserByName(username);
    }

    @Override
    public int register(User user) {
        User user1 = userMapper.findUserByName(user.getUsername());
        if (user1!=null)
            return 0;
        return userMapper.register(user);
    }

    @Override
    public User findUserById(int id) {
        return userMapper.findUserById(id);
    }

    @Override
    public void updateUserById(User user) {
        userMapper.updateUserById(user);

    }

    @Override
    public List<House> findUserHouse(int uid) {
        return userMapper.findUserHouse(uid);
    }
}
