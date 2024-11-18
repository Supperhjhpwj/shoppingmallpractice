<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="dao.Order" %>
<%@ page import="java.util.List" %>

<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>我的订单</title>
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
        }

    </style>
</head>
<body>
<h2>我的订单</h2>
<div class="info-message">
    只有支付卖家才能发货，只有已发货才能签收，商家点击完成订单记录会被清除。
</div>

<!-- 订单列表 -->
<table>
    <thead>
    <tr>
        <th>订单编号</th>
        <th>总金额</th>
        <th>状态</th>
        <th>下单时间</th>
        <th>操作</th> <!-- 新增操作列 -->
    </tr>
    </thead>
    <tbody>
    <%
        List<Order> orders = (List<Order>) request.getAttribute("orders");  // 获取订单列表
        if (orders != null && !orders.isEmpty()) {
            for (Order order : orders) {
    %>
    <tr>
        <td><%= order.getOrderId() %></td>
        <td><%= order.getTotalAmount() %></td>
        <td><%= order.getStatus() %></td>
        <td><%= order.getOrderDate() %></td>
        <td>
            <!-- 确认收货按钮，只有状态为“已发货”时才能点击 -->
            <form action="confirm_order" method="post" style="display:inline;">
                <input type="hidden" name="orderId" value="<%= order.getOrderId() %>">
                <button type="submit" <%= !order.getStatus().equals("已发货") ? "disabled" : "" %>>确认收货</button>
            </form>
            <!-- 支付按钮，只有待支付的订单才能点击 -->
            <form action="pay_order" method="post" style="display:inline;">
                <input type="hidden" name="orderId" value="<%= order.getOrderId() %>">
                <button type="submit" <%= !order.getStatus().equals("待支付") ? "disabled" : "" %>>支付</button>
            </form>
        </td>
    </tr>
    <%
        }
    } else {
    %>
    <tr>
        <td colspan="5">您还没有订单。</td>
    </tr>
    <%
        }
    %>
    </tbody>
</table>

<a href="userDashboard.jsp">返回用户中心</a>
</body>
<footer>
    &copy; 2024 购物中心 | All rights reserved |华南理工大学 黄劲恒
</footer>
</html>
