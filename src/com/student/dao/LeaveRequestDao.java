package com.student.dao;

import com.student.po.LeaveRequest;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class LeaveRequestDao {
    private final String url = "jdbc:mysql://localhost:3306/student";
    private final String user = "root";
    private final String password = "123456789";

    public List<LeaveRequest> getAllLeaveRequests() {
        List<LeaveRequest> leaveRequests = new ArrayList<>();
        String query = "SELECT student_name, student_id, leave_time, leave_reason FROM LeaveRequests";

        try (Connection connection = DriverManager.getConnection(url, user, password);
             PreparedStatement preparedStatement = connection.prepareStatement(query);
             ResultSet resultSet = preparedStatement.executeQuery()) {

            while (resultSet.next()) {
                LeaveRequest leaveRequest = new LeaveRequest();
                leaveRequest.setStudent_name(resultSet.getString("student_name"));
                leaveRequest.setStudent_id(resultSet.getString("student_id"));
                leaveRequest.setLeave_time(resultSet.getString("leave_time"));
                leaveRequest.setLeave_reason(resultSet.getString("leave_reason"));
                leaveRequests.add(leaveRequest);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return leaveRequests;
    }

    public LeaveRequest getLeaveRequestById(String studentId) {
        LeaveRequest leaveRequest = null;
        String query = "SELECT student_name, student_id, leave_time, leave_reason FROM LeaveRequests WHERE student_id = ?";

        try (Connection connection = DriverManager.getConnection(url, user, password);
             PreparedStatement preparedStatement = connection.prepareStatement(query)) {

            preparedStatement.setString(1, studentId);
            ResultSet resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                leaveRequest = new LeaveRequest();
                leaveRequest.setStudent_name(resultSet.getString("student_name"));
                leaveRequest.setStudent_id(resultSet.getString("student_id"));
                leaveRequest.setLeave_time(resultSet.getString("leave_time"));
                leaveRequest.setLeave_reason(resultSet.getString("leave_reason"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return leaveRequest;
    }

    public void approveLeaveRequest(String studentId) {
        String query = "DELETE FROM LeaveRequests WHERE student_id = ?";

        try (Connection connection = DriverManager.getConnection(url, user, password);
             PreparedStatement preparedStatement = connection.prepareStatement(query)) {

            preparedStatement.setString(1, studentId);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void rejectLeaveRequest(String studentId) {
        String query = "DELETE FROM LeaveRequests WHERE student_id = ?";

        try (Connection connection = DriverManager.getConnection(url, user, password);
             PreparedStatement preparedStatement = connection.prepareStatement(query)) {

            preparedStatement.setString(1, studentId);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}