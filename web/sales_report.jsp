<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="dao.SalesReport" %>
<%@ page import="dao.SalesReportDao" %>
<%
    SalesReportDao salesReportDao = new SalesReportDao();
    List<SalesReport> salesReports = salesReportDao.getSalesReports();
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>销售统计报表</title>
</head>
<body>
<h2>销售统计报表</h2>

<% if (salesReports == null || salesReports.isEmpty()) { %>
<p>暂无销售记录。</p>
<% } else { %>
<table border="1">
    <tr>
        <th>商品ID</th>
        <th>商品名称</th>
        <th>销售数量</th>
        <th>单价</th>
        <th>总价</th>
    </tr>
    <%
        for (SalesReport report : salesReports) {
    %>
    <tr>
        <td><%= report.getProductId() %></td>
        <td><%= report.getName() %></td>
        <td><%= report.getQuantity() %></td>
        <td><%= report.getPrice() %></td>
        <td><%= report.getTotalPrice() %></td>
    </tr>
    <%
        }
    %>
</table>
<form action="ClearSalesReportServlet" method="post">
    <button type="submit">清除所有销售记录</button>
</form>
<% } %>
</body>
</html>
