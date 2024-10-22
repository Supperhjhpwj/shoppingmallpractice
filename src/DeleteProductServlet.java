import dao.ProductDao;
import dao.SalesReport;
import dao.SalesReportDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/delete_product")
public class DeleteProductServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));

        ProductDao productDao = new ProductDao();
        productDao.deleteProduct(id);
//        SalesReportDao salesReportDao=new SalesReportDao();
//        salesReportDao.deletereportitem(id);


        response.sendRedirect("manage_products.jsp");
    }
}
