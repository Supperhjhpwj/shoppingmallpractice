import dao.UserDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/delete_user")
public class DeleteUserServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("userName");

        UserDao userDao = new UserDao();
        boolean success = userDao.deleteUser1(username); // 假设有一个方法可以删除用户

        if (success) {
            response.sendRedirect("customer_manage.jsp"); // 删除成功后重定向
        } else {
            // 处理删除失败（如用户不存在等）
            request.setAttribute("error", "删除失败，请重试。");
            request.getRequestDispatcher("admin_management.jsp").forward(request, response);
        }
    }
}
