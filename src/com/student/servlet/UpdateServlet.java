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
import java.util.List;

@WebServlet("/UpdateServlet")
public class UpdateServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse resp) throws ServletException, IOException {

        String sno = request .getParameter("sno");
        String sname  = request.getParameter("sname");
        String sex  = request.getParameter("sex");
        String age  = request.getParameter("age");
        String phone  = request.getParameter("phone");

        int sno1 = 0;
        if(sno != null && !"".equals(sno)){
            sno1 = Integer.parseInt(sno);
        }
        int age1 = 0;
        if(age != null && !"".equals(age)){
            age1 = Integer.parseInt(age);
        }


        Student stu = new Student(sno1, sname, sex, age1, phone);
        StudentDao studentDao = new StudentDaoImpl();
        StudentService service = new StudentServiceImpl(studentDao);
        service.updateStudentBySno(sno1,stu);

        request.getRequestDispatcher("ShowAllStudentsServlet").forward(request, resp);

    }
}

