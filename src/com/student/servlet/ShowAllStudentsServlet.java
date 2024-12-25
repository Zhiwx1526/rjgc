package com.student.servlet;


import java.io.IOException;
import java.util.List;

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

@WebServlet("/ShowAllStudentsServlet")
public class ShowAllStudentsServlet extends HttpServlet{

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        StudentDao studentDao = new StudentDaoImpl();
        StudentService service = new StudentServiceImpl(studentDao);
        HttpSession  session =   request.getSession();
        List<Student> allStudents = service.getAllStudents();
        session.setAttribute("allStudents", allStudents);
        response.sendRedirect("showAllStudents.jsp");
    }

}


