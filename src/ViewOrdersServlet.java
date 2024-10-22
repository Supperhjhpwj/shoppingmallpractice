import dao.Order;
import dao.OrderDao;
import dao.myUser;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException.*;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet("/view_orders")
public class ViewOrdersServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        myUser user=(myUser) session.getAttribute("user");
        String username = user.getUsername(); ;  // 获取当前登录用户的用户名

        if (username != null) {
            OrderDao orderDao = new OrderDao();
            List<Order> userOrders = orderDao.getOrdersByUsername(username); // 获取该用户的订单

            request.setAttribute("orders", userOrders);  // 将订单列表保存到请求属性中
            request.getRequestDispatcher("user_orders.jsp").forward(request, response);  // 转发到 JSP 页面显示订单
        } else {
            response.sendRedirect("login.jsp");  // 如果用户未登录，重定向到登录页面
        }
    }
}
