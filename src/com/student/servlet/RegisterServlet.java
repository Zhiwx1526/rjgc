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

@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet{

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        StudentDao studentDao = new StudentDaoImpl();
        StudentService service = new StudentServiceImpl(studentDao);
        String uid = request.getParameter("uid");
        String pwd = request.getParameter("pwd");
        String email =request.getParameter("email");
        int uid1 = Integer.parseInt(uid);
        boolean result = service.addLogin(uid1,pwd);

        if(!result) {
            request.setAttribute("register", "reg");
            request.getRequestDispatcher("index.jsp").forward(request, response);
        }else {
            request.getRequestDispatcher("register.jsp").forward(request, response);
        }

    }

}


