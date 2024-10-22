<%--&lt;%&ndash;--%>
<%--  Created by IntelliJ IDEA.--%>
<%--  User: ASUS--%>
<%--  Date: 2024/10/16--%>
<%--  Time: 10:34--%>
<%--  To change this template use File | Settings | File Templates.--%>
<%--&ndash;%&gt;--%>
<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>
<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>
<%--<%@ page import="java.util.List" %>--%>
<%--<%@ page import="dao.UserActivityLog" %>--%>
<%--<%@ page import="dao.LogsDao" %>--%>
<%--<!DOCTYPE html>--%>
<%--<html lang="en">--%>
<%--<head>--%>
<%--    <meta charset="UTF-8">--%>
<%--    <title>用户活动日志</title>--%>
<%--</head>--%>
<%--<body>--%>

<%--<h2>用户活动日志</h2>--%>


<%--<table border="1">--%>
<%--    <tr>--%>
<%--        <th>活动ID</th>--%>
<%--        <th>用户名</th>--%>
<%--        <th>活动类型</th>--%>
<%--        <th>商品ID</th>--%>
<%--        <th>活动时间</th>--%>
<%--        <th>详细信息</th>--%>
<%--    </tr>--%>
<%--    <%--%>
<%--        LogsDao logsDao=new LogsDao();--%>
<%--        List<UserActivityLog> logs =logsDao.getUserActivityLogs() ;--%>
<%--        if (logs != null && !logs.isEmpty()) {--%>
<%--            for (UserActivityLog log : logs) {--%>
<%--    %>--%>
<%--    <tr>--%>
<%--        <td><%= log.getId() %></td>--%>
<%--        <td><%= log.getUsername() %></td>--%>
<%--        <td><%= log.getActivityType() %></td>--%>
<%--        <td><%= log.getProductId() %></td>--%>
<%--        <td><%= log.getTimestamp() %></td>--%>
<%--        <td><%= log.getDetails() %></td>--%>
<%--    </tr>--%>
<%--    <%--%>
<%--        }--%>
<%--    } else {--%>
<%--    %>--%>
<%--    <tr>--%>
<%--        <td colspan="6">暂无用户活动日志。</td>--%>
<%--    </tr>--%>
<%--    <%--%>
<%--        }--%>
<%--    %>--%>
<%--</table>--%>


<%--<%--%>
<%--    // 只有在日志不为空时才显示清除按钮--%>
<%--    if (logs != null && !logs.isEmpty()) {--%>
<%--%>--%>
<%--<form action="ClearLogsServlet" method="post">--%>
<%--    <button type="submit">清除所有日志</button>--%>
<%--</form>--%>
<%--<%--%>
<%--}--%>
<%--else {--%>
<%--%>--%>
<%--<p>暂无用户活动日志，无法清除。</p>--%>
<%--<%--%>
<%--    }--%>
<%--%>--%>
<%--<a href="admin_dashboard.jsp">返回管理员首页</a><br>--%>

<%--</body>--%>
<%--</html>--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="dao.UserActivityLog" %>
<%@ page import="dao.LogsDao" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <title>用户活动日志</title>
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
            color: #007BFF;
            text-decoration: none;
        }
        a:hover {
            text-decoration: underline;
        }
        form {
            max-width: 600px;
            margin: 20px auto;
            padding: 20px;
            background: white;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }
        input[type="text"] {
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
    </style>
</head>
<body>

<h2>用户活动日志</h2>

<!-- 用户名查询表单 -->
<form action="" method="get">
    <%--@declare id="username"--%><label for="username">输入用户名查询:</label>
    <input type="text" name="username" required>
    <button type="submit">查询</button>
</form>

<!-- 查看所有日志按钮 -->
<form action="" method="get">
    <button type="submit" name="viewAll">查看所有日志</button>
</form>

<table>
    <tr>
        <th>活动ID</th>
        <th>用户名</th>
        <th>活动类型</th>
        <th>商品ID</th>
        <th>活动时间</th>
        <th>详细信息</th>
    </tr>
    <%
        String username = request.getParameter("username");
        String viewAll = request.getParameter("viewAll");

        LogsDao logsDao = new LogsDao();
        List<UserActivityLog> logs;

        // 根据用户名或查看所有日志获取日志数据
        if (username != null && !username.isEmpty()) {
            logs = logsDao.getUserActivityLogsByUsername(username);
        } else {
            logs = logsDao.getUserActivityLogs(); // 获取所有日志
        }

        // 显示日志
        if (logs != null && !logs.isEmpty()) {
            for (UserActivityLog log : logs) {
    %>
    <tr>
        <td><%= log.getId() %></td>
        <td><%= log.getUsername() %></td>
        <td><%= log.getActivityType() %></td>
        <td><%= log.getProductId() %></td>
        <td><%= log.getTimestamp() %></td>
        <td><%= log.getDetails() %></td>
    </tr>
    <%
        }
    } else {
    %>
    <tr>
        <td colspan="6">暂无用户活动日志。</td>
    </tr>
    <%
        }
    %>
</table>

<%
    // 只有在日志不为空时才显示清除按钮
    if (logs != null && !logs.isEmpty()) {
%>
<form action="ClearLogsServlet" method="post">
    <button type="submit">清除所有日志</button>
</form>
<%
} else {
%>
<p>暂无用户活动日志，无法清除。</p>
<%
    }
%>

<a href="admin_dashboard.jsp">返回管理员首页</a><br>

</body>
</html>




