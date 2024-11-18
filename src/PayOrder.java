import dao.OrderDao;
import dao.Order;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Properties;

@WebServlet("/pay_order")
public class PayOrder extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String orderIdStr = request.getParameter("orderId");
        if (orderIdStr != null) {
            try {
                int orderId = Integer.parseInt(orderIdStr);
                OrderDao orderDao = new OrderDao();

                // 更新订单状态为“已支付”
                boolean paymentSuccess = orderDao.updateOrderStatus(orderId, "已支付");

                if (paymentSuccess) {
                    // 发送邮件通知用户
                    String userEmail = ""; // 根据订单获取用户邮箱
                    String subject = "支付成功通知";
                    String message = "您已成功购买订单编号：" + orderId;

                    sendEmail1(userEmail, subject, message); // 发送邮件

                    // 重定向到订单详情页面或用户订单页面
                    response.sendRedirect("view_orders");
                } else {
                    request.setAttribute("errorMessage", "支付失败，请重试！");
                    request.getRequestDispatcher("error.jsp").forward(request, response);
                }
            } catch (NumberFormatException e) {
                e.printStackTrace();
                request.setAttribute("errorMessage", "无效的订单编号！");
                request.getRequestDispatcher("error.jsp").forward(request, response);
            }
        } else {
            request.setAttribute("errorMessage", "未提供订单编号！");
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }
    }
    private void sendEmail1(String to, String subject, String messageText) {
        // SMTP 配置
        String host = "smtp.qq.com"; // SMTP 服务器地址
        final String username = "2379598385@qq.com"; // 发送者邮箱
        final String password = "******************"; // 发送者邮箱密码

        // 配置邮件会话属性
        Properties properties = new Properties();

        properties.put("mail.smtp.host", host);
        properties.put("mail.smtp.port", "587");
        properties.put("mail.smtp.auth", "true");
        properties.put("mail.smtp.starttls.enable", "true");


        // 创建邮件会话
        Session session = Session.getInstance(properties, new javax.mail.Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(username, password);
            }
        });

        try {
            // 创建邮件对象
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(username)); // 发送者邮箱
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to)); // 收件人邮箱
            message.setSubject(subject); // 邮件主题
            message.setText(messageText); // 邮件内容

            // 发送邮件
            Transport.send(message);
            System.out.println("邮件发送成功");

        } catch (MessagingException e) {
            e.printStackTrace(); // 打印错误信息
        }
    }

}
