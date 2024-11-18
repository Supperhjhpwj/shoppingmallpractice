<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>用户中心</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(270deg, #f0f4f8, #e2e9f4);
            background-size: 400% 400%;
            animation: gradient 15s ease infinite;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            height: 100vh;
            margin: 0;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
        }

        @keyframes gradient {
            0% { background-position: 0% 50%; }
            50% { background-position: 100% 50%; }
            100% { background-position: 0% 50%; }
        }

        h2 {
            color: #343a40;
            margin-bottom: 20px;
            font-size: 2.5em;
            text-shadow: 1px 1px 2px rgba(0, 0, 0, 0.1);
        }
        p {
            color: #495057;
            margin-bottom: 30px;
            font-size: 1.5em;
            text-align: center;
        }
        .link-container {
            display: flex;
            flex-direction: column;
            align-items: center;
        }
        a {
            background-color: #28a745;
            color: white;
            padding: 15px 30px;
            text-decoration: none;
            border-radius: 25px;
            margin: 10px 0;
            font-size: 1.2em;
            transition: background-color 0.3s, transform 0.3s;
            width: 220px;
            text-align: center;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
            border: 1px solid transparent;
        }
        a:hover {
            background-color: #218838;
            transform: translateY(-2px);
            border-color: #1e7e34;
        }
        @media (max-width: 600px) {
            a {
                width: 80%;
            }
        }
        footer {
            position: absolute;
            bottom: 20px;
            font-size: 0.9em;
            color: #6c757d;
        }
    </style>
</head>
<body>
<h2>欢迎用户!</h2>
<p>欢迎来到您的购物中心，探索无尽的购物乐趣。</p>
<div class="link-container">
    <a href="shop">浏览商品</a>
    <a href="view_orders">查看我的订单</a>
    <a href="cart.jsp">查看购物车</a>
    <a href="view_profile">查看个人信息</a>
    <a href="edit_profile">修改个人信息</a>
    <a href="logout">登出</a>
</div>
<footer>
    &copy; 2024 购物中心 | All rights reserved |华南理工大学 黄劲恒
</footer>
</body>
</html>
