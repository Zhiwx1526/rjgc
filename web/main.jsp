<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.student.po.Student" %>
<!DOCTYPE html>
<html lang="zh">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>学生信息管理平台</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
            background-color: #f0f0f0;
        }

        .navbar {
            display: flex;
            justify-content: space-around;
            background-color: #3498db;
            padding: 15px 0;
            position: fixed;
            top: 0;
            width: 100%;
            z-index: 1000;
        }

        .navbar a {
            color: white;
            text-decoration: none;
            text-align: center;
            padding: 15px 20px;
            border-radius: 10px;
            transition: background-color 0.3s ease, transform 0.2s;
            font-size: 18px;
        }

        .navbar a:hover {
            background-color: #2c3e50;
            transform: scale(1.05);
        }

        .titleDiv {
            margin-top: 100px; /* 增加空间以防止导航栏遮挡标题 */
            background-color: #3498db;
            color: white;
            padding: 20px;
            border-radius: 10px;
            font-size: 32px;
            text-align: center;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            margin-bottom: 30px;
            width: 100%;
            max-width: 800px; /* 增加宽度 */
            margin: 100px auto 30px; /* 更好地处理标题位置 */
        }

        .announcement {
            max-width: 800px;
            margin: 20px auto;
            padding: 15px;
            background-color: #e67e22;
            color: white;
            border-radius: 10px;
            font-size: 18px;
            text-align: center;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }

        @media (max-width: 600px) {
            .navbar {
                flex-direction: column;
                align-items: stretch;
                padding: 10px 0;
            }

            .navbar a {
                font-size: 16px;
                padding: 10px;
            }

            .titleDiv {
                font-size: 24px;
            }

            .announcement {
                font-size: 16px;
            }
        }
    </style>
</head>
<body>
<div class="navbar">
    <a href="addStudent.jsp">添加学生</a>
    <a href="updatePassword.jsp">修改密码</a>
    <a href="ShowStudentsByPageServlet">按学号查询</a>
    <a href="ShowAllStudentsServlet">查看所有学生信息</a>
    <a href="score">查看所有学生成绩</a>
    <a href="leaveRequests">查看请假消息</a>
    <a href="showRequest.jsp">审批请假条</a>
    <a href="viewAbsences">查看旷课记录</a>
    <a href="viewAbscencesExarts.jsp">旷课可视化</a>
    <a href="viewscore.jsp">成绩可视化</a>
    <a href="QuitServlet">退出登录</a>
</div>

<div class="titleDiv">欢迎进入学生信息管理平台</div>

<div class="announcement">
    公告：本系统将于本周五进行维护，请大家提前备份个人信息。如有问题请联系教务处。
</div>

<%
    if(session.getAttribute("login") == null) {
        session.setAttribute("loginErrorMessage", "您必须先登录才能访问主页！");
        response.sendRedirect("index.jsp");
    }
%>
</body>
</html>
