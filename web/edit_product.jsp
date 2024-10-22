<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 2024/10/15
  Time: 9:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="dao.ProductDao" %>
<%@ page import="dao.Product" %>
<%@ page import="java.util.List" %>

<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <title>编辑商品</title>
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
        form {
            max-width: 600px;
            margin: 20px auto;
            padding: 20px;
            background: white;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }
        input[type="text"], input[type="number"] {
            width: calc(100% - 22px);
            padding: 10px;
            margin: 10px 0;
            border: 1px solid #ccc;
            border-radius: 4px;
        }
        button {
            background-color: #28a745;
            color: white;
            border: none;
            padding: 10px 15px;
            cursor: pointer;
            border-radius: 4px;
            transition: background-color 0.3s;
        }
        button:hover {
            background-color: #218838;
        }
        a {
            display: inline-block;
            margin: 20px auto;
            text-align: center;
            color: #007BFF;
            text-decoration: none;
            font-size: 16px;
        }
        a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
<h2>编辑商品</h2>

<%
    // 获取商品 ID
    String idStr = request.getParameter("id");
    if (idStr == null || idStr.isEmpty()) {
        out.println("<p>无效的商品 ID。</p>");
        return;
    }

    int productId = Integer.parseInt(idStr);
    ProductDao productDao = new ProductDao();
    Product product = productDao.getProductById(productId); // 从数据库中获取商品信息

    if (product == null) {
%>
<p>未找到该商品。</p>
<%
} else {
%>
<!-- 编辑商品表单 -->
<form action="update_product" method="post">
    <input type="hidden" name="id" value="<%= product.getId() %>">
    <label>名称:</label>
    <input type="text" name="name" value="<%= product.getName() %>" required>

    <label>价格:</label>
    <input type="text" name="price" value="<%= product.getPrice() %>" required>

    <label>描述:</label>
    <input type="text" name="description" value="<%= product.getDescription() %>">

    <label>库存:</label>
    <input type="number" name="stock" value="<%= product.getStock() %>" required>

    <button type="submit">更新商品</button>
</form>
<%
    }
%>

<div style="text-align: center;">
    <a href="manage_products.jsp">返回商品管理</a>
    <a href="admin_dashboard.jsp">返回首页</a> <!-- 返回首页的按钮 -->
</div>

</body>
</html>

