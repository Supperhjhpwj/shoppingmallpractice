import dao.UserDao;
import dao.myUser; // 确保导入正确的 User 类

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/edit_profile")
public class EditProfileServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        myUser user = (myUser) session.getAttribute("user");

        request.setAttribute("user", user);
        request.getRequestDispatcher("edit_profile.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


        // 获取表单数据
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String recipientName = request.getParameter("recipientName");
        String shippingAddress = request.getParameter("shippingAddress");

        UserDao userDao = new UserDao();
        myUser user=new myUser(username, password, email, phone, recipientName, shippingAddress,"USER");
        HttpSession session = request.getSession();


        // 更新用户信息
        userDao.updateUser(user);
        session.setAttribute("user", user);

        response.sendRedirect("view_profile"); // 修改后重定向回查看个人信息页面
    }
}
