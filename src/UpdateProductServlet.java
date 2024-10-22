import dao.Product;
import dao.ProductDao;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.io.IOException.*;


@WebServlet("/update_product")
public class UpdateProductServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        double price = Double.parseDouble(request.getParameter("price"));
        String description = request.getParameter("description");
        int stock = Integer.parseInt(request.getParameter("stock"));

        ProductDao productDao = new ProductDao();
        Product product = new Product(id, name, price, description, stock);

        boolean success = productDao.updateProduct(product); // 更新商品信息
        if (success) {
            response.sendRedirect("manage_products.jsp"); // 重定向到商品管理页面
        } else {
            response.getWriter().write("更新商品失败，请重试！");
        }
    }
}
