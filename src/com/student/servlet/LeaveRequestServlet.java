package com.student.servlet;

import com.student.service.LeaveRequestService;
import com.student.po.LeaveRequest;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/leaveRequests")
public class LeaveRequestServlet extends HttpServlet {
    private final LeaveRequestService leaveRequestService = new LeaveRequestService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<LeaveRequest> leaveRequests = leaveRequestService.getAllLeaveRequests();
        request.setAttribute("leaveRequests", leaveRequests);
        request.getRequestDispatcher("/leaveRequests.jsp").forward(request, response);
    }
}