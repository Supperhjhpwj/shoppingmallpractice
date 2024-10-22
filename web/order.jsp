<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 2024/10/14
  Time: 17:39
  To change this template use File | Settings | File Templates.
--%>
<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>

<%--<%@ page import="dao.*" %>--%>
<%--<%@ page import="java.util.List" %>--%>
<%--<!DOCTYPE html>--%>
<%--<html lang="en">--%>
<%--<head>--%>
<%--    <meta charset="UTF-8">--%>
<%--    <title>订单详情</title>--%>
<%--</head>--%>
<%--<body>--%>
<%--<h2>订单详情</h2>--%>

<%--<%--%>

<%--    myUser user = (myUser) session.getAttribute("user"); // 获取当前用户--%>
<%--    if (user == null) {--%>
<%--        response.sendRedirect("login.jsp"); // 如果用户未登录，重定向到登录页面--%>
<%--        return;--%>
<%--    }--%>

<%--    String orderId = request.getParameter("orderId");--%>
<%--    String action = request.getParameter("action");--%>
<%--    OrderDao orderDao = new OrderDao();--%>
<%--    if ("pay".equals(action)) { // 如果请求的操作是“支付”--%>
<%--        boolean paymentSuccess = orderDao.updateOrderStatus(Integer.parseInt(orderId), "已支付");--%>

<%--    }--%>
<%--    Order order = orderDao.getOrderById(Integer.parseInt(orderId)); // 获取订单--%>
<%--    OrderItemDao orderItemDao=new OrderItemDao();--%>
<%--    List<OrderItem> orderItemList=orderItemDao.getOrderItemsByOrderId(Integer.parseInt(orderId)) ;--%>
<%--    System.out.println(order.getOrderId());--%>
<%--    System.out.println( orderItemList);--%>

