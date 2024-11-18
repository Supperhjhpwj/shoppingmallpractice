import dao.CartDao;
import dao.CartItem;
import dao.ProductDao;
import dao.myUser;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.io.IOException.*;
import java.io.PrintWriter;
import java.util.List;


@WebServlet("/UpdateCartServlet")
public class UpdateCartServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, IOException {
        HttpSession session = request.getSession();
        myUser user = (myUser) session.getAttribute("user");
        PrintWriter out = response.getWriter();
        if (user != null) {
            CartDao cartDao = new CartDao();
            List<CartItem> cartItems = cartDao.getCartItems(user.getUsername());
            ProductDao productDao=new ProductDao();
            int newQuantity = Integer.parseInt(request.getParameter("newQuantity"));
            int id=Integer.parseInt(request.getParameter("productId"));
            for (CartItem item : cartItems) {
                if(id!=item.getProduct().getId())
                {
                    continue;
                }

                 // 获取用户输入的新数量
                if(item.getProduct().getStock()-newQuantity+item.getQuantity()>=0)
                {
                    productDao.updateProductstockbyid(item.getProduct().getStock()-newQuantity+item.getQuantity(),item.getProduct().getId());
                    cartDao.updateQuantity(user.getUsername(), item.getProduct().getId(), newQuantity); // 更新数据库中的商品数量
                }
                else {
                    out.println("<script type=\"text/javascript\">");
                    out.println("alert('商品库存不足，修改失败');"); // 弹出提示框
                    out.println("window.location.href = 'cart.jsp';"); // 重定向回购物车页面
                    out.println("</script>");

                    response.sendRedirect("cart.jsp"); // 重定向回购物车页面
                }

            }
        }

        response.sendRedirect("cart.jsp"); // 重定向回购物车页面
    }
}
