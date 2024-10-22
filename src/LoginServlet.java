import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import dao.myUser;
import dao.UserDao;


@WebServlet("/login")


public class LoginServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        UserDao userDao = new UserDao();
        myUser user = userDao.getUserByUsernameAndPassword(username, password);

        if (user != null) {
            HttpSession session = request.getSession();
            session.setAttribute("user", user);

            if ("ADMIN".equals(user.getRole())) {
                response.sendRedirect("admin_dashboard.jsp");  // 管理员跳转至管理页面
            } else {
                response.sendRedirect("userDashboard.jsp");  // 普通用户跳转至用户页面
            }
        } else {
            response.getWriter().println("用户名或密码错误，请重试！");
        }
    }


}
