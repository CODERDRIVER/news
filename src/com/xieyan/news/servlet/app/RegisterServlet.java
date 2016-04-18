package com.xieyan.news.servlet.app;

import com.xieyan.news.bean.User;
import com.xieyan.news.control.UserController;
import com.xieyan.news.control.impl.UserControllerImpl;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.*;
import java.io.IOException;
import java.io.PrintWriter;


/**
 * 注册Servlet
 * Created by xieyan on 16/1/6.
 */
public class RegisterServlet extends HttpServlet {

    transient static final Logger logger = LoggerFactory.getLogger(RegisterServlet.class);

    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        PrintWriter out = response.getWriter();

        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String checkPassword = request.getParameter("checkpassword");

        //判断两次输入的密码是否相同
        if (password.equals(checkPassword)) {

            User user = new User();
            user.setUserName(username);
            user.setUserPassword(password);
            UserController userInter = new UserControllerImpl();
            if (userInter.register(user)) {
                JOptionPane.showMessageDialog(null, "注册成功！");
                response.sendRedirect("news/jsp/login.jsp");
            } else {
                JOptionPane.showMessageDialog(null, "注册失败！");
                response.sendRedirect("news/jsp/register.jsp");
            }
        } else {
            JOptionPane.showMessageDialog(null, "密码不一致");
            response.sendRedirect("news/jsp/register.jsp");
        }
    }
}