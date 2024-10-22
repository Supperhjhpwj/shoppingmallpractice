

import dao.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet("/ClearCart")
public class ClearCart extends HttpServlet {
   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      HttpSession session = request.getSession();
      myUser user = (myUser) session.getAttribute("user"); // 获取当前用户

      if (user == null) {
         response.sendRedirect("login.jsp"); // 如果用户未登录，重定向到登录页面
         return;
      }

      // 从购物车获取商品信息
      CartDao cartDao = new CartDao();

      List<CartItem> cartItems=cartDao.getCartItems(user.getUsername());
      ProductDao productDao=new ProductDao();

      for(CartItem item : cartItems)
      {
         productDao.updateProductstockbyid(item.getProduct().getStock()+item.getQuantity(),item.getProduct().getId());
      }
      cartDao.clearCartbyname(user.getUsername());


      response.sendRedirect("cart.jsp");

   }
}