<%--    if (order == null) {--%>
<%--%>--%>
<%--<p>订单不存在。</p>--%>
<%--<%--%>
<%--} else {--%>
<%--%>--%>
<%--订单状态：<%= order.getStatus() %>--%>
<%--<%--%>
<%--    if (!"已支付".equals(order.getStatus())) { // 如果订单状态不是“已支付”，则显示支付按钮--%>
<%--%>--%>
<%--<form method="post" action="order.jsp">--%>
<%--    <input type="hidden" name="orderId" value="<%= orderId %>">--%>
<%--    <input type="hidden" name="action" value="pay">--%>
<%--    <button type="submit">支付</button>--%>
<%--</form>--%>
<%--<%--%>
<%--} else {--%>
<%--%>--%>
<%--<p>订单已支付。</p>--%>
<%--<%--%>
<%--    }--%>
<%--%>--%>

<%--<table border="1">--%>
<%--    <tr>--%>
<%--        <th>商品名称</th>--%>
<%--        <th>数量</th>--%>
<%--        <th>单价</th>--%>
<%--        <th>总价</th>--%>

<%--    </tr>--%>
<%--    <%--%>
<%--        double total = 0;--%>
<%--        for (OrderItem item : orderItemList) {--%>
<%--            double itemTotal = item.getQuantity() * item.getPrice();--%>
<%--            total += itemTotal;--%>
<%--    %>--%>

<%--    <tr>--%>
<%--        <td><%= item.getProductName() %></td>--%>
<%--        <td><%= item.getQuantity() %></td>--%>
<%--        <td><%= item.getPrice() %></td>--%>
<%--        <td><%= itemTotal %></td>--%>
<%--    </tr>--%>
<%--    <%--%>
<%--        }--%>
<%--    %>--%>
<%--    <tr>--%>
<%--        <td colspan="3">总计</td>--%>
<%--        <td><%= total %></td>--%>
<%--    </tr>--%>
<%--</table>--%>

<%--<%--%>
<%--    }--%>
<%--%>--%>
<%--<a href="shop">继续购买商品</a>--%>
<%--</body>--%>
<%--</html>--%>
<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>
<%--<%@ page import="dao.*" %>--%>
<%--<%@ page import="java.util.List" %>--%>
<%--<!DOCTYPE html>--%>
<%--<html lang="en">--%>
<%--<head>--%>
<%--    <meta charset="UTF-8">--%>
<%--    <title>订单详情</title>--%>
<%--    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>--%>
<%--    <script>--%>
<%--        function payOrder(orderId) {--%>

<%--            $.ajax({--%>
<%--                type: "POST",--%>
<%--                url: "order.jsp",--%>
<%--                data: { orderId: orderId, action: "pay" ,t: new Date().getTime()},--%>
<%--                error: function(response) {--%>
<%--                    console.log(response); // 打印服务器响应--%>
<%--                    try {--%>
<%--                        // const result = JSON.parse(response);--%>
<%--                        // if (!result.success) {--%>
<%--                        //     alert('支付成功！');--%>
<%--                        //     $('#orderStatus').text('已支付');--%>
<%--                        //     $('#payButton').hide();--%>
<%--                        // } else {--%>
<%--                        //     alert('支付失败，请重试！');--%>
<%--                        // }--%>
<%--                            alert('支付成功！');--%>
<%--                            $('#orderStatus').text('已支付');--%>
<%--                            $('#payButton').hide();--%>
<%--                    } catch (e) {--%>
<%--                        console.log("服务器返回:", response); // 输出整个响应--%>
<%--                        console.error('JSON解析错误:', e);--%>
<%--                        alert('服务器响应格式错误，请联系管理员！');--%>
<%--                    }--%>
<%--                },--%>
<%--                success: function(jqXHR, textStatus, errorThrown,response) {--%>
<%--                    console.log("服务器响应内容:", response); // 打印服务器响应内容--%>
<%--                    console.log("响应内容:", jqXHR.responseText); // 打印服务器返回的内容--%>
<%--                    console.log("状态码:", jqXHR.status); // 打印状态码--%>
<%--                    console.log("状态文本:", textStatus); // 打印状态文本--%>
<%--                    console.log("错误信息:", errorThrown); // 打印错误信息息--%>
<%--                    alert('请求失败，请稍后重试！');--%>
<%--                }--%>
<%--            });--%>
<%--        }--%>
<%--    </script>--%>
<%--</head>--%>
<%--<body>--%>
<%--<h2>订单详情</h2>--%>

<%--<%--%>
<%--    myUser user = (myUser) session.getAttribute("user"); // 获取当前用户--%>
<%--    if (user == null) {--%>
<%--        response.sendRedirect("login.jsp"); // 如果用户未登录，重定向到登录页面--%>
<%--        return;--%>
<%--    }--%>

<%--    String orderId = request.getParameter("orderId");--%>
<%--    OrderDao orderDao = new OrderDao();--%>
<%--    Order order = orderDao.getOrderById(Integer.parseInt(orderId)); // 获取订单--%>
<%--    OrderItemDao orderItemDao = new OrderItemDao();--%>
<%--    List<OrderItem> orderItemList = orderItemDao.getOrderItemsByOrderId(Integer.parseInt(orderId));--%>

