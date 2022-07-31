package com.example.realcase.web;

import com.example.realcase.domain.User;
import com.example.realcase.service.UserService;
import com.example.realcase.service.impl.UserServiceImpl;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "findUserServlet", value = "/findUserServlet")
public class findUserServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String id= request.getParameter("id");

        UserService service=new UserServiceImpl();
        User user=service.findUserById(id);

        request.setAttribute("user",user);

        request.getRequestDispatcher("/update.jsp").forward(request,response);
    }
}
