<%@ page import="com.student.po.Absence" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>学生旷课记录</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css">
</head>
<body class="bg-gray-100 p-5">
<h1 class="text-2xl font-bold mb-4">学生旷课记录</h1>
<table class="min-w-full bg-white border border-gray-300">
    <thead>
    <tr>
        <th class="border px-4 py-2">姓名</th>
        <th class="border px-4 py-2">学号</th>
        <th class="border px-4 py-2">旷课日期</th>
        <th class="border px-4 py-2">课程名称</th>
        <th class="border px-4 py-2">旷课学时</th>
    </tr>
    </thead>
    <tbody>
    <%
        List<Absence> absences = (List<Absence>) request.getAttribute("absences");
        if (absences != null) {
            for (Absence absence : absences) {
    %>
    <tr>
        <td class="border px-4 py-2"><%= absence.getStudent_name() %></td>
        <td class="border px-4 py-2"><%= absence.getStudent_id() %></td>
        <td class="border px-4 py-2"><%= absence.getClass_date() %></td>
        <td class="border px-4 py-2"><%= absence.getCourse_date() %></td>
        <td class="border px-4 py-2"><%= absence.getHours_absent() %></td>
    </tr>
    <%
        }
    } else {
    %>
    <tr>
        <td colspan="5" class="border px-4 py-2 text-center">没有找到旷课记录</td>
    </tr>
    <%
        }
    %>
    </tbody>
</table>
</body>
</html>