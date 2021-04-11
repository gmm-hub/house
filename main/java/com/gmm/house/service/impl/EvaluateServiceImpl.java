package com.gmm.house.service.impl;

import com.gmm.house.dao.EvaluateMapper;
import com.gmm.house.pojo.Evaluate;
import com.gmm.house.service.EvaluateService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class EvaluateServiceImpl implements EvaluateService {
    @Autowired
    private EvaluateMapper evaluateMapper;
    @Override
    public List<Evaluate> findEvaluateByHid(int id) {
        return evaluateMapper.findEvaluateByHid(id);
    }

    @Override
    public int addEvaluate(Evaluate evaluate) {
        return evaluateMapper.addEvaluate(evaluate);
    }

    @Override
    public List<Evaluate> findUserEvaluate(int uid) {
        return evaluateMapper.findUserEvaluate(uid);
    }

    @Override
    public void delEvaluate(int id) {
        evaluateMapper.delEvaluateById(id);
    }
}
