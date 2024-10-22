import dao.CartDao;
import dao.Product;
import dao.ProductDao;
import dao.myUser;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.io.IOException.*;


@WebServlet("/RemoveItemServlet")
public class RemoveItemServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, IOException {
        HttpSession session = request.getSession();
        myUser user = (myUser) session.getAttribute("user");

        if (user != null) {
            int productId = Integer.parseInt(request.getParameter("productId"));
            CartDao cartDao = new CartDao();
            ProductDao productDao=new ProductDao();
            Product product=productDao.getProductById(productId);
            productDao.updateProductstockbyid(product.getStock()+cartDao.getCartItem(user.getUsername(),productId).getQuantity(),productId);
            cartDao.removeItem(user.getUsername(), productId); // 删除该商品
        }

        response.sendRedirect("cart.jsp"); // 重定向回购物车页面
    }
}
