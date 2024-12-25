package com.student.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.student.dao.StudentDao;
import com.student.dao.StudentDaoImpl;
import com.student.po.Student;
import com.student.service.StudentService;
import com.student.service.StudentServiceImpl;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        StudentDao studentDao = new StudentDaoImpl();
        StudentService service = new StudentServiceImpl(studentDao);
        HttpSession session = request.getSession();

        if (session.getAttribute("loginErrorMessage") != null) {
            session.invalidate();
        }
        String uid = request.getParameter("uid");
        String pwd = request.getParameter("pwd");
        String captcha = request.getParameter("captcha");

        String sessionCaptcha = (String) session.getAttribute("captcha");
        if (sessionCaptcha == null || !sessionCaptcha.equalsIgnoreCase(captcha)) {
            session.setAttribute("loginErrorMessage", "验证码错误!");
            response.sendRedirect("index.jsp");
            return;
        }

        int uid1 = Integer.parseInt(uid);
        boolean result = service.login(uid1, pwd);

        if (result) {
            session.setAttribute("login", "log");
            response.sendRedirect("main.jsp");
        } else {
            session.setAttribute("loginErrorMessage", "用户名或密码错误!");
            response.sendRedirect("index.jsp");
        }

    }

}