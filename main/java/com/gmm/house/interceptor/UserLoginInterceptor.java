package com.gmm.house.interceptor;

import com.gmm.house.pojo.Admin;
import com.gmm.house.pojo.User;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class UserLoginInterceptor implements HandlerInterceptor {
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws IOException {
        //逻辑：判断用户是否登录  本质：判断session中有没有user
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("loginUser");
        if(user==null){
            //没有登录
            response.sendRedirect(request.getContextPath()+"/client/login.jsp");
            return false;
        }//放行  访问目标资源
        return true;
    }
}
