import dao.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet("/cart")
public class CartServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        myUser user = (myUser) session.getAttribute("user");
        int id = Integer.parseInt(request.getParameter("id"));
        System.out.println(id);
        String name = request.getParameter("name");
        String price = request.getParameter("price");
        int stock =Integer.parseInt(request.getParameter("stock"));
        LogsDao logsDao=new LogsDao();
        logsDao.logUserActivity(user.getUsername(), "浏览", id, "用户浏览了产品页面");

        if (user == null) {
            response.sendRedirect("login.jsp"); // 用户未登录，重定向到登录页面
            return;
        }
        if(stock==0)
        {
            request.setAttribute("errorMessage", "该商品已售罄。"); // 提示用户无库存
            request.getRequestDispatcher("shop.jsp").forward(request, response); // 返回商品页面
            return;
            //弹出信息没货，还保留在原先的shopjsp
        }
        else
        {

            CartDao cartDao = new CartDao();
            cartDao.addCartItem(user.getUsername(), id,1);
            ProductDao productDao=new ProductDao();
            productDao.updateProductstockbyid(stock-1,id);

        }


//        List<CartItem> cartItems = cartDao.getCartItems(user.getUsername()); // 获取购物车商品
//        System.out.println(user.getUsername());

        // 将购物车商品设置为请求属性
//        request.setAttribute("cartItems", cartItems);
        request.getRequestDispatcher("cart.jsp").forward(request, response); // 转发到购物车页面
    }
}
