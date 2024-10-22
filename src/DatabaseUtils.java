//import java.sql.Connection;
//import java.sql.DriverManager;
//import java.sql.SQLException;
//
//public class DatabaseUtils
//{
//    private static final String URL = "jdbc:mysql://localhost:3306/shopping_person?serverTimezone%2B8";
//    private static final String USER = "root";
//    private static final String PASSWORD = "1234";
//
//
//    public static Connection getConnection() throws SQLException, ClassNotFoundException {
//        Class.forName("com.mysql.cj.jdbc.Driver"); System.out.println("成功进入");
//
//        return DriverManager.getConnection(URL, USER, PASSWORD);
//    }
//}


import com.mchange.v2.c3p0.ComboPooledDataSource;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DatabaseUtils {

    // 使用 C3P0 提供的连接池
    private static ComboPooledDataSource dataSource = new ComboPooledDataSource();

    // 获取数据库连接
    public static Connection getConnection() {
        Connection conn = null;
        try {
            conn = dataSource.getConnection();  // 从连接池中获取连接
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return conn;
    }

    // 关闭资源
    public static void close(ResultSet rs, PreparedStatement pstmt, Connection conn) {
        try {
            if (rs != null) {
                rs.close();
            }
            if (pstmt != null) {
                pstmt.close();
            }
            if (conn != null) {
                conn.close();  // 连接会被返回到连接池而不是被关闭
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // 关闭没有 ResultSet 的资源
    public static void close(PreparedStatement pstmt, Connection conn) {
        close(null, pstmt, conn);
    }
}

