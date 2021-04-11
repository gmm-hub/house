package com.gmm.house.dao;

import com.gmm.house.pojo.House;
import com.gmm.house.pojo.Query;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface HouseMapper {
    List<House> findHouseAll();

    House findHouseById(int id);

    int findHouseCount(String searchName);

    List<House> housePriceAsc();

    List<House> housePriceDesc();

    List<House> findUserHouse(int id);

    void delHouseById(int id);

    void addHouse(House house);

    List<House> findHouseList(Query query);
    int findUnSaleCount();
    int findSaleCount();

    List<House> findHouseGrade();

    void updateHouse(House house);
}
