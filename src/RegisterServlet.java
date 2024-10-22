//import javax.servlet.ServletException;
//import javax.servlet.annotation.WebServlet;
//import javax.servlet.http.HttpServlet;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//import java.io.IOException;
//import java.sql.Connection;
//import java.sql.PreparedStatement;
//
//@WebServlet("/register")
//public class RegisterServlet extends HttpServlet {
//    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        request.setCharacterEncoding("UTF-8");
//        response.setContentType("text/html; charset=UTF-8");
//
//        String username = request.getParameter("username");
//        String password = request.getParameter("password");
//
//        try (Connection connection = DatabaseUtils.getConnection()) {
//            String sql = "INSERT INTO users (username, password) VALUES (?, ?)";
//            PreparedStatement preparedStatement = connection.prepareStatement(sql);
//            preparedStatement.setString(1, username);
//            preparedStatement.setString(2, password); // 在实际中应该对密码进行加密
//            int rowsAffected = preparedStatement.executeUpdate();
//
//            if (rowsAffected > 0) {
//                response.getWriter().println("注册成功，欢迎 " + username + "!");
//            } else {
//                response.getWriter().println("注册失败，请重试。");
//            }
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//    }
//}
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import dao.UserDao;
import dao.myUser;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

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

        if (userExists) {
            response.getWriter().println("用户已存在！");
        } else {
            myUser newUser = new myUser(username, password, email, phoneNumber,recipientName, shippingAddress,"USER");  // 默认注册为普通用户
            boolean b=userDao.registerUser(newUser);
            if(b)
            {
                response.getWriter().println("插入成功！");
            }
            response.getWriter().println("注册成功！");
        }
    }
}

