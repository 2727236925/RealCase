package com.example.realcase.web;

import com.example.realcase.domain.User;
import com.example.realcase.service.UserService;
import com.example.realcase.service.impl.UserServiceImpl;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "userListServlet", value = "/userListServlet")
public class userListServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        UserService service=new UserServiceImpl();
        List<User> users=service.findAll();

        request.setAttribute("users",users);

        request.getRequestDispatcher("./list.jsp").forward(request,response);
    }
}
