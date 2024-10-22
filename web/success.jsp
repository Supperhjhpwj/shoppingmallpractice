<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 2024/10/9
  Time: 17:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>成功</title>
</head>
<body>
<h2>成功!</h2>
<p>欢迎, <%= request.getParameter("username") %>!</p>
<a href="index.jsp">返回主页</a>
</body>
</html>

