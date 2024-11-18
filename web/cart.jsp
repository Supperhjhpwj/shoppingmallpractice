<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 2024/10/13
  Time: 19:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- cart.jsp -->
<%@ page import="java.util.List" %>
<%@ page import="dao.CartDao" %>
<%@ page import="dao.Product" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<%@ page import="dao.myUser" %>
<%@ page import="dao.CartItem" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>购物车</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f8f8f8;
            margin: 0;
            padding: 20px;
        }
        h2 {
            color: #333;
            text-align: center;
            margin-bottom: 20px;
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
            background-color: #4CAF50;
            color: white;
        }
        tr:nth-child(even) {
            background-color: #f9f9f9;
        }
        tr:hover {
            background-color: #f1f1f1;
        }
        form {
            display: inline;
        }
        input[type="number"] {
            width: 60px;
            padding: 5px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }
        button {
            padding: 8px 12px;
            border: none;
            border-radius: 5px;
            background-color: #4CAF50;
            color: white;
            cursor: pointer;
            font-size: 14px;
        }
        button:hover {
            background-color: #45a049;
        }
        .total-row {
            font-weight: bold;
            background-color: #f2f2f2;
        }
        .continue-shopping {
            text-align: center;
            margin-top: 20px;
        }
        a {
            color: #007BFF;
            text-decoration: none;
            font-size: 16px;
        }
        a:hover {
            text-decoration: underline;
        }
        footer {
            text-align: center;
            margin-top: 20px;
            padding: 10px 0;
            background-color: #f1f1f1;
            border-top: 1px solid #ddd;
        }

    </style>
</head>
<body>
<h2>购物车</h2>

<%
    // 隐式对象，不需要再创建
    myUser user = (myUser) session.getAttribute("user"); // 获取当前用户
    if (user == null) {
        response.sendRedirect("login.jsp"); // 如果用户未登录，重定向到登录页面
        return;
    }

    CartDao cartDao = new CartDao();
    List<CartItem> cartItems = cartDao.getCartItems(user.getUsername()); // 获取用户购物车中的商品

    if (cartItems.isEmpty()) {
%>
<p>您的购物车为空。</p>
<%
} else {
%>
<table>
    <tr>
        <th>商品名称</th>
        <th>价格</th>
        <th>数量</th>
        <th>总价</th>
        <th>操作</th> <!-- 用于修改数量 -->
    </tr>
    <%
        double total = 0.0;
        for (CartItem cartItem : cartItems) {
            double itemTotal = cartItem.getProduct().getPrice() * cartItem.getQuantity(); // 假设 stock 代表数量
            total += itemTotal;
           
    %>
    <tr>
        <td><%= cartItem.getProduct().getName() %></td>
        <td><%= cartItem.getProduct().getPrice() %></td>
        <td><%= cartItem.getQuantity() %></td>
        <td><%= itemTotal %></td>
        <td>
            <form action="UpdateCartServlet" method="post" onsubmit="return checkQuantity(this);">
                <input type="hidden" name="productId" value="<%= cartItem.getProduct().getId() %>" > <!-- 隐藏商品ID -->
                <input type="number" name="newQuantity" value="<%= cartItem.getQuantity() %>" min="1">
                <input type="hidden" name="stock" value="<%= cartItem.getProduct().getStock() %>"> <!-- 隐藏库存 -->
                <input type="hidden" name="currentQuantity" value="<%= cartItem.getQuantity() %>"> <!-- 隐藏当前数量 -->
                <button type="submit">更新数量</button> <!-- 提交按钮 -->
            </form>
            <script>
                function checkQuantity(form) {
                    const newQuantity = parseInt(form.newQuantity.value);
                    const stock = parseInt(form.stock.value);
                    const currentQuantity = parseInt(form.currentQuantity.value);

                    if (newQuantity <= stock + currentQuantity) {
                        return true; // 允许提交
                    } else {
                        alert("所选数量超过库存，无法更新。");
                        return false; // 阻止提交
                    }
                }
            </script>
            <form method="post" action="RemoveItemServlet" style="display: inline;">
                <!-- 隐藏字段传递商品ID -->
                <input type="hidden" name="productId" value="<%= cartItem.getProduct().getId() %>">
                <!-- 提交按钮 -->
                <button type="submit">移除</button>
            </form>
        </td>
    </tr>
    <%
        }
    %>
    <tr class="total-row">
        <td colspan="3">总计</td>
        <td><%= total %></td>
        <td></td>
    </tr>
</table>

<form action="ClearCart" method="post">
    <button type="submit">清空购物车</button>
</form>

<form action="CreateOrderServlet" method="post">
    <button type="submit">结算</button>
</form>

<%
    }
%>

<div class="continue-shopping">
    <a href="shop">继续购买商品</a>  <!-- 跳转到 ShopServlet -->
</div>
<footer>
    &copy; 2024 购物中心 | All rights reserved |华南理工大学 黄劲恒
</footer>
</body>
</html>


