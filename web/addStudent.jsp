<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>添加学生信息</title>
    <style>
        /* 通用样式 */
        body {
            font-family: 'Arial', sans-serif;
            background-color: #e0f7fa; /* 天蓝色背景 */
            margin: 0;
            padding: 0;
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100vh;
        }

        /* 标题方块样式 */
        .titleDiv {
            text-align: center;
            font-size: 36px;
            color: #ffffff; /* 白色字体 */
            background-color: #0097a7; /* 深天蓝色背景 */
            padding: 20px 0;
            border-radius: 10px 10px 0 0;
            width: 100%;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }

        /* 主框样式 */
        .mainDiv {
            width: 100%;
            max-width: 600px;
            border-radius: 10px;
            background-color: #ffffff; /* 白色背景 */
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2);
            overflow: hidden; /* 清除内部浮动 */
        }

        /* 添加信息的框样式 */
        .addDiv {
            padding: 40px;
        }

        /* 名称样式 */
        .name {
            font-size: 24px;
            color: #0097a7; /* 深天蓝色文本颜色 */
            margin-bottom: 30px;
            text-align: center;
        }

        /* 表单项样式 */
        .item {
            margin-bottom: 20px;
        }

        .item input {
            width: 100%;
            padding: 15px;
            border: 2px solid #0097a7; /* 深天蓝色边框 */
            border-radius: 5px;
            outline: none;
            transition: border-color 0.3s;
            font-size: 16px;
        }

        /* 输入框聚焦的样式 */
        .item input:focus {
            border-color: #006064; /* 更深的天蓝色 */
        }

        /* 提交按钮样式 */
        .btn {
            width: 100%;
            padding: 15px;
            color: white;
            background: #0097a7; /* 深天蓝色背景 */
            font-size: 16px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background 0.3s;
        }

        .btn:hover {
            background: #006064; /* 更深的天蓝色 */
        }

        /* 返回链接样式 */
        a {
            display: block;
            font-size: 18px;
            text-align: center;
            padding: 10px;
            color: #0097a7; /* 深天蓝色文本颜色 */
            margin-top: 20px;
            text-decoration: none;
        }

        a:hover {
            text-decoration: underline;
            color: #006064; /* 更深的天蓝色 */
        }

        /* 响应式设计 */
        @media (max-width: 600px) {
            .mainDiv {
                padding: 10px;
            }

            .name {
                font-size: 20px;
            }

            .btn {
                padding: 12px;
                font-size: 14px;
            }
        }
    </style>
</head>

<body>
<div class="mainDiv">
    <div class="titleDiv">教务管理平台</div>
    <form action="AddServlet">
        <div class="addDiv">
            <div class="name">添加学生信息</div>

            <div class="item">
                <input type="text" name="sno" placeholder="学号" required />
            </div>
            <div class="item">
                <input type="text" name="sname" placeholder="姓名" required />
            </div>
            <div class="item">
                <input type="text" name="sex" placeholder="性别" required />
            </div>
            <div class="item">
                <input type="number" name="age" placeholder="年龄" required min="1" max="120" />
            </div>
            <div class="item">
                <input type="tel" name="phone" placeholder="电话" required pattern="[0-9]{11}" />
            </div>
            <input type="submit" class="btn" value="添加" />
            <a href="main.jsp">返回</a>
        </div>
    </form>
</div>
</body>
</html>