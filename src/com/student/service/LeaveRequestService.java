package com.student.service;

import com.student.dao.LeaveRequestDao;
import com.student.po.LeaveRequest;

import java.util.List;

public class LeaveRequestService {
    private final LeaveRequestDao leaveRequestDao = new LeaveRequestDao();

    public List<LeaveRequest> getAllLeaveRequests() {
        return leaveRequestDao.getAllLeaveRequests();
    }

    public LeaveRequest getLeaveRequestById(String studentId) {
        return leaveRequestDao.getLeaveRequestById(studentId);
    }

    public void approveLeaveRequest(String studentId) {
        leaveRequestDao.approveLeaveRequest(studentId);
    }

    public void rejectLeaveRequest(String studentId) {
        leaveRequestDao.rejectLeaveRequest(studentId);
    }
}