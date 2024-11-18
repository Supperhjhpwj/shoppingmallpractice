<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>新增管理员用户</title>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Roboto', sans-serif;
            background-color: #f8f9fa;
            margin: 0;
            padding: 0;
            color: #333;
        }
        .form-container {
            max-width: 600px;
            margin: 50px auto;
            background: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
            transition: box-shadow 0.3s;
        }
        .form-container:hover {
            box-shadow: 0 8px 40px rgba(0, 0, 0, 0.2);
        }
        h2 {
            text-align: center;
            margin-bottom: 20px;
            color: #007BFF;
        }
        input {
            width: 100%;
            padding: 8px; /* 减小内边距 */
            margin: 10px 0;
            border: 1px solid #ccc;
            border-radius: 5px;
            transition: border-color 0.3s;
            font-size: 14px; /* 减小字体大小 */
            box-shadow: inset 0 1px 3px rgba(0, 0, 0, 0.1);
        }
        input:focus {
            border-color: #007BFF;
            outline: none;
            box-shadow: 0 0 5px rgba(0, 123, 255, 0.5); /* 增加外阴影 */
        }
        button {
            width: 100%;
            padding: 12px; /* 增加内边距 */
            background-color: #007BFF;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px; /* 增加字体大小 */
            transition: background-color 0.3s;
        }
        button:hover {
            background-color: #0056b3;
        }
        a {
            display: block;
            text-align: center;
            margin-top: 15px;
            color: #007BFF;
            text-decoration: none;
        }
        a:hover {
            text-decoration: underline;
        }
        footer {
            text-align: center;
            margin-top: 30px;
            color: #777;
        }
    </style>
</head>
<body>

<div class="form-container">
    <h2>新增管理员用户</h2>
    <form action="register_admin" method="post">
        <input type="text" name="username" placeholder="用户名" required>
        <input type="email" name="email" placeholder="邮箱" required>
        <input type="text" name="phoneNumber" placeholder="联系电话" required>
        <input type="text" name="recipientName" placeholder="收件人姓名" required>
        <input type="text" name="shippingAddress" placeholder="收件人地址" required>
        <input type="password" name="password" placeholder="密码" required>
        <button type="submit">注册</button>
    </form>
</div>

<a href="admin_dashboard.jsp">返回管理员首页</a>
<footer>
    &copy; 2024 购物中心 | All rights reserved | 华南理工大学 黄劲恒
</footer>

<% String error = (String) request.getAttribute("error"); %>
<% if (error != null) { %>
<script>
    alert('<%= error %>');
</script>
<% } %>

</body>
</html>
