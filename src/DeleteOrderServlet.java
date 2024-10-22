import dao.OrderDao;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException.*;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/delete_order")
public class DeleteOrderServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int orderId = Integer.parseInt(request.getParameter("orderId"));

        OrderDao orderDao = new OrderDao();
        boolean isDeleted = orderDao.deleteOrder(orderId);

        if (isDeleted) {
            // 删除成功，重定向回订单管理页面
            response.sendRedirect("manage_orders.jsp");
        } else {
            // 删除失败，显示错误消息
            request.setAttribute("errorMessage", "订单删除失败！");
            request.getRequestDispatcher("manage_orders.jsp").forward(request, response);
        }
    }
}
