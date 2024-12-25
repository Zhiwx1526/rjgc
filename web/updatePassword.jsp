<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh">
<head>
    <meta charset="UTF-8">
    <title>修改密码</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #e0f7fa; /* 背景色为淡蓝色 */
            color: #4fc3f7; /* 浅蓝色 */
            margin: 0;
            padding: 20px;
        }
        h2 {
            color: #81d4fa; /* 更浅的蓝色 */
            text-align: center;
        }
        form {
            max-width: 400px;
            margin: 20px auto;
            background-color: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s ease;
        }
        form:hover {
            transform: scale(1.02); /* 悬停效果 */
        }
        label {
            display: block;
            margin-bottom: 10px;
            color: #4fc3f7; /* 浅蓝色 */
            font-weight: bold;
        }
        input[type="text"],
        input[type="password"],
        input[type="submit"] {
            width: 100%;
            padding: 12px;
            margin-bottom: 15px;
            border: 2px solid #4fc3f7; /* 浅蓝色边框 */
            border-radius: 5px;
            box-sizing: border-box;
            font-size: 16px;
            transition: border-color 0.3s;
        }
        input[type="text"]:focus,
        input[type="password"]:focus {
            border-color: #81d4fa; /* 获取焦点时的边框颜色为更浅的蓝色 */
            outline: none;
        }
        input[type="submit"] {
            background-color: #4fc3f7; /* 浅蓝色按钮 */
            color: white;
            cursor: pointer;
            font-weight: bold;
        }
        input[type="submit"]:hover {
            background-color: #29b6f6; /* 悬停时更深的浅蓝色 */
        }
    </style>
</head>
<body>
<h2>修改密码表单</h2>
<form action="UpdatePasswordServlet" method="post">
    <label for="uid">账号:</label>
    <input type="text" id="uid" name="uid" required><br>

    <label for="oldPwd">旧密码:</label>
    <input type="password" id="oldPwd" name="oldPwd" required><br>

    <label for="newPwd">新密码:</label>
    <input type="password" id="newPwd" name="newPwd" required><br>

    <input type="submit" value="更新密码">
</form>
</body>
</html>