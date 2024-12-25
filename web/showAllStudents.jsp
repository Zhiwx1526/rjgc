<%@ page language="java" contentType="text/html; charset=utf-8"  pageEncoding="utf-8"%>
<%@ page import="com.student.po.Student" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<!DOCTYPE html>
<html>
<head>
    <title>学生信息管理平台</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
            margin: 0;
            padding: 0;
        }

        .mainDiv {
            width: 900px;
            margin: 50px auto;
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        .titleDiv {
            background-color: #007bff;
            color: white;
            padding: 20px 30px;
            font-size: 36px;
            border-top-left-radius: 10px;
            border-top-right-radius: 10px;
        }

        .showStudentDiv {
            padding: 30px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            background-color: #fff;
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        th, td {
            padding: 15px;
            text-align: center;
            border-bottom: 1px solid #ddd;
        }

        th {
            background-color: #007bff;
            color: white;
        }

        tr:hover {
            background-color: #f2f2f2;
        }

        .btn {
            padding: 8px 20px;
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 5px;
            text-decoration: none;
        }

        .btn:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
<div class="mainDiv">
    <div class="titleDiv">查看所有学生信息</div>
    <div class="showStudentDiv">
        <table>
            <tr>
                <th>学号</th>
                <th>姓名</th>
                <th>性别</th>
                <th>年龄</th>
                <th>电话</th>
                <th>操作</th>
            </tr>
            <% List<Student> allStudents = (List<Student>) session.getAttribute("allStudents");
                for (int i = 0; i < allStudents.size(); i++) {
                    Student s = allStudents.get(i);
            %>
            <tr>
                <td><%= s.getSno() %></td>
                <td><%= s.getSname() %></td>
                <td><%= s.getSex() %></td>
                <td><%= s.getAge() %></td>
                <td><%= s.getPhone() %></td>
                <td>
                    <a class="btn" href="DeleteServlet?sno=<%= s.getSno() %>">删除</a>
                    <a class="btn" href="QueryStudentBySnoServlet?sno=<%= s.getSno() %>">修改</a>
                </td>
            </tr>
            <% } %>
        </table>
        <a class="btn" href="main.jsp">返回</a>
    </div>
</div>
</body>
</html>
