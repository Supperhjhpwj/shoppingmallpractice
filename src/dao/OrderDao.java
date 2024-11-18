package dao;

import com.mchange.v2.c3p0.ComboPooledDataSource;
import com.mchange.v2.c3p0.ComboPooledDataSource;
import java.beans.PropertyVetoException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class OrderDao {
    private ComboPooledDataSource dataSource;

    public OrderDao() {
        // 初始化C3P0连接池
        dataSource = new ComboPooledDataSource();
        try {
            // 设置数据库连接属性
            dataSource.setDriverClass("com.mysql.cj.jdbc.Driver"); // JDBC 驱动类
            dataSource.setJdbcUrl("jdbc:mysql://localhost:3306/shopping_person"); // 数据库 URL
            dataSource.setUser("root"); // 数据库用户名
            dataSource.setPassword("1234"); // 数据库密码

            // 其他连接池配置（可选）
            dataSource.setInitialPoolSize(5);
            dataSource.setMinPoolSize(5);
            dataSource.setMaxPoolSize(20);
            dataSource.setAcquireIncrement(5);
            dataSource.setIdleConnectionTestPeriod(300); // 测试闲置连接的周期（秒）

        } catch (PropertyVetoException e) {
            e.printStackTrace();
        }
    }


    public boolean createOrder(Order order) {
        String sql = "INSERT INTO orders (username, total_amount, status) VALUES (?, ?, ?)";
        try (Connection connection = dataSource.getConnection();
             PreparedStatement ps = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
            ps.setString(1, order.getUsername());
            ps.setDouble(2, order.getTotalAmount());
            ps.setString(3, order.getStatus());

            int affectedRows = ps.executeUpdate();
            if (affectedRows == 0) {
                throw new SQLException("Creating order failed, no rows affected.");
            }

            try (ResultSet generatedKeys = ps.getGeneratedKeys()) {
                if (generatedKeys.next()) {
                    order.setOrderId(generatedKeys.getInt(1));
                    insertOrderItems(order.getOrderId(), order.getOrderItems()); // 插入订单项
                    return true;
                } else {
                    throw new SQLException("Creating order failed, no ID obtained.");
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
    public List<Order> getOrdersByUsername(String username) {
        List<Order> orders = new ArrayList<>();
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            conn = dataSource.getConnection();
            String query = "SELECT * FROM orders WHERE username = ?";
            stmt = conn.prepareStatement(query);
            stmt.setString(1, username);
            rs = stmt.executeQuery();

            while (rs.next()) {
                Order order = new Order();
                order.setOrderId(rs.getInt("order_id"));
                order.setUsername(rs.getString("username"));
                order.setTotalAmount(rs.getDouble("total_amount"));
                order.setStatus(rs.getString("status"));
                order.setOrderDate(rs.getTimestamp("order_date"));
                // 你可能需要在这里加载订单商品信息
                orders.add(order);
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) rs.close();
                if (stmt != null) stmt.close();
                if (conn != null) conn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        return orders;
    }



    // 通过订单ID获取订单
    public Order getOrderById(int orderId) {
        String sql = "SELECT * FROM orders WHERE order_id = ?";
        try (Connection connection = dataSource.getConnection();
             PreparedStatement ps = connection.prepareStatement(sql)) {

            ps.setInt(1, orderId);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return extractOrderFromResultSet(rs);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
    public boolean updateOrderStatus(int orderId, String status) {
        String sql = "UPDATE orders SET status = ? WHERE order_id = ?";
        try (Connection conn = dataSource.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, status);
            ps.setInt(2, orderId);
            int rowsAffected = ps.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    // 获取所有订单
    public List<Order> getAllOrders() {
        String sql = "SELECT * FROM orders";
        List<Order> orders = new ArrayList<>();
        try (Connection connection = dataSource.getConnection();
             Statement stmt = connection.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {

            while (rs.next()) {
                orders.add(extractOrderFromResultSet(rs));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return orders;
    }


    // 更新订单
//    public boolean updateOrder(Order order) {
//        String sql = "UPDATE orders SET username = ?, order_date = ?, total_amount = ?, status = ? WHERE order_id = ?";
//        try (Connection connection = dataSource.getConnection();
//             PreparedStatement ps = connection.prepareStatement(sql)) {
//
//            ps.setString(1, order.getUsername()); // 使用username
//            ps.setDate(2, new java.sql.Date(order.getOrderDate().getTime()));
//            ps.setInt(3, order.getTotalAmount()); // 使用setInt方法处理totalAmount
//            ps.setString(4, order.getStatus());
//            ps.setInt(5, order.getOrderId());
//
//            return ps.executeUpdate() > 0;
//        } catch (SQLException e) {
//            e.printStackTrace();
//            return false;
//        }
//    }

    // 删除订单
//    public boolean deleteOrder(int orderId) {
//        String sql = "DELETE FROM orders WHERE order_id = ?";
//        try (Connection connection = dataSource.getConnection();
//             PreparedStatement ps = connection.prepareStatement(sql)) {
//
//            ps.setInt(1, orderId);
//            return ps.executeUpdate() > 0;
//        } catch (SQLException e) {
//            e.printStackTrace();
//            return false;
//        }
//    }

    public boolean deleteOrder(int orderId) {
        Connection conn = null;
        PreparedStatement deleteItemsStmt = null;
        PreparedStatement deleteOrderStmt = null;

        try {
            conn = dataSource.getConnection();
            conn.setAutoCommit(false); // 启用事务

            // 1. 删除订单的商品条目
            String deleteItemsQuery = "DELETE FROM order_items WHERE order_id = ?";
            deleteItemsStmt = conn.prepareStatement(deleteItemsQuery);
            deleteItemsStmt.setInt(1, orderId);
            deleteItemsStmt.executeUpdate();

            // 2. 删除订单
            String deleteOrderQuery = "DELETE FROM orders WHERE order_id = ?";
            deleteOrderStmt = conn.prepareStatement(deleteOrderQuery);
            deleteOrderStmt.setInt(1, orderId);
            int rowsDeleted = deleteOrderStmt.executeUpdate();

            // 提交事务
            conn.commit();

            // 如果删除订单成功，rowsDeleted 应该为 1
            return rowsDeleted == 1;

        } catch (Exception e) {
            if (conn != null) {
                try {
                    conn.rollback(); // 如果发生错误，回滚事务
                } catch (Exception rollbackEx) {
                    rollbackEx.printStackTrace();
                }
            }
            e.printStackTrace();
            return false;
        } finally {
            try {
                if (deleteItemsStmt != null) deleteItemsStmt.close();
                if (deleteOrderStmt != null) deleteOrderStmt.close();
                if (conn != null) conn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }

    public void insertOrderItems(int orderId, List<OrderItem> orderItems) throws SQLException {
        String sql = "INSERT INTO order_items (order_id, product_id, product_name, quantity, price) VALUES (?, ?, ?, ?, ?)";

        try (Connection connection = dataSource.getConnection();
             PreparedStatement ps = connection.prepareStatement(sql)) {

            for (OrderItem item : orderItems) {
                ps.setInt(1, orderId);
                ps.setInt(2, item.getProductId());
                ps.setString(3, item.getProductName());
                ps.setInt(4, item.getQuantity());
                ps.setDouble(5, item.getPrice());
                ps.addBatch(); // 将每个插入操作加入批处理
            }
            ps.executeBatch(); // 执行批处理
        }
    }

    // 从ResultSet中提取订单对象
    private Order extractOrderFromResultSet(ResultSet rs) throws SQLException {
        Order order = new Order();
        order.setOrderId(rs.getInt("order_id"));
        order.setUsername(rs.getString("username")); // 从ResultSet获取username
        order.setOrderDate(rs.getDate("order_date"));
        order.setTotalAmount(rs.getDouble("total_amount")); // 使用getInt方法处理totalAmount
        order.setStatus(rs.getString("status"));
        return order;
    }
}
