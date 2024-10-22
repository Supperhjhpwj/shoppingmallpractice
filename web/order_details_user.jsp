<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 2024/10/15
  Time: 11:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="dao.OrderItem" %>
<%@ page import="java.util.List" %>
<%@ page import="dao.OrderDao" %>
<%@ page import="dao.Order" %>

<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>订单详情</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 20px;
        }
        h2, h3 {
            text-align: center;
            color: #333;
        }
        table {
            width: 100%;
            max-width: 800px;
            margin: 20px auto;
            border-collapse: collapse;
            background: white;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }
        th, td {
            padding: 12px;
            border: 1px solid #ddd;
            text-align: center;
        }
        th {
            background-color: #007BFF;
            color: white;
        }
        td {
            background-color: #f9f9f9;
        }
        a {
            display: block;
            text-align: center;
            margin-top: 20px;
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
<h2>订单详情</h2>

<table>
    <thead>
    <tr>
        <th>商品名称</th>
        <th>数量</th>
        <th>单价</th>
        <th>总价</th>
    </tr>
    </thead>
    <tbody>
    <%
        List<OrderItem> orderItems = (List<OrderItem>) request.getAttribute("orderItems");
        if (orderItems != null && !orderItems.isEmpty()) {
            for (OrderItem item : orderItems) {
    %>
    <tr>
        <td><%= item.getProductName() %></td>
        <td><%= item.getQuantity() %></td>
        <td><%= item.getPrice() %></td>
        <td><%= item.getQuantity() * item.getPrice() %></td>
    </tr>
    <%
        }
    } else {
    %>
    <tr>
        <td colspan="4">该订单没有商品信息。</td>
    </tr>
    <%
        }
    %>
    </tbody>
</table>

<%
    int orderId = Integer.parseInt(request.getParameter("orderId"));
    OrderDao orderDao = new OrderDao();
    Order order = orderDao.getOrderById(orderId); // 获取指定订单详情
%>
<h3>订单总额: <%= order.getTotalAmount() %></h3>
<h3>订单状态: <%= order.getStatus() %></h3>
<h3>下单时间: <%= order.getOrderDate() %></h3>
<a href="view_orders">返回订单列表</a>
</body>
</html>

