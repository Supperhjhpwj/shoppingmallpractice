<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f8f9fa;
            margin: 0;
            padding: 20px;
            color: #343a40;
        }
        h2 {
            text-align: center;
            margin-bottom: 30px;
            font-size: 2.5em;
            color: #28a745;
            text-shadow: 1px 1px 3px rgba(0, 0, 0, 0.2);
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
            transition: border-color 0.3s;
        }
        input[type="text"]:focus {
            border-color: #28a745;
            outline: none;
        }
        button {
            padding: 10px 15px;
            border: none;
            border-radius: 5px;
            background-color: #28a745;
            color: white;
            cursor: pointer;
            font-size: 16px;
            transition: background-color 0.3s, transform 0.3s;
        }
        button:hover {
            background-color: #218838;
            transform: translateY(-2px);
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
            background-color: white;
            border-radius: 10px;
            overflow: hidden; /* 圆角效果 */
        }
        th, td {
            padding: 12px;
            text-align: left;
            border: 1px solid #ddd;
        }
        th {
            background-color: #28a745;
            color: white;
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
            font-size: 1.2em;
            transition: color 0.3s;
        }
        a:hover {
            text-decoration: underline;
            color: #0056b3;
        }
        footer {
            text-align: center;
            margin-top: 20px;
            font-size: 0.9em;
            color: #6c757d;
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

<!-- 添加查看购物车的按钮 -->
<form action="cart.jsp" method="get">
    <button type="submit">查看购物车</button>
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
            <form action="cart" method="post" style="display: inline;" onsubmit="return checkStock(this);">
                <input type="hidden" name="id" value="<%= product.getId() %>">
                <input type="hidden" name="name" value="<%= product.getName() %>">
                <input type="hidden" name="price" value="<%= product.getPrice() %>">
                <input type="hidden" name="stock" value="<%= product.getStock() %>">
                <button type="submit">加入购物车</button>
            </form>

            <script>
                function checkStock(form) {
                    const stock = parseInt(form.stock.value);
                    if (stock > 0) {
                        return true; // 允许提交
                    } else {
                        alert("该产品已售罄，无法加入购物车。");
                        return false; // 阻止提交
                    }
                }
            </script>
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
<footer>
    &copy; 2024 购物中心 | All rights reserved |华南理工大学 黄劲恒
</footer>
</body>
</html>
