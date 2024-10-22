import dao.OrderDao;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException.*;


import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
@WebServlet("/ship_order")
public class ShipOrderServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int orderId = Integer.parseInt(request.getParameter("orderId"));
        OrderDao orderDao = new OrderDao();

        // 更新订单状态为 "已发货"
        boolean success = orderDao.updateOrderStatus(orderId, "已发货");

        if (success) {
            response.sendRedirect("manage_orders.jsp"); // 成功后重定向到订单管理页面
        } else {
            response.getWriter().write("发货失败，请重试。");
        }
    }
}
