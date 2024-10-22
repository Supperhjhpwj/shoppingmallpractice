package dao;

import com.mchange.v2.c3p0.ComboPooledDataSource;

import java.beans.PropertyVetoException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
public class UserDao {
    private ComboPooledDataSource dataSource;

    // 构造函数
    public UserDao() {
        dataSource = new ComboPooledDataSource();
        try {
            dataSource.setDriverClass("com.mysql.cj.jdbc.Driver"); // 设置 JDBC 驱动
            dataSource.setJdbcUrl("jdbc:mysql://localhost:3306/shopping_person");
            dataSource.setUser("root");
            dataSource.setPassword("1234");
            dataSource.setInitialPoolSize(5);
            dataSource.setMinPoolSize(5);
            dataSource.setMaxPoolSize(20);
            dataSource.setAcquireIncrement(5);
            dataSource.setMaxIdleTime(300); // 300秒
        } catch (PropertyVetoException e) {
            e.printStackTrace();
        }
    }

    // 创建用户
    public void createUser(myUser user) {
        String sql = "INSERT INTO users (username, password, email, phone_number, recipient_name, shipping_address,role) VALUES (?, ?, ?, ?, ?, ?)";
        try (Connection conn = dataSource.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, user.getUsername());
            pstmt.setString(2, user.getPassword());
            pstmt.setString(3, user.getEmail());
            pstmt.setString(4, user.getPhoneNumber());
            pstmt.setString(5, user.getRecipientName());
            pstmt.setString(6, user.getShippingAddress());
            pstmt.setString(6, user.getShippingAddress());
            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // 根据用户名查找用户
    public myUser getUserByUsername(String username) {
        String sql = "SELECT * FROM users WHERE username = ?";
        myUser user = null;
        try (Connection conn = dataSource.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, username);
            ResultSet rs = pstmt.executeQuery();
            if (rs.next()) {
                user = new myUser();
                user.setUsername(rs.getString("username"));
                user.setPassword(rs.getString("password"));
                user.setEmail(rs.getString("email"));
                user.setPhoneNumber(rs.getString("phonenumber"));
                user.setRecipientName(rs.getString("recipientName"));
                user.setShippingAddress(rs.getString("shippingaddress"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return user;
    }

    // 更新用户信息
    public void updateUser(myUser user) {
        String sql = "UPDATE users SET password = ?, email = ?, phonenumber = ?, recipientName = ?, shippingAddress = ? WHERE username = ?";
        try (Connection conn = dataSource.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, user.getPassword());
            pstmt.setString(2, user.getEmail());
            pstmt.setString(3, user.getPhoneNumber());
            pstmt.setString(4, user.getRecipientName());
            pstmt.setString(5, user.getShippingAddress());
            pstmt.setString(6, user.getUsername());
            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // 删除用户
    public void deleteUser(String username) {
        String sql = "DELETE FROM users WHERE username = ?";
        try (Connection conn = dataSource.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, username);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // 获取所有用户
    public List<myUser> getAllUsers() {
        List<myUser> users = new ArrayList<>();
        String sql = "SELECT * FROM users";
        try (Connection conn = dataSource.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql);
             ResultSet rs = pstmt.executeQuery()) {
            while (rs.next()) {
                myUser user = new myUser();
                user.setUsername(rs.getString("username"));
                user.setPassword(rs.getString("password"));
                user.setEmail(rs.getString("email"));
                user.setPhoneNumber(rs.getString("phone_number"));
                user.setRecipientName(rs.getString("recipient_name"));
                user.setShippingAddress(rs.getString("shipping_address"));
                users.add(user);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return users;
    }

    // 在 UserDao 类中

    public boolean checkUserExists(String username) {
        String sql = "SELECT COUNT(*) FROM users WHERE username = ?";

        try (Connection conn = dataSource.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            // 设置查询的参数，将输入的用户名绑定到 SQL 语句中
            stmt.setString(1, username);

            // 执行查询
            ResultSet rs = stmt.executeQuery();

            // 如果有返回结果，检查查询结果的数量
            if (rs.next()) {
                // 如果 COUNT(*) 大于 0，说明用户名已存在
                return rs.getInt(1) > 0;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        // 如果 SQL 查询出错或用户名不存在，则返回 false
        return false;
    }

    public boolean registerUser(myUser newUser) {
        String sql = "INSERT INTO users (username, password,email, phoneNumber, recipientName, shippingAddress,role) VALUES (?, ?, ?, ?, ?,?,?)";

        try (Connection conn = dataSource.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            // 设置 SQL 参数
            stmt.setString(1, newUser.getUsername());
//            stmt.setString(2, hashPassword(newUser.getPassword()));  // 对密码进行加密
            stmt.setString(2, newUser.getPassword());  // 对密码进行不加密
            stmt.setString(3, newUser.getEmail());
            stmt.setString(4, newUser.getPhoneNumber());
            stmt.setString(5, newUser.getRecipientName());
            stmt.setString(6, newUser.getShippingAddress());
            stmt.setString(7, newUser.getRole());

            // 执行插入操作，成功则返回 true
            int rowsInserted = stmt.executeUpdate();
            return rowsInserted > 0;

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return false;  // 如果插入操作失败，返回 false
    }

    // 密码加密方法，使用 SHA-256
    private String hashPassword(String password) {
        try {
            MessageDigest md = MessageDigest.getInstance("SHA-256");
            byte[] hashedPassword = md.digest(password.getBytes());
            StringBuilder sb = new StringBuilder();
            for (byte b : hashedPassword) {
                sb.append(String.format("%02x", b));
            }
            return sb.toString();
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        }
        return null;
    }

    public myUser getUserByUsernameAndPassword(String username, String password) {
        String sql = "SELECT * FROM users WHERE username = ?";
        try (Connection conn = dataSource.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, username);
            ResultSet rs = stmt.executeQuery();
            System.out.println("进入");

            if (rs.next()) {
                String storedHashedPassword = rs.getString("password");
                System.out.println(storedHashedPassword);

                // 对用户输入的密码进行哈希处理
//                String inputHashedPassword = hashPassword(password);
                  String inputHashedPassword=password;
                System.out.println(inputHashedPassword);

                // 比较哈希后的密码
                if (inputHashedPassword != null && inputHashedPassword.equals(storedHashedPassword)) {
                    System.out.println("进入2");
                    return new myUser(
                            rs.getString("username"),
                            rs.getString("password"),
                            rs.getString("email"),
                            rs.getString("phonenumber"),
                            rs.getString("recipientName"),
                            rs.getString("shippingAddress"),
                            rs.getString("role")
                    );
                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return null;
    }

}
