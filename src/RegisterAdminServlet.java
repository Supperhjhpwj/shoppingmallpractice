import dao.UserDao;
import dao.myUser;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.io.IOException.*;


@WebServlet("/register_admin")
public class RegisterAdminServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String phoneNumber = request.getParameter("phoneNumber");
        String recipientName = request.getParameter("recipientName");
        String shippingAddress = request.getParameter("shippingAddress");
        String password = request.getParameter("password");
        UserDao userDao = new UserDao();
        boolean userExists = userDao.checkUserExists(username);

        response.setContentType("text/html;charset=UTF-8");
        if (userExists) {
            // 如果用户已存在，使用转发而不是重定向
            request.setAttribute("error", "用户已存在，请输入新的用户名！");
            request.getRequestDispatcher("register_admin.jsp").forward(request, response);
        } else {
            myUser newUser = new myUser(username, password, email, phoneNumber, recipientName, shippingAddress, "ADMINSon");
            boolean success = userDao.registerUser(newUser);

            if (success) {
                response.sendRedirect("customer_manage.jsp"); // 注册成功后重定向
            } else {
                // 处理注册失败
                request.setAttribute("error", "注册失败，请重试。");
                request.getRequestDispatcher("register_admin.jsp").forward(request, response);
            }
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 将 GET 请求转发到 register_admin.jsp 页面
        request.getRequestDispatcher("register_admin.jsp").forward(request, response);
    }
}

