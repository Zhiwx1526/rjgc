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
import java.io.IOException;

@WebServlet("/FindStudentBySnoServlet")

public class FindStudentBySnoServlet extends HttpServlet {
    StudentDao studentDao = new StudentDaoImpl();

    private StudentService studentService = new StudentServiceImpl(studentDao);

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int sno = Integer.parseInt(request.getParameter("sno"));
        Student student = studentService.findStudentBySno(sno);
        request.setAttribute("student", student);
        request.getRequestDispatcher("showStudent.jsp").forward(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
