package com.gmm.house.controller;

import com.gmm.house.pojo.House;
import com.gmm.house.pojo.User;
import com.gmm.house.service.UserService;
import com.gmm.house.utils.MD5Utils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/user")
public class UserController {
    @Autowired
    private UserService userService;

    @RequestMapping("/login.do")
    public String login(HttpSession session,HttpServletResponse response,User user,String remember,String free) throws IOException, ServletException {
        user.setPassword(MD5Utils.md5(user.getPassword()));
        User user1 = userService.login(user);
        if (user1!=null){
            //记住用户名
            if(remember!=null && remember.equals("remember")){
                Cookie usernameCookie = new Cookie("remember", URLEncoder.encode(user1.getUsername(),"UTF-8"));
                usernameCookie.setMaxAge(7*24*60*60);
                response.addCookie(usernameCookie);
            }
            //自动登录,若点击free，则再Cookie中存储用户名和密码
            else if(free!=null && free.equals("free")){
                Cookie usernameCookie = new Cookie("username",URLEncoder.encode(user1.getUsername(),"UTF-8"));
                Cookie passwordCookie = new Cookie("password",user1.getPassword());
                usernameCookie.setMaxAge(7*24*60*60);
                passwordCookie.setMaxAge(7*24*60*60);
                response.addCookie(usernameCookie);
                response.addCookie(passwordCookie);
            }
            session.setAttribute("loginUser", user1);
            return "redirect:/house/findHouseAll.do";
        }
        session.setAttribute("msg","用户名或密码错误");
        return "redirect:/client/login.jsp";
    }
    @RequestMapping("/register.do")
    public String register(User user){
        user.setPassword(MD5Utils.md5(user.getPassword()));
        int count = userService.register(user);
        if (count > 0)
        {
            return "redirect:/client/login.jsp";
        }
        return "redirect:/client/register.jsp";
    }
    @RequestMapping("/logout.do")
    public String logout(HttpSession session){
        //注销session
        session.invalidate();
        return "redirect:/house/findHouseAll.do";
    }
    @RequestMapping("/check.do")
    @ResponseBody
    public String findUserByName(String username){
        User user = userService.findUserByName(username);
        if (user!=null){
            return "username can use";
        }
        return "username not use";
    }
    @RequestMapping("/updateUser.do")
    public ModelAndView updateUser(User user,String newPassword,ModelAndView modelAndView,HttpSession session){
        User loginUser = (User)session.getAttribute("loginUser");
        String md5 = MD5Utils.md5(user.getPassword());
        if (loginUser.getPassword().equals(md5)){
            user.setUid(loginUser.getUid());
            newPassword = MD5Utils.md5(newPassword);
            user.setPassword(newPassword);
            userService.updateUserById(user);
            modelAndView.addObject("pMsg","修改密码成功");
            modelAndView.setViewName("client/user-profile.jsp");
            return modelAndView;
        }
        modelAndView.addObject("pMsg","原密码输入错误");
        modelAndView.setViewName("client/user-profile.jsp");
        return modelAndView;
    }
    @RequestMapping("/findUserHouse.do")
    public ModelAndView findUserHouse(ModelAndView modelAndView,HttpSession session){
        User loginUser = (User)session.getAttribute("loginUser");
        List<House> houseList = userService.findUserHouse(loginUser.getUid());
        modelAndView.addObject("houseList",houseList);
        modelAndView.setViewName("client/my-properties.jsp");
        return modelAndView;
    }
    @RequestMapping("/user-profile.do")
    public String userProfile(){
        return "redirect:/client/user-profile.jsp";
    }
    @RequestMapping("/add-property.do")
    public String addProperty(){
        return "redirect:/client/add-property.jsp";
    }
}

