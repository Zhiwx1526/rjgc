<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="com.student.po.Student" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>修改学生信息</title>

    <style>
        body {
            background-color: #f4f4f4;
            color: #333;
            font-family: 'Roboto', sans-serif;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
        }

        .mainDiv {
            width: 80%;
            max-width: 600px;
            background-color: white;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            padding: 20px;
        }

        h1 {
            text-align: center;
            color: #333;
            margin-bottom: 20px;
        }

        form {
            display: flex;
            flex-direction: column;
        }

        label {
            font-weight: 500;
            margin-bottom: 5px;
        }

        input[type="text"],
        input[type="submit"] {
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 4px;
            margin-bottom: 15px;
        }

        input[type="submit"] {
            background-color: #007BFF;
            color: white;
            cursor: pointer;
        }

        input[type="submit"]:hover {
            background-color: #0056b3;
        }

        a {
            text-align: center;
            margin-top: 20px;
            color: #007BFF;
        }
    </style>
</head>

<body>
<div class="mainDiv">
    <h1>修改学生信息</h1>
    <form action="UpdateServlet">
        <%
            Student s = (Student) request.getAttribute("student");
        %>
        <input type="hidden" name="sno" value="<%=s.getSno()%>"/>
        <label for="sname">姓名:</label>
        <input type="text" id="sname" name="sname" placeholder="姓名" value="<%=s.getSname()%>"/>
        <label for="sex">性别:</label>
        <input type="text" id="sex" name="sex" placeholder="性别" value="<%=s.getSex()%>"/>
        <label for="age">年龄:</label>
        <input type="text" id="age" name="age" placeholder="年龄" value="<%=s.getAge()%>"/>
        <label for="phone">电话:</label>
        <input type="text" id="phone" name="phone" placeholder="电话" value="<%=s.getPhone()%>"/>
        <input type="submit" value="修改"/>
        <a href="showAllStudents.jsp">返回</a>
    </form>
</div>
</body>
</html>