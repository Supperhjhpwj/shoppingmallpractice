<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>用户注册</title>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Roboto', sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh; /* 使内容垂直居中 */
        }
        .container {
            max-width: 400px;
            width: 100%; /* 让表单在小屏幕上也能适应 */
            padding: 30px;
            background: white;
            border-radius: 10px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
            text-align: center; /* 使表单内容居中 */
        }
        h2 {
            color: #333;
            margin-bottom: 20px;
        }
        label {
            display: block;
            margin-bottom: 5px;
            color: #555;
            text-align: left; /* 标签左对齐 */
        }
        input[type="text"],
        input[type="password"],
        input[type="email"] {
            width: 100%;
            padding: 12px;
            margin-bottom: 15px;
            border: 1px solid #ddd;
            border-radius: 5px;
            box-sizing: border-box;
            transition: border-color 0.3s; /* 平滑的边框颜色变化 */
        }
        input[type="text"]:focus,
        input[type="password"]:focus,
        input[type="email"]:focus {
            border-color: #4CAF50; /* 聚焦时改变边框颜色 */
        }
        input[type="submit"] {
            background-color: #4CAF50;
            color: white;
            padding: 12px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            width: 100%;
            transition: background-color 0.3s, transform 0.3s; /* 动态效果 */
        }
        input[type="submit"]:hover {
            background-color: #45a049;
            transform: translateY(-2px); /* 悬停时向上移动 */
        }
        p {
            margin-top: 20px;
        }
        a {
            color: #007BFF;
            text-decoration: none;
        }
        a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
<div class="container">
    <h2>注册新用户</h2>
    <form action="register" method="post">
        <label for="username">用户名:</label>
        <input type="text" id="username" name="username" required>

        <label for="password">密码:</label>
        <input type="password" id="password" name="password" required>

        <label for="email">邮箱:</label>
        <input type="email" id="email" name="email" required>

        <label for="phoneNumber">电话:</label>
        <input type="text" id="phoneNumber" name="phoneNumber" required>

        <label for="recipientName">收货人姓名:</label>
        <input type="text" id="recipientName" name="recipientName" required>

        <label for="shippingAddress">收货地址:</label>
        <input type="text" id="shippingAddress" name="shippingAddress" required>

        <input type="submit" value="注册">
    </form>

    <p>已经有账号？<a href="login.jsp">点击登录</a></p>
</div>
<%--<footer>--%>
<%--    &copy; 2024 购物中心 | All rights reserved |华南理工大学 黄劲恒--%>
<%--</footer>--%>
</body>
</html>
