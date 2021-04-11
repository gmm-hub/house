package com.gmm.house.service;

import com.github.pagehelper.PageInfo;
import com.gmm.house.pojo.Evaluate;
import com.gmm.house.pojo.House;
import com.gmm.house.pojo.Query;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;


public interface HouseService {
    PageInfo<House> findHouseAll(int page,int size);

    House findHouseById(int id);

    int findHouseCount(String searchName);

    PageInfo<House> housePriceAsc(int page, int size);

    PageInfo<House> housePriceDesc(int page, int size);

    List<House> findUserHouse(int id);

    void delHouseById(int id);

    void addHouse(House house);

    PageInfo<House> findHouseList(Query query,int page,int size);

    int findUnSaleCount();

    int findSaleCount();

    PageInfo<House> findHouseGrade(int page, int size);

    void updateHouse(House house);
}
