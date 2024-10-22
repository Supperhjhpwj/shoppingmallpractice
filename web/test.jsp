<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 2024/10/14
  Time: 21:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="dao.*" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>订单详情</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
        function payOrder(orderId) {
            $.ajax({
                type: "POST",
                url: "order.jsp",
                data: { orderId: orderId, action: "pay" },
                success: function(response) {
                    // 解析 JSON 数据并更新页面
                    const result = JSON.parse(response);
                    if (result.success) {
                        alert('支付成功！');
                        $('#orderStatus').text('已支付');
                        $('#payButton').hide(); // 隐藏支付按钮
                    } else {
                        alert('支付失败，请重试！');
                    }
                },
                error: function() {
                    alert('请求失败，请稍后重试！');
                }
            });
        }
    </script>
</head>
<body>
<h2>订单详情</h2>

<%
    myUser user = (myUser) session.getAttribute("user"); // 获取当前用户
    if (user == null) {
        response.sendRedirect("login.jsp"); // 如果用户未登录，重定向到登录页面
        return;
    }

    String orderId = request.getParameter("orderId");
    OrderDao orderDao = new OrderDao();
    Order order = orderDao.getOrderById(Integer.parseInt(orderId)); // 获取订单
    OrderItemDao orderItemDao = new OrderItemDao();
    List<OrderItem> orderItemList = orderItemDao.getOrderItemsByOrderId(Integer.parseInt(orderId));

    if (order == null) {
%>
<p>订单不存在。</p>
<%
} else {
%>
订单状态：<span id="orderStatus"><%= order.getStatus() %></span>
<table border="1">
    <tr>
        <th>商品名称</th>
        <th>数量</th>
        <th>单价</th>
        <th>总价</th>
    </tr>
    <%
        double total = 0;
        for (OrderItem item : orderItemList) {
            double itemTotal = item.getQuantity() * item.getPrice();
            total += itemTotal;
    %>
    <tr>
        <td><%= item.getProductName() %></td>
        <td><%= item.getQuantity() %></td>
        <td><%= item.getPrice() %></td>
        <td><%= itemTotal %></td>
    </tr>
    <%
        }
    %>
    <tr>
        <td colspan="3">总计</td>
        <td><%= total %></td>
    </tr>
</table>

<%
    if (!"已支付".equals(order.getStatus())) { // 如果订单未支付，显示支付按钮
%>
<button id="payButton" onclick="payOrder('<%= orderId %>')">支付</button>
<%
} else {
%>
<p>订单已支付。</p>
<%
        }
    }
%>

<%
    // 处理 AJAX 请求
    String action = request.getParameter("action");
    if ("pay".equals(action)) { // 如果请求的操作是“支付”
        boolean paymentSuccess = orderDao.updateOrderStatus(Integer.parseInt(orderId), "已支付");
        response.setContentType("application/json"); // 设置响应类型为 JSON
        if (paymentSuccess) {
            out.print("{\"success\": true}"); // 返回成功的 JSON 响应
        } else {
            out.print("{\"success\": false}"); // 返回失败的 JSON 响应
        }
        return; // 停止后续代码执行
    }
%>

<a href="shop">继续购买商品</a>
</body>
</html>
