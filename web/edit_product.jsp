<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="dao.ProductDao" %>
<%@ page import="dao.Product" %>
<%@ page import="java.util.List" %>

<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <title>编辑商品</title>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Roboto', sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 20px;
            display: flex;
            flex-direction: column;
            align-items: center; /* Center content horizontally */
        }
        h2 {
            text-align: center;
            color: #333;
            margin-bottom: 20px;
        }
        .card {
            max-width: 600px;
            margin: 20px auto;
            padding: 20px;
            background: white;
            border-radius: 12px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
            transition: transform 0.2s, box-shadow 0.2s; /* Add transition for hover effect */
        }
        .card:hover {
            transform: translateY(-5px); /* Lift the card on hover */
            box-shadow: 0 8px 30px rgba(0, 0, 0, 0.2);
        }
        label {
            margin-top: 10px;
            display: block;
            font-weight: bold;
            color: #555;
        }
        input[type="text"], input[type="number"] {
            width: calc(100% - 22px);
            padding: 10px;
            margin: 10px 0;
            border: 1px solid #ccc;
            border-radius: 6px;
            transition: border-color 0.3s;
        }
        input[type="text"]:focus, input[type="number"]:focus {
            border-color: #007BFF;
            outline: none; /* Remove the default outline */
        }
        button {
            background-color: #28a745;
            color: white;
            border: none;
            padding: 12px 16px;
            cursor: pointer;
            border-radius: 6px;
            transition: background-color 0.3s, transform 0.3s; /* Add transition */
            width: 100%; /* Full width button */
            font-size: 16px;
        }
        button:hover {
            background-color: #218838;
            transform: scale(1.05); /* Slightly enlarge button on hover */
        }
        a {
            display: inline-block;
            margin: 20px auto;
            text-align: center;
            color: #007BFF;
            text-decoration: none;
            font-size: 16px;
            transition: color 0.3s;
        }
        a:hover {
            text-decoration: underline;
            color: #0056b3;
        }
        footer {
            text-align: center;
            margin-top: 20px;
            color: #777;
            font-size: 14px;
        }
    </style>
</head>
<body>
<h2>编辑商品</h2>

<%
    // 获取商品 ID
    String idStr = request.getParameter("id");
    if (idStr == null || idStr.isEmpty()) {
        return;
    }

    int productId = Integer.parseInt(idStr);
    ProductDao productDao = new ProductDao();
    Product product = productDao.getProductById(productId); // 从数据库中获取商品信息
//    System.out.println(product.getStock());

    if (product == null) {
%>
<p style="text-align: center; color: #d9534f;">未找到该商品。</p>
<%
} else {
        System.out.println(productId);
        System.out.println(product.getStock());
%>
<div class="card">
    <!-- 编辑商品表单 -->
    <form action="update_product" method="post">
        <input type="hidden" name="id" value="<%= product.getId() %>">
        <label>名称:</label>
        <input type="text" name="name" value="<%= product.getName() %>" required>

        <label>价格:</label>
        <input type="text" name="price" value="<%= product.getPrice() %>" required pattern="^\d+(\.\d{1,2})?$" title="请输入有效的价格（最多两位小数）" step="0.01" min="0">

        <label>描述:</label>
        <input type="text" name="description" value="<%= product.getDescription() %>">

        <label>库存:</label>
        <input type="number" name="stock" value="<%= product.getStock() %>" min="0" required>


        <button type="submit">更新商品</button>
    </form>
</div>
<%
    }
%>

<div style="text-align: center;">
    <a href="manage_products.jsp">返回商品管理</a>
    <a href="admin_dashboard.jsp">返回首页</a>
</div>
<footer>
    &copy; 2024 购物中心 | All rights reserved | 华南理工大学 黄劲恒
</footer>
</body>
</html>
