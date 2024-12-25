<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login Page</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            background-color: #f8f9fa;
            font-family: Arial, sans-serif;
            background-size: cover;
        }

        .login-container {
            width: 400px;
            padding: 40px;
            background-color: rgba(255, 255, 255, 0.9);
            border-radius: 10px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
            text-align: center;
        }

        .login-title {
            font-size: 28px;
            font-weight: bold;
            color: #333333;
            margin-bottom: 30px;
            letter-spacing: 1px;
        }

        .form-input {
            width: 100%;
            padding: 12px;
            margin-bottom: 15px;
            border: 1px solid #ced4da;
            border-radius: 5px;
            font-size: 16px;
        }

        .form-submit {
            width: 100%;
            padding: 12px;
            background-color: #007bff;
            color: #ffffff;
            font-size: 16px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .form-submit:hover {
            background-color: #0056b3;
        }

        .register-link {
            margin-top: 20px;
            font-size: 14px;
        }

        .register-link a {
            color: #007bff;
            text-decoration: none;
            transition: color 0.3s;
        }

        .register-link a:hover {
            color: #0056b3;
        }

        .error-message {
            color: #dc3545;
            margin-top: 10px;
            font-weight: bold;
        }

        .success-message {
            color: #28a745;
            margin-top: 10px;
            font-weight: bold;
        }

    </style>
</head>
<body>
<div class="login-container">
    <div class="login-title">用户登录</div>
    <form action="LoginServlet" method="post">
        <input type="text" name="uid" class="form-input" placeholder="用户名" required>
        <input type="password" name="pwd" class="form-input" placeholder="密码" required>
        <input type="text" name="captcha" class="form-input" placeholder="验证码" required>
        <img src="CaptchaServlet" alt="验证码" style="margin-bottom: 15px; display: block; max-width: 100%;">
        <button type="submit" class="form-submit">登录</button>
    </form>
    <div class="register-link">
        <a href="register.jsp">还没有账号？立即注册</a>
    </div>

    <%
        if (session.getAttribute("loginErrorMessage") != null) {
            String loginErrorMessage = (String) session.getAttribute("loginErrorMessage");
            out.print("<div class='error-message'>" + loginErrorMessage + "</div>");
        }
    %>
    <%
        String register = (String) request.getAttribute("register");
        if (register != null) {
            if (register.equals("reg")) {
                out.print("<div class='success-message'>注册成功，请登录！</div>");
            }
        }
    %>
</div>
</body>
</html>