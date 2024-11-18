<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>用户登录</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(to right, #6a11cb, #2575fc);
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            color: white;
            position: relative;
            overflow: hidden;
        }
        .login-container {
            background: rgba(255, 255, 255, 0.9);
            border-radius: 15px;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.2);
            padding: 30px;
            width: 350px;
            text-align: center;
            z-index: 2; /* 确保登录框在动态文字之上 */
        }
        h2 {
            margin-bottom: 20px;
            font-size: 2em;
            color: #333;
            text-shadow: 1px 1px 3px rgba(0, 0, 0, 0.2);
        }
        label {
            display: block;
            margin-bottom: 8px;
            color: #555;
            font-weight: bold;
        }
        input[type="text"],
        input[type="password"] {
            width: 100%;
            padding: 12px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 10px;
            box-sizing: border-box;
            transition: border-color 0.3s;
        }
        input[type="text"]:focus,
        input[type="password"]:focus {
            border-color: #6a11cb;
            outline: none;
        }
        input[type="submit"] {
            background-color: #28a745;
            color: white;
            border: none;
            padding: 12px;
            border-radius: 10px;
            cursor: pointer;
            width: 100%;
            font-size: 16px;
            transition: background-color 0.3s, transform 0.3s;
        }
        input[type="submit"]:hover {
            background-color: #218838;
            transform: translateY(-2px);
        }
        p {
            margin-top: 15px;
            color: #333;
        }
        a {
            color: #007BFF;
            text-decoration: none;
            transition: color 0.3s;
        }
        a:hover {
            color: #0056b3;
            text-decoration: underline;
        }
        .dynamic-text {
            position: absolute;
            top: 20px; /* 调整为页面顶部 */
            left: 50%;
            transform: translate(-50%, 0);
            font-size: 3em;
            color: rgba(255, 255, 255, 0.2);
            white-space: nowrap;
            overflow: hidden;
            animation: slide 10s linear infinite;
        }
        @keyframes slide {
            0% { transform: translate(-50%, 0) translateX(-100%); }
            100% { transform: translate(-50%, 0) translateX(100%); }
        }
    </style>
</head>
<body>
<div class="dynamic-text">欢迎登录购物网站</div>
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
