package com.gmm.house.service;

import com.gmm.house.pojo.Evaluate;

import java.util.List;

public interface EvaluateService {
    List<Evaluate> findEvaluateByHid(int id);

    int addEvaluate(Evaluate evaluate);

    List<Evaluate> findUserEvaluate(int uid);

    void delEvaluate(int id);
}
