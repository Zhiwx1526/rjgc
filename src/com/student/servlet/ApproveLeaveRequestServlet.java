package com.student.servlet;

import com.student.service.LeaveRequestService;
import com.student.po.LeaveRequest;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/approveLeaveRequest")
public class ApproveLeaveRequestServlet extends HttpServlet {
    private final LeaveRequestService leaveRequestService = new LeaveRequestService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String studentId = request.getParameter("student_id");
        LeaveRequest leaveRequest = leaveRequestService.getLeaveRequestById(studentId);

        request.setAttribute("leaveRequest", leaveRequest);
        request.getRequestDispatcher("approveLeaveRequest.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        String studentId = request.getParameter("student_id");

        if ("approve".equals(action)) {
            leaveRequestService.approveLeaveRequest(studentId);
        } else if ("reject".equals(action)) {
            leaveRequestService.rejectLeaveRequest(studentId);
        }

        response.sendRedirect("leaveRequests");
    }
}