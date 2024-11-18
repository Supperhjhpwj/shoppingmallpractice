<%@ page import="java.sql.*" %>
<%@ page import="dao.Product" %>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page pageEncoding="UTF-8" %>

<%
    String url = "jdbc:mysql://localhost:3306/shopping_person";
    String user = "root";
    String password = "1234";

    Connection connection = null;
    Statement statement = null;
    ResultSet resultSet = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        connection = DriverManager.getConnection(url, user, password);
        statement = connection.createStatement();
        String sql = "SELECT * FROM products";
        resultSet = statement.executeQuery(sql);
%>

<!DOCTYPE html>
<html lang="zh">
<head>
    <meta charset="UTF-8">
    <title>销售统计报表</title>
    <style>
        /* CSS 样式 */
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 20px;
        }
        h1 {
            text-align: center;
            color: #333;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
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
            background-color: #f2f2f2;
        }
        tr:hover {
            background-color: #ddd;
        }
        .total {
            margin-top: 20px;
            font-size: 1.2em;
            text-align: right;
            color: #333;
        }
        .button-container {
            text-align: center;
            margin-top: 20px;
        }
        button {
            padding: 10px 20px;
            margin: 10px;
            border: none;
            background-color: #4CAF50;
            color: white;
            cursor: pointer;
        }
        button:hover {
            background-color: #45a049;
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
<h1>销售统计报表</h1>
<table>
    <tr>
        <th>ID</th>
        <th>名称</th>
        <th>价格</th>
        <th>描述</th>
        <th>库存</th>
        <th>最近销售</th>
        <th>总销售额</th>
    </tr>
    <%
        double total = 0;
        while (resultSet.next()) {
            int id = resultSet.getInt("id");
            String name = resultSet.getString("name");
            double price = resultSet.getDouble("price");
            String description = resultSet.getString("description");
            int stock = resultSet.getInt("stock");
            int recentSell = resultSet.getInt("recent_sell");
            Product product = new Product(id, name, price, description, stock, recentSell);
            total += product.getRecent_total_sell();
    %>
    <tr>
        <td><%= id %></td>
        <td><%= name %></td>
        <td><%= price %></td>
        <td><%= description %></td>
        <td><%= stock %></td>
        <td><%= recentSell %></td>
        <td><%= product.getRecent_total_sell() %></td>
    </tr>
    <%
        }
    %>
</table>
<div class="total">总销售额：<%= total %></div>

<div class="button-container">
    <form action="ResetSalesServlet" method="post">
        <button type="submit">刷新最近销售</button>
    </form>
    <form action="admin_dashboard.jsp" method="get">
        <button type="submit">返回主界面</button>
    </form>
</div>
<footer>
    &copy; 2024 购物中心 | All rights reserved |华南理工大学 黄劲恒
</footer>
</body>
</html>

<%
    } catch (SQLException | ClassNotFoundException e) {
        e.printStackTrace();
    } finally {
        try {
            if (resultSet != null) resultSet.close();
            if (statement != null) statement.close();
            if (connection != null) connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
%>
