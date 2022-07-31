package com.example.realcase.web;

import com.example.realcase.domain.PageBean;
import com.example.realcase.domain.User;
import com.example.realcase.service.UserService;
import com.example.realcase.service.impl.UserServiceImpl;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.Map;

@WebServlet(name = "findUserByPageServlet", value = "/findUserByPageServlet")
public class findUserByPageServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        request.setCharacterEncoding("utf-8");

        String currentPage=request.getParameter("currentPage");
        String rows=request.getParameter("rows");

        if(currentPage==null||"".equals(currentPage)){
            currentPage="1";
        }
        if(rows==null||"".equals(rows)){
            rows="7";
        }

        Map<String,String[]> condition=request.getParameterMap();


        UserService service=new UserServiceImpl();
        PageBean<User> pb=service.findUserByPage(currentPage,rows,condition);

        request.setAttribute("pb",pb);
        request.setAttribute("condition",condition);
        request.getRequestDispatcher("/list.jsp").forward(request,response);
    }
}
