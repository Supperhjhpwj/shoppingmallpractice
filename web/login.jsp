<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 2024/10/9
  Time: 17:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--<!DOCTYPE html>--%>
<%--<html>--%>
<%--<head>--%>
<%--    <meta charset="UTF-8">--%>
<%--    <title>用户登录</title>--%>
<%--    <style>--%>
<%--        body {--%>
<%--            font-family: Arial, sans-serif;--%>
<%--            margin: 50px;--%>
<%--            padding: 20px;--%>
<%--            border: 1px solid #ccc;--%>
<%--            border-radius: 5px;--%>
<%--            width: 300px;--%>
<%--            margin: auto;--%>
<%--        }--%>
<%--        input[type="text"], input[type="password"] {--%>
<%--            width: 100%;--%>
<%--            padding: 10px;--%>
<%--            margin: 5px 0 15px 0;--%>
<%--            border: 1px solid #ccc;--%>
<%--            border-radius: 3px;--%>
<%--        }--%>
<%--        input[type="submit"] {--%>
<%--            background-color: #4CAF50;--%>
<%--            color: white;--%>
<%--            padding: 10px;--%>
<%--            border: none;--%>
<%--            border-radius: 3px;--%>
<%--            cursor: pointer;--%>
<%--            width: 100%;--%>
<%--        }--%>
<%--        input[type="submit"]:hover {--%>
<%--            background-color: #45a049;--%>
<%--        }--%>
<%--    </style>--%>
<%--</head>--%>
<%--<body>--%>

<%--<h2>用户登录</h2>--%>
<%--<form action="login" method="post">--%>
<%--    <label for="username">用户名:</label>--%>
<%--    <input type="text" id="username" name="username" required>--%>

<%--    <label for="password">密码:</label>--%>
<%--    <input type="password" id="password" name="password" required>--%>

<%--    <input type="submit" value="登录">--%>
<%--</form>--%>

<%--<p>没有账户? <a href="register.jsp">注册</a></p>--%>

<%--</body>--%>
<%--</html>--%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>用户登录</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f0f0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        .login-container {
            text-align: center;
        }
        h2 {
            color: #333;
            margin-bottom: 20px;
        }
        form {
            background: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            width: 300px;
            margin: 0 auto;
        }
        label {
            display: block;
            margin-bottom: 5px;
            color: #555;
        }
        input[type="text"],
        input[type="password"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
        }
        input[type="submit"] {
            background-color: #4CAF50;
            color: white;
            border: none;
            padding: 10px;
            border-radius: 5px;
            cursor: pointer;
            width: 100%;
            font-size: 16px;
        }
        input[type="submit"]:hover {
            background-color: #45a049;
        }
        p {
            text-align: center;
            margin-top: 15px;
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
<div class="login-container">
    <h2>用户登录</h2>
    <form action="login" method="post">
        <label for="username">用户名:</label>
        <input type="text" id="username" name="username" required>

        <label for="password">密码:</label>
        <input type="password" id="password" name="password" required>

        <input type="submit" value="登录">
    </form>

    <p>还没有账号？<a href="register.jsp">点击注册</a></p>
</div>
</body>
</html>




