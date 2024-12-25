<%@ page import="com.student.po.Score" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>学生成绩</title>
    <link rel="stylesheet" href="styles.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 20px;
        }
        h1 {
            text-align: center;
            color: #333;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin: 20px 0;
        }
        th, td {
            padding: 12px;
            text-align: center;
            border: 1px solid #ccc;
            background-color: #fff;
        }
        th {
            background-color: #4CAF50;
            color: white;
        }
        tr:nth-child(even) {
            background-color: #f2f2f2;
        }
        tr:hover {
            background-color: #ddd;
        }
        @media (max-width: 600px) {
            table, thead, tbody, th, td, tr {
                display: block;
                width: 100%;
            }
            th, td {
                text-align: left;
                position: relative;
            }
            td::before {
                content: attr(data-label);
                position: absolute;
                left: 0;
                width: 50%;
                padding-left: 10px;
                font-weight: bold;
                text-align: left;
            }
        }
    </style>
</head>
<body>
<h1>学生成绩</h1>
<table>
    <thead>
    <tr>
        <th>学号</th>
        <th>姓名</th>
        <th>语文成绩</th>
        <th>数学成绩</th>
        <th>英语成绩</th>
        <th>总分</th>
    </tr>
    </thead>
    <tbody>
    <%
        List<Score> scores = (List<Score>) request.getAttribute("scores");
        for (Score score : scores) {
    %>
    <tr>
        <td data-label="学号"><%= score.getSno() %></td>
        <td data-label="姓名"><%= score.getSname() %></td>
        <td data-label="语文成绩"><%= score.getChineseScore() %></td>
        <td data-label="数学成绩"><%= score.getMathScore() %></td>
        <td data-label="英语成绩"><%= score.getEnglishScore() %></td>
        <td data-label="总分"><%= score.getTotalScore() %></td>
    </tr>
    <%
        }
    %>
    </tbody>
</table>
</body>
</html>
