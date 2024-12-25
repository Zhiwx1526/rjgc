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



@WebServlet("/QueryStudentBySnoServlet")
public class QueryStudentBySnoServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String sno = request.getParameter("sno");
        int sno1 = 0;
        if(sno != null && !"".equals(sno)){
            sno1 = Integer.parseInt(sno);
        }
        StudentDao studentDao = new StudentDaoImpl();
        StudentService service = new StudentServiceImpl(studentDao);
        Student student = service.queryStudentBySno(sno1);
        request.setAttribute("student", student);
        request.getRequestDispatcher("updateStudent.jsp").forward(request,response);

    }
}


