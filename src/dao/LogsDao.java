package dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class LogsDao {

    // JDBC URL, 用户名和密码 (根据实际情况进行替换)
    private static final String JDBC_URL = "jdbc:mysql://localhost:3306/shopping_person";
    private static final String JDBC_USER = "root";
    private static final String JDBC_PASSWORD = "1234";  // 替换为实际密码

    public void logUserActivity(String username, String activityType, int productId, String details) {
        Connection conn = null;
        PreparedStatement pstmt = null;

        try {
            conn = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASSWORD);
            String sql = "INSERT INTO user_activity_logs (username, activity_type, product_id, details) VALUES (?, ?, ?, ?)";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, username);
            pstmt.setString(2, activityType);
            pstmt.setInt(3, productId);
            pstmt.setString(4, details);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close(pstmt, conn);
        }
    }
    public List<UserActivityLog> getUserActivityLogsbyusername(String username) {
        List<UserActivityLog> logs = new ArrayList<>();
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            conn = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASSWORD);
            String sql = "SELECT * FROM user_activity_logs WHERE username = ? ORDER BY timestamp DESC";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, username);
            rs = pstmt.executeQuery();

            while (rs.next()) {
                int id = rs.getInt("id");
                String activityType = rs.getString("activity_type");
                int productId = rs.getInt("product_id");
                Timestamp timestamp = rs.getTimestamp("timestamp");
                String details = rs.getString("details");

                UserActivityLog log = new UserActivityLog(id, username, activityType, productId, timestamp, details);
                logs.add(log);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close(rs, pstmt, conn);
        }

        return logs;
    }
    public List<UserActivityLog> getUserActivityLogs() {
        List<UserActivityLog> logs = new ArrayList<>();
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            conn = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASSWORD);
            String sql = "SELECT * FROM user_activity_logs ORDER BY timestamp DESC";
            pstmt = conn.prepareStatement(sql);

            rs = pstmt.executeQuery();

            while (rs.next()) {
                String username=rs.getString("username");
                int id = rs.getInt("id");
                String activityType = rs.getString("activity_type");
                int productId = rs.getInt("product_id");
                Timestamp timestamp = rs.getTimestamp("timestamp");
                String details = rs.getString("details");

                UserActivityLog log = new UserActivityLog(id, username, activityType, productId, timestamp, details);
                logs.add(log);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close(rs, pstmt, conn);
        }

        return logs;
    }

    public void clearLogs() {
        Connection conn = null;
        PreparedStatement pstmt = null;

        try {
            conn = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASSWORD);
            String sql = "DELETE FROM user_activity_logs";  // 替换为你的日志表名
            pstmt = conn.prepareStatement(sql);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            // 关闭资源
            close(pstmt, conn);
        }
    }

    public List<UserActivityLog> getUserActivityLogsByUsername(String username) {
        List<UserActivityLog> logs = new ArrayList<>();
        String query = "SELECT * FROM user_activity_logs WHERE username = ?";

        try (Connection connection = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASSWORD);
             PreparedStatement preparedStatement = connection.prepareStatement(query)) {

            preparedStatement.setString(1, username);
            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                int id = rs.getInt("id");
                String activityType = rs.getString("activity_type");
                int productId = rs.getInt("product_id");
                Timestamp timestamp = rs.getTimestamp("timestamp");
                String details = rs.getString("details");

                UserActivityLog log = new UserActivityLog(id,username,activityType,productId,timestamp,details);

                logs.add(log);
            }
        } catch (SQLException e) {
            e.printStackTrace(); // 处理异常
        }

        return logs;
    }




    // 关闭 PreparedStatement 和 Connection
    private void close(PreparedStatement pstmt, Connection conn) {
        try {
            if (pstmt != null) {
                pstmt.close();
            }
            if (conn != null) {
                conn.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // 关闭 ResultSet, PreparedStatement 和 Connection
    private void close(ResultSet rs, PreparedStatement pstmt, Connection conn) {
        try {
            if (rs != null) {
                rs.close();
            }
            if (pstmt != null) {
                pstmt.close();
            }
            if (conn != null) {
                conn.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
