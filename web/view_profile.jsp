<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="dao.myUser" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>个人信息</title>
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
        .info-container {
            max-width: 600px;
            width: 100%;
            padding: 30px;
            background: white;
            border-radius: 10px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s, box-shadow 0.3s;
        }
        .info-container:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 30px rgba(0, 0, 0, 0.2);
        }
        p {
            margin: 15px 0;
            font-size: 18px;
            color: #555;
            border-bottom: 1px solid #f0f0f0;
            padding-bottom: 10px;
        }
        a {
            display: block;
            text-align: center;
            margin-top: 20px;
            padding: 10px 15px;
            background-color: #007BFF;
            color: white;
            text-decoration: none;
            border-radius: 5px;
            transition: background-color 0.3s;
        }
        a:hover {
            background-color: #0056b3;
        }
        footer {
            text-align: center;
            margin-top: 20px;
            padding: 10px 0;
            background-color: #f1f1f1;
            border-top: 1px solid #ddd;
            position: relative; /* 确保页脚位置正确 */
            clear: both; /* 防止被浮动内容覆盖 */
            bottom: 0; /* 固定在页面底部 */
            width: 100%; /* 确保宽度 */
        }


    </style>
</head>
<body>
<div class="info-container">
    <h2>个人信息</h2>
    <%
        myUser user = (myUser) request.getAttribute("user");
    %>
    <p>用户名: <%= user.getUsername() %></p>
    <p>邮箱: <%= user.getEmail() %></p>
    <p>联系电话: <%= user.getPhoneNumber() %></p>
    <p>收货人姓名: <%= user.getRecipientName() %></p>
    <p>收货人地址: <%= user.getShippingAddress() %></p>
    <a href="userDashboard.jsp">返回用户中心</a>
</div>
<%--<footer>--%>
<%--    &copy; 2024 购物中心 | All rights reserved |华南理工大学 黄劲恒--%>
<%--</footer>--%>
</body>
</html>
