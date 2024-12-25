package com.student.servlet;


import com.student.dao.StudentDao;
import com.student.dao.StudentDaoImpl;
import com.student.po.Student;
import com.student.service.StudentService;
import com.student.service.StudentServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/AddServlet")
public class AddServlet extends HttpServlet{

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        StudentDao studentDao = new StudentDaoImpl();

        StudentService service = new StudentServiceImpl(studentDao);
        String sno  = request.getParameter("sno");
        String sname  = request.getParameter("sname");
        String sex  = request.getParameter("sex");
        String age  = request.getParameter("age");
        String phone  = request.getParameter("phone");

        int sno1 = 0;
        if(sno != null || "".equals(sno)){
            sno1 = Integer.parseInt(sno);
        }

        int age1 = 0;
        if (age !=null || "".equals(age)){
            age1 = Integer.parseInt(age);
        }

        Student s = new Student(sno1, sname, sex, age1, phone);
        int result = service.addStudent(s);

        HttpSession session = request.getSession();
        session.setAttribute("student", "stu");
        response.sendRedirect("main.jsp");

    }
}


