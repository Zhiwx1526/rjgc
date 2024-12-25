<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>注册账号</title>
    <style>
        body {
            /* 添加背景图片 */
            background-image: url('背景.jpg');
            background-repeat: no-repeat;
            background-size: cover;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
        }

        .mainDiv {
            width: 80%;
            max-width: 1200px;
            height: auto;
            border: 4px solid #ddd;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            display: flex;
            flex-direction: column;
            align-items: center;
            padding: 20px;
            box-sizing: border-box;
        }

        .titleDiv {
            height: auto;
            color: #333;
            font-size: 2em;
            text-align: center;
            margin-bottom: 20px;
            font-family: 'Times New Roman', serif;
        }

        .registerDiv {
            width: 100%;
            max-width: 600px;
            padding: 30px;
            background-color: rgba(255, 255, 255, 0.9);
            border-radius: 10px;
            border: 1px solid #ccc;
            box-shadow: 0 0 5px rgba(0, 0, 0, 0.1);
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        .name {
            font-size: 1.5em;
            color: #555;
            text-align: center;
            margin-bottom: 20px;
        }

        .item {
            width: 100%;
            margin-bottom: 15px;
        }

        .item input {
            width: 100%;
            height: 40px;
            border: 1px solid #aaa;
            border-radius: 5px;
            padding: 5px 10px;
            font-size: 1em;
        }

        .btn {
            width: 100%;
            height: 50px;
            color: #fff;
            background: #007BFF;
            font-size: 1em;
            line-height: 30px;
            text-align: center;
            border-radius: 5px;
            border: none;
            margin-top: 10px;
            cursor: pointer;
        }

        .btn:hover {
            background: #0056b3;
        }

        a {
            font-size: 1em;
            color: #007BFF;
            text-decoration: none;
            margin-top: 20px;
            text-align: center;
        }

        a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
<div class="mainDiv">
    <div class="titleDiv">学生信息管理平台</div>
    <form action="RegisterServlet">
        <div class="registerDiv">
            <div class="name">用户注册</div>
            <div class="item">
                <input type="text" name="uid" placeholder="账号" required />
            </div>
            <div class="item">
                <input type="password" name="pwd" placeholder="密码" required />
            </div>
            <div class="item">
                <input type="email" name="email" placeholder="邮箱地址" required />
            </div>
            <input type="submit" class="btn" value="注册" />
            <a href="index.jsp">返回</a>
        </div>
    </form>
</div>
</body>
</html>
