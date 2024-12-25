<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.student.po.LeaveRequest" %>
<html>
<head>
    <title>审批请假请求</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css">
</head>
<body class="bg-gray-100 p-6">
<div class="max-w-md mx-auto bg-white p-6 rounded-lg shadow-md">
    <h2 class="text-xl font-bold mb-4">审批请假请求</h2>
    <%
        LeaveRequest leaveRequest = (LeaveRequest) request.getAttribute("leaveRequest");
        if (leaveRequest != null) {
    %>
    <form action="approveLeaveRequest" method="post">
        <input type="hidden" name="student_id" value="<%= leaveRequest.getStudent_id() %>">
        <div class="mb-4">
            <label class="block text-gray-700">请假人姓名:</label>
            <p class="text-gray-900"><%= leaveRequest.getStudent_name() %></p>
        </div>
        <div class="mb-4">
            <label class="block text-gray-700">学号:</label>
            <p class="text-gray-900"><%= leaveRequest.getStudent_id() %></p>
        </div>
        <div class="mb-4">
            <label class="block text-gray-700">请假时间:</label>
            <p class="text-gray-900"><%= leaveRequest.getLeave_time() %></p>
        </div>
        <div class="mb-4">
            <label class="block text-gray-700">请假原因:</label>
            <p class="text-gray-900"><%= leaveRequest.getLeave_reason() %></p>
        </div>
        <div class="flex justify-between">
            <button type="submit" name="action" value="approve" class="bg-green-500 text-white px-4 py-2 rounded">同意</button>
            <button type="submit" name="action" value="reject" class="bg-red-500 text-white px-4 py-2 rounded">拒绝</button>
        </div>
    </form>
    <%
    } else {
    %>
    <p class="text-red-500">未找到请假请求信息。</p>
    <%
        }
    %>
</div>
</body>
</html>