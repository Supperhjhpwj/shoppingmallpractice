<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="dao.myUser" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>修改个人信息</title>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Roboto', sans-serif;
            background-color: #e9ecef;
            margin: 0;
            padding: 20px;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            color: #333;
        }
        h2 {
            text-align: center;
            color: #007BFF;
            margin-bottom: 20px;
            width: 100%;
        }
        .form-container {
            max-width: 500px;
            width: 100%;
            padding: 30px;
            background: white;
            border-radius: 10px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
        }
        label {
            display: block;
            margin: 15px 0 5px;
            color: #555;
            font-weight: 700;
        }
        input[type="text"], input[type="email"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
            transition: border-color 0.3s;
        }
        input[type="text"]:focus, input[type="email"]:focus {
            border-color: #007BFF;
            outline: none;
        }
        button {
            width: 100%;
            padding: 10px;
            background-color: #007BFF;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            transition: background-color 0.3s;
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
            font-weight: 600;
        }
        a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
<div class="form-container">
    <h2>修改个人信息</h2>
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
<%--<footer>--%>
<%--    &copy; 2024 购物中心 | All rights reserved |华南理工大学 黄劲恒--%>
<%--</footer>--%>
</body>
</html>
