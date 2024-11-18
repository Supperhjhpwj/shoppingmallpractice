<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 2024/10/15
  Time: 10:14
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="dao.OrderDao" %>
<%@ page import="dao.Order" %>
<%@ page import="java.util.List" %>

<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>订单管理</title>
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
        p {
            text-align: center;
            color: red;
            margin: 10px 0;
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
        button {
            background-color: #28a745;
            color: white;
            border: none;
            padding: 8px 12px;
            cursor: pointer;
            border-radius: 4px;
            transition: background-color 0.3s;
        }
        button:disabled {
            background-color: #ccc;
            cursor: not-allowed;
        }
        button:hover:not(:disabled) {
            background-color: #218838;
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
<h2>订单管理</h2>
<p>注：只有已支付的订单才能点击发货，只有已签收的订单才能点击完成订单。</p>
<!-- 订单列表 -->
<table>
    <thead>
    <tr>
        <th>订单编号</th>
        <th>用户</th>
        <th>总金额</th>
        <th>状态</th>
        <th>下单时间</th>
        <th>操作</th>
    </tr>
    </thead>
    <tbody>
    <%
        OrderDao orderDao = new OrderDao();
        List<Order> orders = orderDao.getAllOrders(); // 从数据库中获取所有订单
        for (Order order : orders) {
    %>
    <tr>
        <td><%= order.getOrderId() %></td>
        <td><%= order.getUsername() %></td>
        <td><%= order.getTotalAmount() %></td>
        <td><%= order.getStatus() %></td>
        <td><%= order.getOrderDate() %></td>
        <td>
            <!-- 发货按钮，点击后更新订单状态为"已发货" -->
            <form action="ship_order" method="post" style="display:inline;">
                <input type="hidden" name="orderId" value="<%= order.getOrderId() %>">
                <button type="submit" <%= !order.getStatus().equals("已支付") ? "disabled" : "" %>>发货</button>
            </form>
            <!-- 完成订单按钮，点击后删除订单 -->
            <form action="delete_order" method="post" style="display:inline;">
                <input type="hidden" name="orderId" value="<%= order.getOrderId() %>">
                <button type="submit" <%= !order.getStatus().equals("已签收") ? "disabled" : "" %>>完成订单</button>
            </form>
            <!-- 具体信息按钮，点击后查看订单详情 -->
            <form action="order_details.jsp" method="get" style="display:inline;">
                <input type="hidden" name="orderId" value="<%= order.getOrderId() %>">
                <button type="submit">具体信息</button>
            </form>
        </td>
    </tr>
    <%
        }
    %>
    </tbody>
</table>

<a href="admin_dashboard.jsp">返回管理员面板</a>
<footer>
    &copy; 2024 购物中心 | All rights reserved |华南理工大学 黄劲恒
</footer>
</body>
</html>

