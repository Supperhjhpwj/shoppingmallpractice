<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 2024/10/17
  Time: 16:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="dao.myUser" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>个人信息</title>
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
        .info-container {
            max-width: 500px;
            margin: auto;
            padding: 20px;
            background: white;
            border-radius: 5px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }
        p {
            margin: 10px 0;
            font-size: 16px;
            color: #555;
        }
        a {
            display: block;
            text-align: center;
            margin-top: 20px;
            color: #007BFF;
            text-decoration: none;
        }
        a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
<h2>个人信息</h2>
<div class="info-container">
    <%
        myUser user = (myUser) request.getAttribute("user");
    %>
    <p>用户名: <%= user.getUsername() %></p>
    <p>邮箱: <%= user.getEmail() %></p>
    <p>联系电话: <%= user.getPhoneNumber() %></p>
    <p>收货人姓名: <%= user.getRecipientName() %></p>
    <p>收货人地址: <%= user.getShippingAddress() %></p>
</div>
<a href="userDashboard.jsp">返回用户中心</a>
</body>
</html>

