package com.example.realcase.web;

import com.example.realcase.service.UserService;
import com.example.realcase.service.impl.UserServiceImpl;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "delSelectedServlet", value = "/delSelectedServlet")
public class delSelectedServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String[] ids=request.getParameterValues("uid");

        UserService service= new UserServiceImpl();
        service.delSelectedUser(ids);

        response.sendRedirect(request.getContextPath()+"/findUserByPageServlet");

    }
}
