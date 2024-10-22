import dao.Product;
import dao.ProductDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/searchProducts")
public class SearchProductsServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String query = request.getParameter("query");

        ProductDao productDao = new ProductDao();
        List<Product> products = productDao.searchProductsByName(query);  // 新增的方法

        request.setAttribute("products", products);
        request.getRequestDispatcher("shop.jsp").forward(request, response);
    }
}
