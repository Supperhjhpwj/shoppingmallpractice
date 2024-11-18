
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
    <input type="text" id="price" name="price" required pattern="^\d+(\.\d{1,2})?$" title="请输入有效的价格（最多两位小数,非负）" step="0.01" min="0">

    <label for="description">描述:</label>
    <input type="text" id="description" name="description">

    <label for="stock">库存:</label>
    <input type="number" id="stock" name="stock" min="0" required>

    <button type="submit">添加商品</button>
</form>
<div style="text-align: center;">
    <a href="admin_dashboard.jsp">返回首页</a> <!-- 返回首页的按钮 -->
</div>
<footer>
    &copy; 2024 购物中心 | All rights reserved |华南理工大学 黄劲恒
</footer>
</body>
</html>

