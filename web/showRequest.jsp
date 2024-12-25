<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.student.po.LeaveRequest" %>
<%@ page import="com.student.service.LeaveRequestService" %>
<%
    LeaveRequestService leaveRequestService = new LeaveRequestService();
    List<LeaveRequest> leaveRequests = leaveRequestService.getAllLeaveRequests(); // 获取所有请假请求
%>
<html>
<head>
    <title>请假请求列表</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css">
</head>
<body class="bg-gray-100 p-6">
<div class="max-w-2xl mx-auto bg-white p-6 rounded-lg shadow-md">
    <h2 class="text-xl font-bold mb-4">请假请求列表</h2>
    <table class="min-w-full">
        <thead>
        <tr>
            <th class="px-4 py-2">姓名</th>
            <th class="px-4 py-2">学号</th>
            <th class="px-4 py-2">请假时间</th>
            <th class="px-4 py-2">操作</th>
        </tr>
        </thead>
        <tbody>
        <%
            for (LeaveRequest leaveRequest : leaveRequests) {
        %>
        <tr>
            <td class="border px-4 py-2"><%= leaveRequest.getStudent_name() %></td>
            <td class="border px-4 py-2"><%= leaveRequest.getStudent_id() %></td>
            <td class="border px-4 py-2"><%= leaveRequest.getLeave_time() %></td>
            <td class="border px-4 py-2">
                <a href="approveLeaveRequest?student_id=<%= leaveRequest.getStudent_id() %>" class="text-blue-500">审批</a>
            </td>
        </tr>
        <%
            }
        %>
        </tbody>
    </table>
</div>
</body>
</html>