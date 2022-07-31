package com.example.realcase.web;

import com.example.realcase.domain.ManageUser;
import com.example.realcase.service.UserService;
import com.example.realcase.service.impl.UserServiceImpl;
import org.apache.commons.beanutils.BeanUtils;


import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.Map;

@WebServlet(name = "loginServlet", value = "/loginServlet")
public class loginServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        request.setCharacterEncoding("utf-8");

        String verifycode=request.getParameter("verifycode");

        HttpSession session=request.getSession();
        String checkCode_session= (String) session.getAttribute("CHECKCODE_SESSION");
        session.removeAttribute("CHECKCODE_SESSION");

        if(!checkCode_session.equalsIgnoreCase(verifycode)){

            request.setAttribute("login_msg","验证码错误");
            request.getRequestDispatcher("/login.jsp").forward(request,response);
            return;
        }

        Map<String,String[]> map=request.getParameterMap();
        ManageUser manageuser=new ManageUser();
        try {
            BeanUtils.populate(manageuser,map);
        } catch (IllegalAccessException | InvocationTargetException e) {
            throw new RuntimeException(e);
        }
        UserService service=new UserServiceImpl();
        ManageUser loginUser=service.login(manageuser);

        if(loginUser!=null){
            session.setAttribute("manageuser",loginUser);
            response.sendRedirect(request.getContextPath()+"/index.jsp");
        }
        else{
            request.setAttribute("login_msg","用户名或密码错误");
            request.getRequestDispatcher("/login.jsp").forward(request,response);
        }
    }
}
