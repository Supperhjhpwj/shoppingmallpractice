<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="dao.myUser" %>

<%
    myUser user = (myUser) session.getAttribute("user");
    System.out.println(user.getRole());
    if (user == null || "USER".equals(user.getRole())) {
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
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Roboto', sans-serif;
            background-color: #f8f9fa; /* 更柔和的背景色 */
            margin: 0;
            padding: 20px;
            display: flex;
            flex-direction: column;
            align-items: center; /* Center items horizontally */
            justify-content: center; /* Center items vertically */
            height: 100vh; /* Full height of the viewport */
        }
        h2 {
            color: #28a745; /* 鲜明的绿色 */
            margin-bottom: 20px; /* Reduced margin for compactness */
            text-shadow: 1px 1px 2px rgba(0, 0, 0, 0.2); /* 文字阴影 */
        }
        nav {
            display: flex;
            flex-direction: column; /* Stack buttons vertically */
            align-items: center; /* Center buttons horizontally */
        }
        a {
            margin: 10px; /* Reduced margin for compactness */
            padding: 12px 20px;
            background-color: #007BFF;
            color: white;
            text-decoration: none;
            border-radius: 5px;
            transition: background-color 0.3s, transform 0.3s; /* 动态效果 */
            font-weight: bold;
            width: 200px; /* Fixed width for buttons */
            text-align: center; /* Center text inside buttons */
        }
        a:hover {
            background-color: #0056b3;
            transform: translateY(-2px); /* 悬停时向上移动 */
        }
        a.logout {
            background-color: #dc3545;
        }
        a.logout:hover {
            background-color: #c82333;
        }
        /* 响应式设计 */
        @media (max-width: 600px) {
            h2 {
                font-size: 24px; /* 调整标题字体大小 */
            }
            a {
                padding: 10px; /* 调整小屏幕上的内边距 */
                width: 100%; /* Full width on small screens */
            }
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
<h2>欢迎管理员: <%= user.getUsername() %></h2>
<nav>
    <a href="manage_products.jsp">管理商品</a>
    <a href="manage_orders.jsp">查看订单</a>
    <a href="customer_manage.jsp">查看现有用户</a>
    <a href="user_activity_log.jsp">查看用户日志</a>
    <a href="salesReport.jsp">查看销售统计报表</a>
    <a href="logout" class="logout">登出</a>
</nav>
<footer>
    &copy; 2024 购物中心 | All rights reserved |华南理工大学 黄劲恒
</footer>
</body>
</html>
