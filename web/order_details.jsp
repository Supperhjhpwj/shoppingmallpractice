<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 2024/10/15
  Time: 11:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="dao.*" %>

<html lang="zh-CN">
<head>
  <meta charset="UTF-8">
  <title>订单详情</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      background-color: #f4f4f4;
      margin: 0;
      padding: 20px;
    }
    h2, h3 {
      color: #333;
    }
    h2 {
      text-align: center;
    }
    ul {
      list-style-type: none;
      padding: 0;
    }
    li {
      background: #fff;
      margin: 5px 0;
      padding: 10px;
      border-radius: 4px;
      box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
    }
    table {
      width: 100%;
      border-collapse: collapse;
      margin: 20px 0;
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
      display: inline-block;
      margin: 20px auto;
      padding: 10px 15px;
      background-color: #28a745;
      color: white;
      text-decoration: none;
      border-radius: 4px;
      transition: background-color 0.3s;
    }
    a:hover {
      background-color: #218838;
    }
  </style>
</head>
<body>

<%
  int orderId = Integer.parseInt(request.getParameter("orderId"));
  OrderDao orderDao = new OrderDao();
  Order order = orderDao.getOrderById(orderId); // 获取指定订单详情

  UserDao userDao = new UserDao();
  myUser user = userDao.getUserByUsername(order.getUsername()); // 获取下单用户信息
%>

<h2>订单编号: <%= order.getOrderId() %></h2>

<h3>用户信息</h3>
<ul>
  <li>用户名: <%= user.getUsername() %></li>
  <li>收货人姓名: <%= user.getRecipientName() %></li>
  <li>电话: <%= user.getPhoneNumber() %></li>
  <li>邮箱: <%= user.getEmail() %></li>
  <li>地址: <%= user.getShippingAddress() %></li>
</ul>

<h3>商品信息</h3>
<table>
  <thead>
  <tr>
    <th>商品名称</th>
    <th>数量</th>
    <th>单价</th>
    <th>小计</th>
  </tr>
  </thead>
  <tbody>
  <%
    OrderItemDao orderItemDao = new OrderItemDao();
    // 获取该订单的商品列表
    List<OrderItem> items = orderItemDao.getOrderItemsByOrderId(orderId); // 假设订单中有多个商品
    for (OrderItem item : items) {
  %>
  <tr>
    <td><%= item.getProductName() %></td>
    <td><%= item.getQuantity() %></td>
    <td><%= item.getPrice() %></td>
    <td><%= item.getQuantity() * item.getPrice() %></td>
  </tr>
  <%
    }
  %>
  </tbody>
</table>

<h3>订单总额: <%= order.getTotalAmount() %></h3>
<h3>订单状态: <%= order.getStatus() %></h3>
<h3>下单时间: <%= order.getOrderDate() %></h3>

<a href="manage_orders.jsp">返回订单管理</a>

</body>
</html>


