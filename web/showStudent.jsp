<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.student.po.Student" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>学生信息</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
        }

        h2 {
            color: #333;
        }

        table {
            border-collapse: collapse;
            width: 100%;
            margin-top: 20px;
        }

        th, td {
            text-align: left;
            padding: 8px;
            border-bottom: 1px solid #ddd;
        }

        th {
            background-color: #f2f2f2;
        }

        .no-data {
            margin-top: 20px;
            color: #666;
            text-align: center;
        }

        .back-link {
            margin-top: 20px;
            text-align: center;
            font-size: 16px;
        }
    </style>
</head>
<body>
<%
    Student student = (Student) request.getAttribute("student");
    if (student != null) {
%>
<h2>学生信息</h2>
<table>
    <tr>
        <th>学号:</th>
        <td><%= student.getSno() %></td>
    </tr>
    <tr>
        <th>姓名:</th>
        <td><%= student.getSname() %></td>
    </tr>
    <tr>
        <th>性别:</th>
        <td><%= student.getSex() %></td>
    </tr>
    <tr>
        <th>年龄:</th>
        <td><%= student.getAge() %></td>
    </tr>
    <tr>
        <th>电话:</th>
        <td><%= student.getPhone() %></td>
    </tr>
</table>
<%
} else {
%>
<div class="no-data">
    <h2>未找到该学生</h2>
</div>
<%
    }
%>
<div class="back-link">
    <a href="main.jsp">返回</a>
</div>
</body>
</html>