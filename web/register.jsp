<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 2024/10/9
  Time: 17:38
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>用户注册</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 20px;
        }
        h2 {
            text-align: center;
            color: #333;
        }
        form {
            max-width: 400px;
            margin: auto;
            padding: 20px;
            background: white;
            border-radius: 5px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }
        label {
            display: block;
            margin-bottom: 5px;
            color: #555;
        }
        input[type="text"],
        input[type="password"],
        input[type="email"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ddd;
            border-radius: 5px;
            box-sizing: border-box;
        }
        input[type="submit"] {
            background-color: #4CAF50;
            color: white;
            padding: 10px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            width: 100%;
        }
        input[type="submit"]:hover {
            background-color: #45a049;
        }
        p {
            text-align: center;
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
</body>
</html>



