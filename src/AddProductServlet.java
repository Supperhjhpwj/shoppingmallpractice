import dao.ProductDao;
import dao.Product;
import dao.SalesReport;
import dao.SalesReportDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.math.BigDecimal;

@WebServlet("/add_product")
public class AddProductServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        int price = Integer.parseInt(request.getParameter("price"));
        String description = request.getParameter("description");
        int stock = Integer.parseInt(request.getParameter("stock"));


        Product product = new Product();
        product.setName(name);
        product.setPrice(price);
        product.setDescription(description);
        product.setStock(stock);

        ProductDao productDao = new ProductDao();
        productDao.addProduct(product);
//        SalesReport salesReport=new SalesReport(product.getId(),name,0,price);
//        SalesReportDao salesReportDao=new SalesReportDao();
//        salesReportDao.addSalesReport(salesReport);

        response.sendRedirect("manage_products.jsp"); // 操作完成后重定向回商品管理页面
    }
}
