import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import dao.UserDao;
import dao.myUser;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String email = request.getParameter("email");
        String phoneNumber = request.getParameter("phoneNumber");
        String recipientName = request.getParameter("recipientName");
        String shippingAddress = request.getParameter("shippingAddress");

        UserDao userDao = new UserDao();
        boolean userExists = userDao.checkUserExists(username);

        response.setContentType("text/html;charset=UTF-8");
        if (userExists) {
            response.getWriter().println("<script>alert('用户已存在，请输入新的用户名！'); window.location.href='register.jsp';</script>");
        } else {
            myUser newUser = new myUser(username, password, email, phoneNumber, recipientName, shippingAddress, "USER");  // 默认注册为普通用户
            boolean registrationSuccess = userDao.registerUser(newUser);
            if (registrationSuccess) {
                response.sendRedirect("login.jsp"); // 注册成功，重定向到登录页面
            } else {
                response.getWriter().println("<script>alert('注册失败，请重试。'); window.location.href='register.jsp';</script>");
            }
        }
    }
}
