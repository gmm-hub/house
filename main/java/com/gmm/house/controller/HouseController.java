package com.gmm.house.controller;

import com.github.pagehelper.PageInfo;
import com.gmm.house.pojo.Evaluate;
import com.gmm.house.pojo.House;
import com.gmm.house.pojo.Query;
import com.gmm.house.pojo.User;
import com.gmm.house.service.EvaluateService;
import com.gmm.house.service.HouseService;
import com.gmm.house.utils.CommonUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.*;

@Controller
@RequestMapping("/house")
public class HouseController {

    @Autowired
    private HouseService houseService;
    @Autowired
    private EvaluateService evaluateService;

    /**
     * 查询房屋数据
     */
    @RequestMapping("/findHouseAll.do")
    public ModelAndView findHouseAll (ModelAndView modelAndView,@RequestParam(name = "page",required = true,defaultValue = "1") int page, @RequestParam(name = "size",required = true,defaultValue = "6") int size){
        //最新房源
        PageInfo<House> houseList = houseService.findHouseAll(page,size);
        modelAndView.addObject("houseList",houseList);
        //优质房源
        PageInfo<House> housePageInfo = houseService.findHouseGrade(page,size);
        modelAndView.addObject("gradeList",housePageInfo);
        modelAndView.setViewName("client/index.jsp");
        return modelAndView;
    }
    /**
     * 根据id查询房屋信息
     */
    @RequestMapping("/findHouseById/{id}.do")
    public ModelAndView findHouseById(ModelAndView modelAndView,@PathVariable("id") int id){
        House house = houseService.findHouseById(id);
        List<Evaluate> evaluateList = evaluateService.findEvaluateByHid(id);
        modelAndView.addObject("evaluate",evaluateList);
        modelAndView.addObject("house",house);
        modelAndView.setViewName("client/property-single-slider.jsp");
        return modelAndView;
    }

    @RequestMapping("/delHouse/{id}.do")
    public String delHouse(@PathVariable("id") int id){
        houseService.delHouseById(id);
        return "redirect:/user/findUserHouse.do";
    }
    /**
     * 添加房源信息
     */
    @RequestMapping("/addHouse.do")
    public String addHouse(House house, MultipartFile file, HttpSession session){
        if (file != null){
            String originalFilename = file.getOriginalFilename();
            String newName = UUID.randomUUID()+originalFilename.substring(originalFilename.lastIndexOf("."),originalFilename.length());
            try {
                file.transferTo(new File("D:\\houseImage\\"+newName));
                house.setImage("/img/"+newName);
            } catch (IOException e) {
                e.printStackTrace();
            }
            User loginUser = (User)session.getAttribute("loginUser");
            house.setUser(loginUser);
            houseService.addHouse(house);
            return "redirect:/house/findHouseAll.do";
        }
        return "redirect:/client/add-property.jsp";
    }

    @RequestMapping(value = "/findHouseList.do")
    public ModelAndView findHouseList(HttpSession session,ModelAndView modelAndView, Query query,@RequestParam(name = "page",defaultValue = "1") int page, @RequestParam(name = "size",defaultValue = "5")int size){
        Query query1 = (Query)session.getAttribute("query");
        //查询所有未出租房源
        int unSaleCount = houseService.findUnSaleCount();
        //查询已出租房源
        int saleCount = houseService.findSaleCount();
        session.setAttribute("unSaleCount",unSaleCount);
        session.setAttribute("saleCount",saleCount);
        boolean check = CommonUtils.checkObjAllFieldsIsNull(query);
        if (query1!=null && check)
        {
            PageInfo<House> houseList = houseService.findHouseList(query1,page,size);
            session.setAttribute("query",query1);
            modelAndView.addObject("houseList",houseList);
            modelAndView.setViewName("client/properties-list.jsp");
            return modelAndView;
        }
        PageInfo<House> houseList = houseService.findHouseList(query,page,size);
        modelAndView.addObject("houseList",houseList);
        session.setAttribute("query",query);
        modelAndView.setViewName("client/properties-list.jsp");
        return modelAndView;
    }
    /**
     * 对数据排序
     */
    @RequestMapping("/{name}.do")
    public ModelAndView findHouseListOrderBy(HttpSession session,ModelAndView modelAndView,@PathVariable("name") String orderBy,@RequestParam(name = "page",defaultValue = "1") int page, @RequestParam(name = "size",defaultValue = "5")int size){
        Query query = (Query)session.getAttribute("query");
        query.setOrderByName(orderBy);
        PageInfo<House> houseList = houseService.findHouseList(query,page,size);
        session.setAttribute("query",query);
        modelAndView.addObject("houseList",houseList);
        modelAndView.setViewName("client/properties-list.jsp");
        return modelAndView;
    }
    @RequestMapping("/findUserHouseById/{id}.do")
    public ModelAndView findUserHouseById(ModelAndView modelAndView,@PathVariable("id") int id){
        House houseById = houseService.findHouseById(id);
        modelAndView.addObject("house",houseById);
        modelAndView.setViewName("client/edit-property.jsp");
        return modelAndView;
    }
    @RequestMapping("/updateHouse/{id}.do")
    public String updateHouse(House house,MultipartFile file,@PathVariable("id") int id){
        house.setHid(id);
        String originalFilename = file.getOriginalFilename();
        if (!("".equals(originalFilename))){
            String newName = UUID.randomUUID()+originalFilename.substring(originalFilename.lastIndexOf("."),originalFilename.length());
            System.out.println(newName);
            try {
                file.transferTo(new File("D:\\houseImage\\"+newName));
                house.setImage("/img/"+newName);
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        String houseImage = house.getImage();
        if (houseImage == null){//未上传文件
            House house1 = houseService.findHouseById(house.getHid());
            house.setReleaseTime(house1.getReleaseTime());
            String image = house1.getImage();
            if (image != null){
                house.setImage(image);
            }
        }
        houseService.updateHouse(house);
        return "redirect:/user/findUserHouse.do";
    }

}
