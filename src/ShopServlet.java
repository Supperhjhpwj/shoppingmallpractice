import dao.Product;
import dao.ProductDao;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.io.IOException.*;
import java.util.List;


@WebServlet("/shop")
public class ShopServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ProductDao productDao = new ProductDao();
        List<Product> products = productDao.getAllProducts();

        // 将商品列表设置为请求属性
        request.setAttribute("products", products);

        // 转发到商品展示页面
        RequestDispatcher dispatcher = request.getRequestDispatcher("shop.jsp");
        dispatcher.forward(request, response);
    }
}
