package com.student.servlet;

import com.student.dao.StudentDao;
import com.student.dao.StudentDaoImpl;
import com.student.service.StudentService;
import com.student.service.StudentServiceImpl;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.*;
@WebServlet("/UpdatePasswordServlet")
public class UpdatePasswordServlet extends HttpServlet {

    private StudentService studentService;

    public void init() {
        StudentDao studentDao = new StudentDaoImpl();
        studentService = new StudentServiceImpl(studentDao);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int uid = Integer.parseInt(request.getParameter("uid"));
        String oldPwd = request.getParameter("oldPwd");
        String newPwd = request.getParameter("newPwd");

        boolean passwordUpdated = studentService.updatePassword(uid, oldPwd, newPwd);

        if (passwordUpdated) {
            response.sendRedirect("main.jsp");
        } else {
            response.sendRedirect("failure.jsp");
        }
    }
}
