package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CartDao {

    // JDBC URL, 用户名和密码 (根据实际情况进行替换)
    private static final String JDBC_URL = "jdbc:mysql://localhost:3306/shopping_person";
    private static final String JDBC_USER = "root";
    private static final String JDBC_PASSWORD = "1234";  // 替换为实际密码

    // 保存购物车信息到数据库
    public void saveCart(Cart cart, int userId) {
        Connection conn = null;
        PreparedStatement pstmt = null;

        try {
            // 获取数据库连接
            conn = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASSWORD);

            String sql = "INSERT INTO carts (user_id, product_id, quantity, created_at) VALUES (?, ?, ?, NOW())";
            pstmt = conn.prepareStatement(sql);

            for (CartItem item : cart.getItems()) {
                pstmt.setInt(1, userId);
                pstmt.setInt(2, item.getProduct().getId());
                pstmt.setInt(3, item.getQuantity());
                pstmt.executeUpdate();
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            // 关闭资源
            close(pstmt, conn);
        }
    }

    // 从数据库加载购物车
    public Cart loadCart(int userId) {
        Cart cart = new Cart();
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            // 获取数据库连接
            conn = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASSWORD);

            String sql = "SELECT p.id, p.name, p.price, c.quantity FROM carts c JOIN products p ON c.product_id = p.id WHERE c.user_id = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, userId);
            rs = pstmt.executeQuery();

            while (rs.next()) {
                int productId = rs.getInt("id");
                String name = rs.getString("name");
                double price = rs.getDouble("price");
                int quantity = rs.getInt("quantity");

                Product product = new Product(productId, name, price, "", 0);  // 假设不需要描述和库存
                cart.addItem(product, quantity);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            // 关闭资源
            close(rs, pstmt, conn);
        }

        return cart;
    }

    // 清空用户购物车
    public void clearCartbyid(int userId) {
        Connection conn = null;
        PreparedStatement pstmt = null;

        try {
            // 获取数据库连接
            conn = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASSWORD);

            String sql = "DELETE FROM carts WHERE user_id = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, userId);
            pstmt.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            // 关闭资源
            close(pstmt, conn);
        }
    }
    public void clearCartbyname(String username) {
        Connection conn = null;
        PreparedStatement pstmt = null;

        try {
            // 获取数据库连接
            conn = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASSWORD);

            String sql = "DELETE FROM carts WHERE username = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, username);
            pstmt.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            // 关闭资源
            close(pstmt, conn);
        }
    }
    public CartItem getCartItem(String username, int productId) {
        CartItem cartItem = null;
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            // 获取数据库连接
            conn = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASSWORD);

            // 查询购物车中属于用户的特定商品
            String sql = "SELECT p.id, p.name, p.price, p.description, p.stock, c.quantity " +
                    "FROM carts c " +
                    "JOIN products p ON c.product_id = p.id " +
                    "WHERE c.username = ? AND c.product_id = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, username);
            pstmt.setInt(2, productId); // 第二个参数应该是 productId，而不是使用同一个索引设置 username

            rs = pstmt.executeQuery();

            // 检查是否有数据
            if (rs.next()) {
                // 从结果集中获取数据
                int id = rs.getInt("id");
                String name = rs.getString("name");
                double price = rs.getDouble("price");
                String description = rs.getString("description");
                int stock = rs.getInt("stock");
                int quantity = rs.getInt("quantity");

                // 创建商品对象并构建购物车项
                Product product = new Product(id, name, price, description, stock);
                cartItem = new CartItem(product, quantity);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            // 关闭资源
            close(rs, pstmt, conn);
        }

        return cartItem; // 返回特定的购物车商品
    }

    public List<CartItem> getCartItems(String username) {
        List<CartItem> cartItems = new ArrayList<>();
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            // 获取数据库连接
            conn = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASSWORD);

            // 查询购物车中属于用户的商品
            String sql = "SELECT p.id, p.name, p.price, p.description, p.stock, c.quantity " +
                    "FROM carts c " +
                    "JOIN products p ON c.product_id = p.id " +
                    "WHERE c.username = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, username);
            rs = pstmt.executeQuery();

            // 遍历结果集并将商品信息添加到列表中
            while (rs.next()) {
                int productId = rs.getInt("id");
                String name = rs.getString("name");
                double price = rs.getDouble("price");
                String description = rs.getString("description");
                int stock = rs.getInt("stock");
                int quantity = rs.getInt("quantity");

                // 创建商品对象并添加到购物车商品列表
                Product product = new Product(productId, name, price, description, stock);
                CartItem cartitem=new CartItem(product,quantity);
                cartitem.setQuantity(quantity);  // 假设你有一个字段来设置数量

                    cartItems.add(cartitem);



            }

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            // 关闭资源
            close(rs, pstmt, conn);
        }

        return cartItems;
    }

    public void addCartItem(String username, int productId, int quantity) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            // 获取数据库连接
            conn = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASSWORD);

            // 先检查购物车中是否已经有该商品
            String checkSql = "SELECT quantity FROM carts WHERE username = ? AND product_id = ?";
            pstmt = conn.prepareStatement(checkSql);
            pstmt.setString(1, username);
            pstmt.setInt(2, productId);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                // 如果购物车中已有该商品，则更新数量
                int existingQuantity = rs.getInt("quantity");
                String updateSql = "UPDATE carts SET quantity = ? WHERE username = ? AND product_id = ?";
                pstmt = conn.prepareStatement(updateSql);
                pstmt.setInt(1, existingQuantity + quantity);  // 更新商品数量
                pstmt.setString(2, username);
                pstmt.setInt(3, productId);
                pstmt.executeUpdate();
            } else {
                // 如果购物车中没有该商品，则插入新记录
                String insertSql = "INSERT INTO carts (username, product_id, quantity) VALUES (?, ?, ?)";
                pstmt = conn.prepareStatement(insertSql);
                pstmt.setString(1, username);
                pstmt.setInt(2, productId);
                pstmt.setInt(3, quantity);
                pstmt.executeUpdate();
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            // 关闭资源
            close(rs, pstmt, conn);
        }
    }

    // 更新购物车中商品的数量
    public void updateQuantity(String username, int productId, int newQuantity) {
        Connection connection = null;
        PreparedStatement preparedStatement = null;

        try {
            // 获取数据库连接
            connection = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASSWORD);


            // SQL 更新语句，更新购物车中某个商品的数量
            String sql = "UPDATE carts SET quantity = ? WHERE username = ? AND product_id = ?";

            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1, newQuantity); // 设置新的数量
            preparedStatement.setString(2, username); // 设置用户名
            preparedStatement.setInt(3, productId);   // 设置商品ID

            // 执行更新操作
            preparedStatement.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            // 关闭数据库连接和 PreparedStatement
            if (preparedStatement != null) {
                try {
                    preparedStatement.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            if (connection != null) {
                try {
                    connection.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
    }
    // 移除购物车中的商品
    public void removeItem(String username, int productId) {
        Connection conn = null;
        PreparedStatement ps = null;

        try {
            // 获取数据库连接
            conn = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASSWORD);


            // 删除指定用户和商品ID的购物车条目
            String sql = "DELETE FROM carts WHERE username = ? AND product_id = ?";
            ps = conn.prepareStatement(sql);
            ps.setString(1, username); // 设置用户名参数
            ps.setInt(2, productId);    // 设置商品ID参数

            // 执行删除操作
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            // 关闭资源
            if (ps != null) {
                try {
                    ps.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
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
