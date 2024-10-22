<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 2024/10/14
  Time: 15:21
  To change this template use File | Settings | File Templates.
--%>
<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>

<%--<%@ page import="dao.ProductDao" %>--%>
<%--<%@ page import="dao.Product" %>--%>
<%--<%@ page import="java.util.List" %>--%>
<%--<!DOCTYPE html>--%>
<%--<html lang="en">--%>
<%--<head>--%>
<%--    <meta charset="UTF-8">--%>
<%--    <title>商品管理</title>--%>
<%--</head>--%>
<%--<body>--%>
<%--<h2>商品管理</h2>--%>

<%--<!-- 商品列表 -->--%>
<%--<table border="1">--%>
<%--    <thead>--%>
<%--    <tr>--%>
<%--        <th>编号</th>--%>
<%--        <th>名称</th>--%>
<%--        <th>价格</th>--%>
<%--        <th>描述</th>--%>
<%--        <th>库存</th>--%>
<%--        <th>操作</th>--%>
<%--    </tr>--%>
<%--    </thead>--%>
<%--    <tbody>--%>
<%--    <%--%>
<%--        ProductDao productDao = new ProductDao();--%>
<%--        List<Product> products = productDao.getAllProducts();--%>
<%--        for (Product product : products) {--%>
<%--    %>--%>
<%--    <tr>--%>
<%--        <td><%= product.getId() %></td>--%>
<%--        <td><%= product.getName() %></td>--%>
<%--        <td><%= product.getPrice() %></td>--%>
<%--        <td><%= product.getDescription() %></td>--%>
<%--        <td><%= product.getStock() %></td>--%>
<%--        <td>--%>
<%--            <a href="edit_product.jsp?id=<%= product.getId() %>">编辑</a> |--%>
<%--            <a href="delete_product?id=<%= product.getId() %>" onclick="return confirm('确定要删除该商品吗?')">删除</a>--%>
<%--        </td>--%>
<%--    </tr>--%>
<%--    <%--%>
<%--        }--%>
<%--    %>--%>
<%--    </tbody>--%>
<%--</table>--%>

<%--<!-- 添加新商品 -->--%>
<%--<h3>添加新商品</h3>--%>
<%--<form action="add_product" method="post">--%>
<%--    名称: <input type="text" name="name" required><br>--%>
<%--    价格: <input type="text" name="price" required><br>--%>
<%--    描述: <input type="text" name="description"><br>--%>
<%--    库存: <input type="number" name="stock" required><br>--%>
<%--    <button type="submit">添加商品</button>--%>
<%--</form>--%>
<%--</body>--%>
<%--</html>--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="dao.ProductDao" %>
<%@ page import="dao.Product" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>商品管理</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f8f9fa;
            margin: 0;
            padding: 20px;
        }
        h2 {
            color: #343a40;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }
        th, td {
            padding: 10px;
            border: 1px solid #dee2e6;
            text-align: left;
        }
        th {
            background-color: #007bff;
            color: white;
        }
        tr:nth-child(even) {
            background-color: #f2f2f2;
        }
        tr:hover {
            background-color: #e9ecef;
        }
        a {
            color: #007bff;
            text-decoration: none;
        }
        a:hover {
            text-decoration: underline;
        }
        form {
            background-color: #ffffff;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
        }
        input[type="text"], input[type="number"] {
            width: calc(100% - 20px);
            padding: 10px;
            margin: 5px 0;
            border: 1px solid #ced4da;
            border-radius: 4px;
        }
        button {
            background-color: #007bff;
            color: white;
            padding: 10px 15px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        button:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
<h2>商品管理</h2>

<!-- 商品列表 -->
<table>
    <thead>
    <tr>
        <th>编号</th>
        <th>名称</th>
        <th>价格</th>
        <th>描述</th>
        <th>库存</th>
        <th>操作</th>
    </tr>
    </thead>
    <tbody>
    <%
        ProductDao productDao = new ProductDao();
        List<Product> products = productDao.getAllProducts();
        for (Product product : products) {
    %>
    <tr>
        <td><%= product.getId() %></td>
        <td><%= product.getName() %></td>
        <td><%= product.getPrice() %></td>
        <td><%= product.getDescription() %></td>
        <td><%= product.getStock() %></td>
        <td>
            <a href="edit_product.jsp?id=<%= product.getId() %>">编辑</a> |
            <a href="delete_product?id=<%= product.getId() %>" onclick="return confirm('确定要删除该商品吗?')">删除</a>
        </td>
    </tr>
    <%
        }
    %>
    </tbody>
</table>

<!-- 添加新商品 -->
<h3>添加新商品</h3>
<form action="add_product" method="post">
    <label for="name">名称:</label>
    <input type="text" id="name" name="name" required>

    <label for="price">价格:</label>
    <input type="text" id="price" name="price" required>

    <label for="description">描述:</label>
    <input type="text" id="description" name="description">

    <label for="stock">库存:</label>
    <input type="number" id="stock" name="stock" required>

    <button type="submit">添加商品</button>
</form>
<div style="text-align: center;">
    <a href="admin_dashboard.jsp">返回首页</a> <!-- 返回首页的按钮 -->
</div>
</body>
</html>

