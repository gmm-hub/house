package com.gmm.house.dao;

import com.gmm.house.pojo.House;
import com.gmm.house.pojo.User;

import java.util.List;

public interface UserMapper {
    User login(User user);

    User findUserByName(String username);

    int register(User user);

    User findUserById(int id);

    void updateUserById(User user);

    List<House> findUserHouse(int uid);
}
