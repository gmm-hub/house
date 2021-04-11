package com.gmm.house.dao;

import com.gmm.house.pojo.Evaluate;

import java.util.List;

public interface EvaluateMapper {
    List<Evaluate> findEvaluateByHid(int id);

    int addEvaluate(Evaluate evaluate);

    List<Evaluate> findUserEvaluate(int uid);

    void delEvaluateById(int id);
}
