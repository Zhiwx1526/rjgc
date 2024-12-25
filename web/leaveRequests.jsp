<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.student.po.LeaveRequest" %>
<!DOCTYPE html>
<html>
<head>
    <title>请假记录</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
        }
        th, td {
            border: 1px solid #ddd;
            padding: 8px;
        }
        th {
            background-color: #f2f2f2;
        }
    </style>
</head>
<body>
<h1>请假记录</h1>
<table>
    <thead>
    <tr>
        <th>姓名</th>
        <th>学号</th>
        <th>请假时间</th>
        <th>请假原因</th>
    </tr>
    </thead>
    <tbody>
    <%
        List<LeaveRequest> leaveRequests = (List<LeaveRequest>) request.getAttribute("leaveRequests");
        for (LeaveRequest leaveRequest : leaveRequests) {
    %>
    <tr>
        <td><%= leaveRequest.getStudent_name() %></td>
        <td><%= leaveRequest.getStudent_id() %></td>
        <td><%= leaveRequest.getLeave_time() %></td>
        <td><%= leaveRequest.getLeave_reason() %></td>
    </tr>
    <%
        }
    %>
    </tbody>
</table>
</body>
</html>