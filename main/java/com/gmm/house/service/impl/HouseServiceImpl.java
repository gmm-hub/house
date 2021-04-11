package com.gmm.house.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.gmm.house.dao.HouseMapper;
import com.gmm.house.pojo.Evaluate;
import com.gmm.house.pojo.House;
import com.gmm.house.pojo.Query;
import com.gmm.house.service.HouseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;


@Service
@Transactional
public class HouseServiceImpl  implements HouseService {

    @Autowired
    private HouseMapper houseMapper;

    @Override
    public PageInfo<House> findHouseAll(int page,int size) {
        PageHelper.startPage(page,size);
        List<House> houseList = houseMapper.findHouseAll();
        PageInfo<House> pageInfo = new PageInfo<>(houseList);
        return pageInfo;
    }

    @Override
    public House findHouseById(int id) {
        House house = houseMapper.findHouseById(id);
        return house;
    }

    @Override
    public int findHouseCount(String searchName) {
        return houseMapper.findHouseCount(searchName);
    }

    @Override
    public PageInfo<House> housePriceAsc(int page, int size) {
        PageHelper.startPage(page,size);
        List<House> houseList = houseMapper.housePriceAsc();
        PageInfo<House> pageInfo = new PageInfo<>(houseList);
        return pageInfo;
    }

    @Override
    public PageInfo<House> housePriceDesc(int page, int size) {
        PageHelper.startPage(page,size);
        List<House> houseList = houseMapper.housePriceDesc();
        PageInfo<House> pageInfo = new PageInfo<>(houseList);
        return pageInfo;
    }

    @Override
    public List<House> findUserHouse(int id) {

        return houseMapper. findUserHouse(id);
    }

    @Override
    public void delHouseById(int id) {
        houseMapper.delHouseById(id);
    }

    @Override
    public void addHouse(House house) {
        houseMapper.addHouse(house);
    }

    @Override
    public PageInfo<House> findHouseList(Query query,int page,int size) {
        PageHelper.startPage(page,size);
        List<House> houseList = houseMapper.findHouseList(query);
        PageInfo<House> pageInfo = new PageInfo<>(houseList);
        return pageInfo;
    }

    @Override
    public int findUnSaleCount() {
        return houseMapper.findUnSaleCount();
    }

    @Override
    public int findSaleCount() {
        return houseMapper.findSaleCount();
    }

    @Override
    public PageInfo<House> findHouseGrade(int page, int size) {
        PageHelper.startPage(page,size);
        List<House> houseGrade = houseMapper.findHouseGrade();
        PageInfo<House> pageInfo = new PageInfo<>(houseGrade);
        return pageInfo;
    }

    @Override
    public void updateHouse(House house) {
        houseMapper.updateHouse(house);
    }

}
