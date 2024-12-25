package com.student.servlet;

import com.student.service.AbsenceService;
import com.student.po.Absence;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/viewAbsences")
public class ViewAbsencesServlet extends HttpServlet {
    private AbsenceService absenceService = new AbsenceService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("访问了查看旷课记录的 Servlet");
        List<Absence> absences = absenceService.getAllAbsences();
        System.out.println("获取到的旷课记录数量: " + absences.size());
        request.setAttribute("absences", absences);
        request.getRequestDispatcher("/viewAbsences.jsp").forward(request, response);
    }
}