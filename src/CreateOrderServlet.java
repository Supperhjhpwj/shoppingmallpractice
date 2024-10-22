

import dao.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet("/CreateOrderServlet")
public class CreateOrderServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        myUser user = (myUser) session.getAttribute("user"); // 获取当前用户
        LogsDao logsDao=new LogsDao();
        ProductDao productDao=new ProductDao();
//        SalesReportDao salesReportDao=new SalesReportDao();

        if (user == null) {
            response.sendRedirect("login.jsp"); // 如果用户未登录，重定向到登录页面
            return;
        }

        // 从购物车获取商品信息
        CartDao cartDao = new CartDao();
        List<CartItem> cartItems = cartDao.getCartItems(user.getUsername());

        if (cartItems.isEmpty()) {
            response.sendRedirect("cart"); // 购物车为空，返回购物车页面
            return;
        }

        for(CartItem cartItem:cartItems)
        {
            int c=productDao.getRecentSellById(cartItem.getProduct().getId());

            System.out.println("heuiwbfiu");
            if(cartItem.getQuantity()!=0)
            {System.out.println("heuiwbfiu1");
                productDao.updatersell(cartItem.getProduct(),c+cartItem.getQuantity());
            }

//            SalesReport salesReport=salesReportDao.getSalesReportsById(cartItem.getProduct().getId());
            logsDao.logUserActivity(user.getUsername(), "购买",cartItem.getProduct().getId() , "用户购买了产品");
//

        }

        // 创建订单
        Order order = new Order();
        order.setUsername(user.getUsername());
        order.setStatus("待支付"); // 设置订单状态
        System.out.println(user.getUsername());
        order.setOrderItems(cartItems.stream().map(item -> {
            Product product = item.getProduct();
            return new OrderItem(0, 0, product.getId(), product.getName(), item.getQuantity(), product.getPrice());
        }).toList());

        int totalAmount = cartItems.stream().mapToInt(item -> (int) (item.getProduct().getPrice() * item.getQuantity())).sum();
        order.setTotalAmount(totalAmount);


        OrderDao orderDao = new OrderDao();
        System.out.println("这一步有了");
        if (orderDao.createOrder(order)) {
            // 订单创建成功，重定向到订单页面
            System.out.println("订单创建成功");
            cartDao.clearCartbyname(user.getUsername());
            response.sendRedirect("order.jsp?orderId=" + order.getOrderId());

        } else {
            // 订单创建失败，返回购物车页面
            response.sendRedirect("cart.jsp");
        }
    }
}

