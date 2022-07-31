package com.example.realcase.web;

import javax.imageio.ImageIO;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.Random;

@WebServlet(name = "checkCodeServlet", value = "/checkCodeServlet")
public class checkCodeServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        int width=100;
        int height=50;

        BufferedImage image=new BufferedImage(width,height,BufferedImage.TYPE_INT_BGR);

        Graphics g=image.getGraphics();
        g.setColor(Color.YELLOW);
        g.fillRect(0,0,width,height);

        g.setColor(Color.BLUE);
        g.drawRect(0,0,width-1,height-1);

        String str="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
        Random ran=new Random();
        StringBuilder sb=new StringBuilder();
        for(int i=1;i<=4;i++) {
            int index = ran.nextInt(str.length());
            char ch=str.charAt(index);
            sb.append(ch);

            g.drawString(ch+"",width/5*i,height/2);
        }
        String checkCode_session=sb.toString();
        request.getSession().setAttribute("CHECKCODE_SESSION",checkCode_session);

        g.setColor(Color.GREEN);
        for(int i=0;i<10;i++) {
            int x1 = ran.nextInt(width);
            int x2 = ran.nextInt(width);
            int y1 = ran.nextInt(height);
            int y2 = ran.nextInt(height);
            g.drawLine(x1, y1, x2, y2);
        }

        ImageIO.write(image,"jpg",response.getOutputStream());

    }
}
