<%--&lt;%&ndash;--%>
<%--  Created by IntelliJ IDEA.--%>
<%--  User: ASUS--%>
<%--  Date: 2024/10/13--%>
<%--  Time: 19:24--%>
<%--  To change this template use File | Settings | File Templates.--%>
<%--&ndash;%&gt;--%>
<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>
<%--<!-- shop.index.jsp -->--%>
<%--<%@ page contentType="text/html;charset=UTF-8" %>--%>
<%--<%@ page import="dao.Product" %>--%>
<%--<%@ page import="java.util.List" %>--%>
<%--<!-- shop.index.jsp -->--%>
<%--<%@ page contentType="text/html;charset=UTF-8" %>--%>
<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>
<%--<%@ page import="dao.Product" %>--%>
<%--<%@ page import="java.util.List" %>--%>
<%--<!DOCTYPE html>--%>
<%--<html>--%>
<%--<head>--%>
<%--    <title>商品列表</title>--%>
<%--</head>--%>
<%--<body>--%>
<%--<h2>可购买的商品</h2>--%>
<%--<table border="1">--%>
<%--    <thead>--%>
<%--    <tr>--%>
<%--        <th>商品编号</th>--%>
<%--        <th>商品名称</th>--%>
<%--        <th>价格</th>--%>
<%--        <th>描述</th>--%>
<%--        <th>库存</th>--%>
<%--        <th>操作</th>--%>
<%--    </tr>--%>
<%--    </thead>--%>
<%--    <tbody>--%>
<%--    <%--%>
<%--        List<Product> products = (List<Product>) request.getAttribute("products");--%>
<%--        for (Product product : products) {--%>
<%--    %>--%>
<%--    <tr>--%>
<%--        <td><%= product.getId() %></td>--%>
<%--        <td><%= product.getName() %></td>--%>
<%--        <td><%= product.getPrice() %></td>--%>
<%--        <td><%= product.getDescription() %></td>--%>
<%--        <td><%= product.getStock() %></td>--%>
<%--        <td>--%>
<%--            <!-- 为每个商品单独创建一个表单 -->--%>
<%--            <form action="cart" method="post">--%>
<%--                <input type="hidden" name="id" value="<%= product.getId() %>">--%>
<%--                <input type="hidden" name="name" value="<%= product.getName() %>">--%>
<%--                <input type="hidden" name="price" value="<%= product.getPrice() %>">--%>
<%--                <input type="hidden" name="stock" value="<%= product.getStock() %>">--%>
<%--                <button type="submit">加入购物车</button>--%>
<%--            </form>--%>
<%--        </td>--%>
<%--    </tr>--%>
<%--    <%--%>
<%--        }--%>
<%--    %>--%>
<%--    </tbody>--%>
<%--</table>--%>
<%--<a href="userDashboard.jsp">返回首页</a>--%>
<%--</body>--%>
<%--</html>--%>

<<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="dao.Product" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>商品列表</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f0f0;
            margin: 0;
            padding: 20px;
        }
        h2 {
            color: #333;
            text-align: center;
            margin-bottom: 20px;
        }
        form {
            text-align: center;
            margin-bottom: 20px;
        }
        input[type="text"] {
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            width: 250px;
            margin-right: 10px;
        }
        button {
            padding: 10px 15px;
            border: none;
            border-radius: 5px;
            background-color: #4CAF50;
            color: white;
            cursor: pointer;
            font-size: 16px;
        }
        button:hover {
            background-color: #45a049;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            background-color: white;
        }
        th, td {
            padding: 12px;
            text-align: left;
            border: 1px solid #ddd;
        }
        th {
            background-color: #f2f2f2;
            color: #333;
        }
        tr:nth-child(even) {
            background-color: #f9f9f9;
        }
        tr:hover {
            background-color: #f1f1f1;
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
<h2>可购买的商品</h2>

<!-- 添加搜索表单 -->
<form action="searchProducts" method="get">
    <input type="text" name="query" placeholder="输入商品名称搜索" required>
    <button type="submit">搜索</button>
</form>

<!-- 添加显示所有商品的按钮 -->
<form action="showAllProducts" method="get">
    <button type="submit">显示所有商品</button>
</form>

<table>
    <thead>
    <tr>
        <th>商品编号</th>
        <th>商品名称</th>
        <th>价格</th>
        <th>描述</th>
        <th>库存</th>
        <th>操作</th>
    </tr>
    </thead>
    <tbody>
    <%
        List<Product> products = (List<Product>) request.getAttribute("products");
        if (products != null && !products.isEmpty()) {
            for (Product product : products) {
    %>
    <tr>
        <td><%= product.getId() %></td>
        <td><%= product.getName() %></td>
        <td><%= product.getPrice() %></td>
        <td><%= product.getDescription() %></td>
        <td><%= product.getStock() %></td>
        <td>
            <form action="cart" method="post" style="display: inline;">
                <input type="hidden" name="id" value="<%= product.getId() %>">
                <input type="hidden" name="name" value="<%= product.getName() %>">
                <input type="hidden" name="price" value="<%= product.getPrice() %>">
                <input type="hidden" name="stock" value="<%= product.getStock() %>">
                <button type="submit">加入购物车</button>
            </form>
        </td>
    </tr>
    <%
        }
    } else {
    %>
    <tr>
        <td colspan="6">没有找到相关商品</td>
    </tr>
    <%
        }
    %>
    </tbody>
</table>
<a href="userDashboard.jsp">返回首页</a>
</body>
</html>


