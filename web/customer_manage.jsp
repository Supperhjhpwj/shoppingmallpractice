<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="dao.UserDao" %>
<%@ page import="dao.myUser" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <title>客户管理</title>
    <style>
        /* General styles */
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #eef2f3;
            margin: 0;
            padding: 20px;
            color: #333;
        }
        h2 {
            text-align: center;
            color: #444;
            margin-bottom: 20px;
        }
        table {
            width: 100%;
            max-width: 900px;
            margin: 20px auto;
            border-collapse: collapse;
            background: white;
            border-radius: 8px;
            overflow: hidden;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
        }
        th, td {
            padding: 12px 15px;
            border: none;
            text-align: center;
        }
        th {
            background-color: #007BFF;
            color: white;
            font-weight: bold;
        }
        td {
            background-color: #f9f9f9;
        }
        a {
            color: #007BFF;
            text-decoration: none;
            font-weight: bold;
            display: inline-block; /* 使链接可以设定大小 */
            padding: 6px 10px; /* 调整内边距以缩小链接 */
            border-radius: 4px; /* 增加圆角 */
            transition: background-color 0.3s ease; /* 添加过渡效果 */
            margin: 10px 0; /* 上下留出间距 */
        }
        a:hover {
            background-color: #007BFF; /* 悬停时背景颜色变化 */
            color: white; /* 悬停时字体颜色变化 */
        }
        button {
            background-color: #dc3545;
            color: white;
            border: none;
            padding: 8px 12px; /* 调整按钮大小 */
            cursor: pointer;
            border-radius: 4px;
            transition: background-color 0.3s ease;
            font-size: 14px;
        }
        button:hover {
            background-color: #c82333;
        }
        footer {
            text-align: center;
            margin-top: 20px;
            padding: 15px 0;
            background-color: #f1f1f1;
            border-top: 1px solid #ddd;
        }
        /* Centering links */
        .link-container {
            text-align: center; /* 居中链接 */
        }
        /* Responsive styles */
        @media (max-width: 600px) {
            table {
                width: 100%;
                font-size: 14px;
            }
            button {
                padding: 6px 10px; /* 更小的按钮 */
            }
            a {
                padding: 4px 8px; /* 更小的链接 */
            }
        }
    </style>
</head>
<body>

<h2>客户管理</h2>
<%
    myUser currentUser = (myUser) session.getAttribute("user"); // 假设已存储当前用户信息

    if (currentUser != null && "ADMIN".equals(currentUser.getRole())) {
%>
<!-- 仅 ADMIN 可见的新增管理员用户按钮 -->
<div class="link-container">
    <a href="register_admin.jsp">新增管理员用户</a><br>
</div>
<%
    }
%>

<table>
    <tr>
        <th>用户名</th>
        <th>邮箱</th>
        <th>联系电话</th>
        <th>收件人姓名</th>
        <th>收件人地址</th>
        <th>角色</th>
        <th>操作</th>
    </tr>
    <%
        UserDao userDao = new UserDao();
        List<myUser> users = userDao.getAllUsers(); // 假设有一个方法可以获取所有用户
        if (users != null && !users.isEmpty()) {
            for (myUser user : users) {
    %>
    <tr>
        <td><%= user.getUsername() %></td>
        <td><%= user.getEmail() %></td>
        <td><%= user.getPhoneNumber() %></td>
        <td><%= user.getRecipientName() %></td>
        <td><%= user.getShippingAddress() %></td>
        <td><%= user.getRole() %></td>
        <td>
            <% if ("ADMINSon".equals(user.getRole()) && "ADMIN".equals(currentUser.getRole())) { %>
            <form action="delete_user" method="post" style="display:inline;">
                <input type="hidden" name="userName" value="<%= user.getUsername() %>">
                <button type="submit" onclick="return confirm('确定要删除该用户吗?')">删除</button>
            </form>
            <% } else { %>
            <span>不可删除</span>
            <% } %>
        </td>
    </tr>
    <%
        }
    } else {
    %>
    <tr>
        <td colspan="7">暂无注册用户。</td>
    </tr>
    <%
        }
    %>
</table>

<div class="link-container">
    <a href="admin_dashboard.jsp">返回管理员首页</a>
</div>
<footer>
    &copy; 2024 购物中心 | All rights reserved | 华南理工大学 黄劲恒
</footer>
</body>
</html>