<%--    if (order == null) {--%>
<%--%>--%>
<%--<p>订单不存在。</p>--%>
<%--<%--%>
<%--} else {--%>
<%--%>--%>
<%--订单状态：<span id="orderStatus"><%= order.getStatus() %></span>--%>
<%--<table border="1">--%>
<%--    <tr>--%>
<%--        <th>商品名称</th>--%>
<%--        <th>数量</th>--%>
<%--        <th>单价</th>--%>
<%--        <th>总价</th>--%>
<%--    </tr>--%>
<%--    <%--%>
<%--        double total = 0;--%>
<%--        for (OrderItem item : orderItemList) {--%>
<%--            double itemTotal = item.getQuantity() * item.getPrice();--%>
<%--            total += itemTotal;--%>
<%--    %>--%>
<%--    <tr>--%>
<%--        <td><%= item.getProductName() %></td>--%>
<%--        <td><%= item.getQuantity() %></td>--%>
<%--        <td><%= item.getPrice() %></td>--%>
<%--        <td><%= itemTotal %></td>--%>
<%--    </tr>--%>
<%--    <%--%>
<%--        }--%>
<%--    %>--%>
<%--    <tr>--%>
<%--        <td colspan="3">总计</td>--%>
<%--        <td><%= total %></td>--%>
<%--    </tr>--%>
<%--</table>--%>

<%--<%--%>
<%--    if (!"已支付".equals(order.getStatus())) { // 如果订单未支付，显示支付按钮--%>
<%--%>--%>
<%--<button id="payButton" onclick="payOrder('<%= orderId %>')">支付</button>--%>
<%--<%--%>
<%--} else {--%>
<%--%>--%>
<%--<p>订单已支付。</p>--%>
<%--<%--%>
<%--        }--%>
<%--    }--%>
<%--%>--%>

<%--<%--%>
<%--    // 处理 AJAX 请求--%>
<%--    String action = request.getParameter("action");--%>
<%--    if ("pay".equals(action)) { // 如果请求的操作是“支付”--%>
<%--        try {--%>
<%--            boolean paymentSuccess = orderDao.updateOrderStatus(Integer.parseInt(orderId), "已支付");--%>
<%--            if (paymentSuccess) {--%>
<%--                response.setHeader("Access-Control-Allow-Origin", "*");--%>
<%--                response.setContentType("application/json; charset=UTF-8");--%>


<%--//                response.setContentType("application/json");--%>
<%--                response.getWriter().write("{\"success\": true}");--%>
<%--                System.out.println(response);--%>
<%--            } else {--%>
<%--                response.setHeader("Access-Control-Allow-Origin", "*");--%>

<%--                response.setContentType("application/json");--%>
<%--                response.getWriter().write("{\"success\": false}");--%>
<%--            }--%>
<%--        } catch (Exception e) {--%>
<%--            e.printStackTrace(); // 打印错误信息--%>
<%--            response.setHeader("Access-Control-Allow-Origin", "*");--%>

<%--            response.setContentType("application/json");--%>
<%--            response.getWriter().write("{\"success\": false, \"error\": \"" + e.getMessage() + "\"}");--%>
<%--        }--%>

<%--        return; // 停止后续代码执行--%>
<%--    }--%>
<%--%>--%>

<%--<a href="shop">继续购买商品</a>--%>
<%--</body>--%>
<%--</html>--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="dao.*" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>订单详情</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f8f8f8;
            margin: 0;
            padding: 20px;
        }
        h2 {
            text-align: center;
            color: #333;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
            background-color: white;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
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
        .total-row {
            font-weight: bold;
            background-color: #f2f2f2;
        }
        button {
            padding: 10px 15px;
            border: none;
            border-radius: 5px;
            background-color: #4CAF50;
            color: white;
            cursor: pointer;
            font-size: 16px;
        }
        button:hover {
            background-color: #45a049;
        }
        .status {
            margin-top: 20px;
            font-size: 18px;
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
    </style>
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
<div class="status">订单状态：<span id="orderStatus"><%= order.getStatus() %></span></div>
<table>
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
    <tr class="total-row">
        <td colspan="3">总计</td>
        <td><%= total %></td>
    </tr>
</table>

<%
    if (!"已支付".equals(order.getStatus())) { // 如果订单未支付，显示支付按钮
%>
<form action="payOrderServlet" method="post">
    <input type="hidden" name="orderId" value="<%= orderId %>">
    <button type="submit">支付</button>
</form>
<%
} else {
%>
<p>订单已支付。</p>
<%
        }
    }
%>

<div class="continue-shopping">
    <a href="shop">继续购买商品</a>
</div>
</body>
</html>


