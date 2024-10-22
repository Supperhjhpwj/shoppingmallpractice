<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 2024/10/13
  Time: 16:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="dao.myUser" %>

<%
    myUser user = (myUser) session.getAttribute("user");
    if (user == null || !"ADMIN".equals(user.getRole())) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>管理员面板</title>
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
        nav {
            text-align: center;
            margin: 20px 0;
        }
        a {
            display: inline-block;
            margin: 10px 20px;
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
        a.logout {
            background-color: #dc3545;
        }
        a.logout:hover {
            background-color: #c82333;
        }
    </style>
</head>
<body>
<h2>欢迎管理员: <%= user.getUsername() %></h2>
<nav>
    <a href="manage_products.jsp">管理商品</a>
    <a href="manage_orders.jsp">查看订单</a>
    <a href="user_activity_log.jsp">查看用户日志</a>
    <a href="salesReport.jsp">查看销售统计报表</a>
    <a href="logout" class="logout">登出</a>
</nav>
</body>
</html>

