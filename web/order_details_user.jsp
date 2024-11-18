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
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Roboto', sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 20px;
        }
        h2, h3 {
            text-align: center;
            color: #28a745; /* 鲜明的绿色 */
            margin-bottom: 10px; /* 调整底部间距 */
        }
        .info-message {
            text-align: center;
            color: #6c757d; /* 灰色 */
            margin-bottom: 20px; /* 间距 */
            font-size: 16px; /* 字体大小 */
            padding: 10px; /* 内边距 */
            border: 1px solid #ccc; /* 边框 */
            border-radius: 5px; /* 圆角 */
            background-color: #f8f9fa; /* 背景颜色 */
        }
        table {
            width: 100%;
            max-width: 800px;
            margin: 20px auto;
            border-collapse: collapse;
            background: white;
            border-radius: 10px;
            overflow: hidden; /* 圆角效果 */
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2);
        }
        th, td {
            padding: 12px;
            border: 1px solid #ddd;
            text-align: center;
        }
        th {
            background-color: #007BFF;
            color: white;
            transition: background-color 0.3s; /* 增加过渡效果 */
        }
        th:hover {
            background-color: #0056b3; /* 鼠标悬停时的效果 */
        }
        td {
            background-color: #f9f9f9;
        }
        a {
            display: block;
            text-align: center;
            margin-top: 30px;
            padding: 10px;
            background-color: #28a745;
            color: white;
            text-decoration: none;
            border-radius: 5px;
            transition: background-color 0.3s, transform 0.3s; /* 动态效果 */
        }
        a:hover {
            background-color: #218838;
            transform: translateY(-2px);
        }
        @media (max-width: 600px) {
            table {
                font-size: 14px; /* 在小屏幕上调整字体大小 */
            }
        }
    </style>
</head>
<body>
<h2>订单详情</h2>
<div class="info-message">
    只有支付卖家才能发货，只有已发货才能签收，商家点击完成订单记录会被清除。
</div>

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
<h3>订单总额: <%= order.getTotalAmount() %> 元</h3>
<h3>订单状态: <%= order.getStatus() %></h3>
<h3>下单时间: <%= order.getOrderDate() %></h3>
<a href="view_orders">返回订单列表</a>
<%--<footer>--%>
<%--    &copy; 2024 购物中心 | All rights reserved |华南理工大学 黄劲恒--%>
<%--</footer>--%>
</body>
</html>
