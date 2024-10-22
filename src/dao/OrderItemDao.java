package dao;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class OrderItemDao {

    // 数据库连接信息
    private static final String URL = "jdbc:mysql://localhost:3306/shopping_person"; // 数据库URL
    private static final String USER = "root"; // 数据库用户名
    private static final String PASSWORD = "1234"; // 数据库密码

    // 获取数据库连接
    private Connection getConnection() throws SQLException {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver"); // 加载MySQL驱动
            return DriverManager.getConnection(URL, USER, PASSWORD); // 建立连接
        } catch (ClassNotFoundException e) {
            System.out.println("数据库驱动加载失败！");
            e.printStackTrace();
            throw new SQLException(e);
        }
    }

    // 根据 orderId 获取所有的 OrderItem
    public List<OrderItem> getOrderItemsByOrderId(int orderId) {
        List<OrderItem> orderItems = new ArrayList<>();
        String query = "SELECT * FROM order_items WHERE order_id = ?"; // SQL查询语句

        try (Connection connection = getConnection(); // 获取数据库连接
             PreparedStatement pstmt = connection.prepareStatement(query)) {

            pstmt.setInt(1, orderId); // 设置查询参数
            ResultSet rs = pstmt.executeQuery(); // 执行查询
            System.out.println("nihao");

            // 遍历结果集，将每一行转换为 OrderItem 对象并加入列表
            while (rs.next()) {
                int orderItemId = rs.getInt("id");
                int productId = rs.getInt("product_id");
                String productName = rs.getString("product_name");
                int quantity = rs.getInt("quantity");
                double price = rs.getDouble("price");
                System.out.println(productName);

                OrderItem item = new OrderItem(orderItemId, orderId, productId, productName, quantity, price);
                orderItems.add(item);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return orderItems;
    }
}