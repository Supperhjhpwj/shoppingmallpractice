<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 2024/10/17
  Time: 16:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="dao.myUser" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>修改个人信息</title>
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
        .form-container {
            max-width: 500px;
            margin: auto;
            padding: 20px;
            background: white;
            border-radius: 5px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }
        label {
            display: block;
            margin: 10px 0 5px;
            color: #555;
        }
        input[type="text"], input[type="email"] {
            width: 100%;
            padding: 8px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }
        button {
            width: 100%;
            padding: 10px;
            background-color: #007BFF;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        button:hover {
            background-color: #0056b3;
        }
        a {
            display: block;
            text-align: center;
            margin-top: 15px;
            color: #007BFF;
            text-decoration: none;
        }
        a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
<h2>修改个人信息</h2>
<div class="form-container">
    <%
        myUser user = (myUser) request.getAttribute("user");
    %>
    <form action="edit_profile" method="post">
        <label for="username">用户名:</label>
        <input type="text" id="username" name="username" value="<%= user.getUsername() %>" readonly required>

        <label for="password">密码:</label>
        <input type="text" id="password" name="password" value="<%= user.getPassword() %>" required>

        <label for="email">邮箱:</label>
        <input type="email" id="email" name="email" value="<%= user.getEmail() %>" required>

        <label for="phone">联系电话:</label>
        <input type="text" id="phone" name="phone" value="<%= user.getPhoneNumber() %>" required>

        <label for="recipientName">收货人姓名:</label>
        <input type="text" id="recipientName" name="recipientName" value="<%= user.getRecipientName() %>" required>

        <label for="shippingAddress">收货人地址:</label>
        <input type="text" id="shippingAddress" name="shippingAddress" value="<%= user.getShippingAddress() %>" required>

        <button type="submit">保存修改</button>
    </form>
    <a href="view_profile">取消</a>
</div>
</body>
</html>

