package com.gmm.house.controller;

import com.github.pagehelper.PageInfo;
import com.gmm.house.pojo.Admin;
import com.gmm.house.pojo.Evaluate;
import com.gmm.house.pojo.House;
import com.gmm.house.pojo.User;
import com.gmm.house.service.AdminService;
import com.gmm.house.utils.MD5Utils;
import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.beanutils.ConvertUtils;
import org.apache.commons.beanutils.Converter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;


@Controller
@RequestMapping("/admin")
public class AdminController {

    @Autowired
    private AdminService adminService;

    @RequestMapping("/showAdmin/{id}")
    public String findById(@PathVariable("id") int id, Model model){
        return null;
    }

    /**
     * 管理员登录控制
     * @param username
     * @param password
     * @return
     */
    @RequestMapping("/login.do")
    public ModelAndView login(String username, String password, HttpSession session){
        ModelAndView modelAndView = new ModelAndView();
        Admin admin = adminService.login(username,password);
        if (admin!=null){
            session.setAttribute("admin", admin);
            modelAndView.setViewName("admin/pages/main.jsp");
            return modelAndView;
        }else {
           modelAndView.addObject("msg", "用户名或密码不匹配");
           modelAndView.setViewName("admin/login.jsp");
           return modelAndView;
        }
    }
    @RequestMapping("/logout.do")
    public String logout(HttpSession session){
        session.invalidate();
        return "redirect:/admin/login.jsp";
    }
    @RequestMapping("/userListAll.do")
    public ModelAndView userListAll(@RequestParam(name = "page",required = true,defaultValue = "1") int page, @RequestParam(name = "size",required = true,defaultValue = "2") int size){
        ModelAndView modelAndView = new ModelAndView();
        PageInfo<User> userPageInfo = adminService.findUserAll(page, size);
        modelAndView.addObject("userList", userPageInfo);
        modelAndView.setViewName("admin/pages/user-list.jsp");
        return modelAndView;
    }
    @RequestMapping("/del/{id}.do")
    public String delUser(@PathVariable("id") int id){
        adminService.delUserById(id);
        return "redirect:/admin/userListAll.do";
    }

    @RequestMapping("/addUser.do")
    public String addUser(User user){
        adminService.addUser(user);
        return "redirect:/admin/userListAll.do";
    }
    /**
     * 修改用户信息
     */
    @RequestMapping("/updateUser.do")
    public String updateUserById(User user){
        String pwd = MD5Utils.md5(user.getPassword());
        user.setPassword(pwd);
        adminService.updateUserById(user);
        return "redirect:/admin/userListAll.do";

    }
    /**
     * 根据用户id查询用户信息
     */
    @RequestMapping("/findUserById/{id}.do")
    @ResponseBody
    public User findUserById(@PathVariable("id") int id){
        User user = new User();
        user = adminService.findUserById(id);
        System.out.println(user);
        return user;
    }
    /**
     * 模糊查询根据姓名
     */
    @RequestMapping("/findByLikeName.do")
    public ModelAndView findByLikeName(@RequestParam(name = "searchName",defaultValue = "") String searchName,@RequestParam(name = "page",required = true,defaultValue = "1") int page, @RequestParam(name = "size",required = true,defaultValue = "2") int size) {
        ModelAndView modelAndView = new ModelAndView();
        PageInfo<User> userPageInfo = adminService.findByLikeName(searchName,page,size);
        modelAndView.addObject("userList", userPageInfo);
        modelAndView.addObject("searchName",searchName);
        modelAndView.setViewName("admin/pages/user-list.jsp");
        return modelAndView;
    }
    /**
     * 查询全部房源信息
     */
    @RequestMapping("/houseListAll.do")
    public ModelAndView findAllHouse(@RequestParam(name = "searchName",defaultValue = "") String searchName,@RequestParam(name = "page",required = true,defaultValue = "1") int page, @RequestParam(name = "size",required = true,defaultValue = "2") int size){
        ModelAndView modelAndView = new ModelAndView();
        PageInfo<House> housePageInfo = adminService.findAllHouse(page,size,searchName);
        modelAndView.addObject("houseList",housePageInfo);
        modelAndView.addObject("searchName",searchName);
        modelAndView.setViewName("admin/pages/house-list.jsp");
        return modelAndView;
    }
    /**
     * 删除房源
     */
    @RequestMapping("/delHouse/{id}.do")
    public String delHouse(@PathVariable("id") int id){
        adminService.delHouseById(id);
        return "redirect:/admin/houseListAll.do";
    }
    /**
     * 修改房源信息
     */
    @RequestMapping("/updateHouse/{id}.do")
    public String updateHouse(House house, MultipartFile file,@PathVariable("id") int id){
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
            House house1 = adminService.findHouseById(house.getHid());
            String image = house1.getImage();
            if (image != null){
                house.setImage(image);
            }
        }
        adminService.updateHouseById(house);
        return "redirect:/admin/houseListAll.do";
    }
    /**
     * 添加房源信息
     */
    @RequestMapping("/addHouse.do")
    public String addHouse(House house, MultipartFile file){
        if (file != null){
        String originalFilename = file.getOriginalFilename();
        String newName = UUID.randomUUID()+originalFilename.substring(originalFilename.lastIndexOf("."),originalFilename.length());
        try {
            file.transferTo(new File("D:\\houseImage\\"+newName));
            house.setImage("/img/"+newName);
        } catch (IOException e) {
            e.printStackTrace();
        }
        adminService.addHouse(house);
        }
        return "redirect:/admin/houseListAll.do";
    }
    /**
     * 根据id查询房源信息
     */
    @RequestMapping("/findHouseById/{id}.do")
    @ResponseBody
    public House findHouseById(@PathVariable("id") int id){
        return adminService.findHouseById(id);
    }
    /**
     * 评价管理
     * 1.查看所有评价，删除评价
     */
    @RequestMapping("/findEvaluate.do")
    public ModelAndView findEvaluate(@RequestParam(name = "searchName",defaultValue = "") String searchName,@RequestParam(name = "page",required = true,defaultValue = "1") int page, @RequestParam(name = "size",required = true,defaultValue = "2") int size){
        ModelAndView modelAndView = new ModelAndView();
        PageInfo<Evaluate> pageInfo = adminService.findEvaluate(size,page,searchName);
        modelAndView.addObject("evaluateList",pageInfo);
        modelAndView.addObject("searchName",searchName);
        modelAndView.setViewName("admin/pages/evaluate-list.jsp");
        return modelAndView;
    }
    @RequestMapping("/delEvaluate/{id}.do")
    public String delEvaluate(@PathVariable("id") int id){
        adminService.delEvaluateById(id);
        return "redirect:/admin/findEvaluate.do";
    }





}
