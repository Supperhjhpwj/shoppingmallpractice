import dao.OrderDao;
import dao.myUser;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Properties;

@WebServlet("/payOrderServlet")
public class PayOrderServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        myUser user = (myUser) session.getAttribute("user"); // 获取当前用户

        if (user == null) {
            response.sendRedirect("login.jsp"); // 如果用户未登录，重定向到登录页面
            return;
        }

        String orderId = request.getParameter("orderId");
        OrderDao orderDao = new OrderDao();

        try {
            // 更新订单状态为已支付
            boolean paymentSuccess = orderDao.updateOrderStatus(Integer.parseInt(orderId), "已支付");
            if (paymentSuccess) {
                // 发送邮件通知用户
                String email = user.getEmail();
                String subject = "订单支付成功";
                String message = "您已成功购买订单，订单号: " + orderId;
                sendEmail1(email, subject, message); // 假设您有一个发送邮件的方法

                // 重新定向到订单详情页面
                response.sendRedirect("order.jsp?orderId=" + orderId);
            } else {
                request.setAttribute("errorMessage", "支付失败，请重试！");
                request.getRequestDispatcher("order.jsp").forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace(); // 打印错误信息
            request.setAttribute("errorMessage", "发生错误，请稍后重试！");
            request.getRequestDispatcher("order.jsp").forward(request, response);
        }
    }

    // 假设的邮件发送方法
    private void sendEmail(String to, String subject, String message) {
        // 使用 JavaMail API 或其他邮件发送库实现发送邮件的功能
    }
    // 邮件发送方法
    private void sendEmail1(String to, String subject, String messageText) {
        // SMTP 配置
        String host = "smtp.qq.com"; // SMTP 服务器地址
        final String username = "2379598385@qq.com"; // 发送者邮箱
        final String password = "*****************"; // 发送者邮箱密码

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
