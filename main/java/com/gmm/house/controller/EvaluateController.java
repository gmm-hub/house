package com.gmm.house.controller;


import com.gmm.house.pojo.Evaluate;
import com.gmm.house.pojo.House;
import com.gmm.house.pojo.User;
import com.gmm.house.service.EvaluateService;
import com.gmm.house.service.HouseService;
import com.gmm.house.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.time.LocalDateTime;
import java.util.Date;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/evaluate")
public class EvaluateController {
    @Autowired
    private EvaluateService evaluateService;
    @Autowired
    private HouseService houseService;

    @RequestMapping("/addEvaluate/{id}.do")
    public String addEvaluate(Evaluate evaluate, @PathVariable("id") int hid, HttpSession session) {
        House houseById = houseService.findHouseById(hid);
        evaluate.setCreate_time(new Date());
        User user = (User)session.getAttribute("loginUser");
        evaluate.setHouse(houseById);
        if (user!=null){
            evaluate.setUser(user);
            int count = evaluateService.addEvaluate(evaluate);
            String url = "/house/findHouseById/"+hid+".do";
            return "redirect:"+url;
        }
        return "redirect:/client/login.jsp";
    }
    @RequestMapping("/findUserEvaluate.do")
    public ModelAndView findUserEvaluate(ModelAndView modelAndView,HttpSession session){
        User loginUser = (User)session.getAttribute("loginUser");
        List<Evaluate> evaluateList =evaluateService.findUserEvaluate(loginUser.getUid());
        modelAndView.addObject("evaluateList",evaluateList);
        modelAndView.setViewName("client/my-evaluate.jsp");
        return modelAndView;

    }
    @RequestMapping("/delEvaluate/{id}.do")
    public String delEvaluate(@PathVariable("id") int id){
        evaluateService.delEvaluate(id);
        return "redirect:/evaluate/findUserEvaluate.do";
    }

}
