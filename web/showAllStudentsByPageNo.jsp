<%@ page import="com.student.po.Student" %>
<%@ page import="java.util.List" %>
<%@ page import="com.student.po.Page" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.util.List"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>分页查询学生信息</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f9f9f9;
            text-align: center;
        }

        .mainDiv {
            width: 80%;
            margin: 0 auto;
            background-color: #f1f1f1;
            padding: 20px;
            border-radius: 10px;
            margin-top: 50px;
        }

        .titleDiv {
            margin-bottom: 20px;
        }

        .title {
            font-size: 24px;
            color: #4885ed;
        }

        .showStudentDiv {
            margin-top: 20px;
        }

        .item {
            margin-top: 10px;
        }

        form {
            display: inline-block;
            margin-bottom: 10px;
        }

        .item a {
            background-color: #4885ed;
            color: #fff;
            padding: 8px 16px;
            text-decoration: none;
            border-radius: 5px;
            margin-right: 10px;
            font-size: 16px;
        }

        .searchInput {
            padding: 8px;
            margin-right: 10px;
            font-size: 16px;
            border: 1px solid #4885ed;
            border-radius: 5px;
        }

        .searchBtn {
            background-color: #4885ed;
            color: #fff;
            border: none;
            padding: 8px 16px;
            border-radius: 5px;
            font-size: 16px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            background-color: #fff;
            border-radius: 5px;
            box-shadow: 0px 0px 5px rgba(0, 0, 0, 0.1);
            margin-top: 20px;
        }

        table td, table th {
            border: 1px solid #ddd;
            height: 30px;
            text-align: center;
            font-size: 15px;
        }

        .currentPage {
            text-align: right;
            margin-top: 10px;
        }

        .returnBtn {
            background-color: #4885ed;
            color: #fff;
            padding: 8px 16px;
            text-decoration: none;
            border-radius: 5px;
            font-size: 16px;
            float: right;
        }
    </style>
</head>
<body>
<div class="mainDiv">
    <div class="titleDiv">
        <h1 class="title">分页查询学生信息</h1>
    </div>
    <div class="showStudentDiv">
        <div class="item">
            <form action="FindStudentBySnoServlet" method="post">
                <label for="sno">学号:</label>
                <input type="text" id="sno" name="sno" required>
                <input type="submit" value="查找">
            </form>
        </div>
        <table border="2" cellspacing="0">
            <tr>
                <th><h3>学号</h3></th>
                <th><h3>姓名</h3></th>
                <th><h3>性别</h3></th>
                <th><h3>年龄</h3></th>
                <th><h3>电话</h3></th>
            </tr>
            <% Page page1 = (Page)request.getAttribute("page1");
                List<Student> students = page1.getStudent();
                if (students != null) {
                    for (Student student : students) {
            %>
            <tr>
                <td><%=student.getSno() %></td>
                <td><%=student.getSname() %></td>
                <td><%=student.getSex() %></td>
                <td><%=student.getAge() %></td>
                <td><%=student.getPhone() %></td>
            </tr>
            <% } } %>
        </table>

        <div class="currentPage">
            当前第<%=page1.getCurrentPage()+1%>页
        </div>

        <div class="item">
            <a href="ShowStudentsByPageServlet?currentPage=0">首页</a>
            <a href="ShowStudentsByPageServlet?currentPage=<%=page1.getCurrentPage()-1%>">上一页</a>
            <a href="ShowStudentsByPageServlet?currentPage=<%=page1.getCurrentPage()+1%>">下一页</a>
            <a href="ShowStudentsByPageServlet?currentPage=<%=page1.getTotalPage()%>">尾页</a>
        </div>

        <a href="main.jsp" class="returnBtn">返回</a>
    </div>
</div>
</body>
</html>