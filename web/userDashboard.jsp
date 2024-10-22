<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 2024/10/13
  Time: 17:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>用户中心</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f9f9f9;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            height: 100vh;
            margin: 0;
        }
        h2 {
            color: #333;
        }
        p {
            color: #555;
        }
        a {
            background-color: #4CAF50;
            color: white;
            padding: 10px 20px;
            text-decoration: none;
            border-radius: 5px;
            margin: 10px 0;
            transition: background-color 0.3s;
        }
        a:hover {
            background-color: #45a049;
        }
        .link-container {
            text-align: center;
        }
    </style>
</head>
<body>
<h2>欢迎用户!</h2>
<p>欢迎访问购物中心。</p>
<div class="link-container">
    <a href="shop">浏览商品</a>
    <a href="view_orders">查看我的订单</a>
    <a href="cart.jsp">查看购物车</a>
    <a href="view_profile">查看个人信息</a> <!-- 新增链接 -->
    <a href="edit_profile">修改个人信息</a> <!-- 新增链接 -->
    <a href="logout">登出</a>
</div>
</body>
</html>



