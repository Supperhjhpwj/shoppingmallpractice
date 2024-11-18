import dao.LogsDao;
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
import java.io.IOException;

@WebServlet("/confirm_order")
public class ConfirmOrderServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int orderId = Integer.parseInt(request.getParameter("orderId"));
        // 假设 OrderDao 是一个用于操作订单的 DAO 类
        OrderDao orderDao = new OrderDao();

        orderDao.updateOrderStatus(orderId, "已签收");

        response.sendRedirect("view_orders");  // 更新后重定向回订单列表页面
    }
}
