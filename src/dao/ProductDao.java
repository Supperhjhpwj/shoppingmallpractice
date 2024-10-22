package dao;

import com.mchange.v2.c3p0.ComboPooledDataSource;
import dao.Product;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ProductDao {
    private ComboPooledDataSource dataSource;

    // Constructor to initialize the connection pool
    public ProductDao() {
        dataSource = new ComboPooledDataSource();
        dataSource.setJdbcUrl("jdbc:mysql://localhost:3306/shopping_person");
        dataSource.setUser("root");
        dataSource.setPassword("1234");
        dataSource.setMaxPoolSize(20);
    }

    // Add a new product to the database
    public boolean addProduct(Product product) {
        String sql = "INSERT INTO products (name, price, description, stock) VALUES (?, ?, ?, ?)";
        try (Connection connection = dataSource.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {

            statement.setString(1, product.getName());
            statement.setDouble(2, product.getPrice());
            statement.setString(3, product.getDescription());
            statement.setInt(4, product.getStock());  // 设置库存值
//            // 获取生成的自增 ID
//            ResultSet rs = statement.getGeneratedKeys();
//            if (rs.next()) {
//                product.setId(rs.getInt(1));  // 设置产品对象的 ID
//            }

            int rowsInserted = statement.executeUpdate();
            return rowsInserted > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
    public boolean refeshstatisc() {
        String sql = "update products set recent_sell=0";
        try (Connection connection = dataSource.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {

//            statement.setString(1, product.getName());
//            statement.setDouble(2, product.getPrice());
//            statement.setString(3, product.getDescription());
//            statement.setInt(4, product.getStock());  // 设置库存值
//            // 获取生成的自增 ID
//            ResultSet rs = statement.getGeneratedKeys();
//            if (rs.next()) {
//                product.setId(rs.getInt(1));  // 设置产品对象的 ID
//            }

            int rowsInserted = statement.executeUpdate();
            return rowsInserted > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
    public boolean updatersell(Product product,int sellhowmuch) {
        String sql = "update products set recent_sell=? where id=?";
        try (Connection connection = dataSource.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {

            statement.setInt(1, sellhowmuch);
            statement.setInt(2, product.getId());
//            statement.setDouble(2, product.getPrice());
//            statement.setString(3, product.getDescription());
//            statement.setInt(4, product.getStock());  // 设置库存值
//            // 获取生成的自增 ID
//            ResultSet rs = statement.getGeneratedKeys();
//            if (rs.next()) {
//                product.setId(rs.getInt(1));  // 设置产品对象的 ID
//            }

            int rowsInserted = statement.executeUpdate();
            return rowsInserted > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
    public int getRecentSellById(int product_id) {
        String sql = "SELECT recent_sell FROM products WHERE id=?";
        try (Connection connection = dataSource.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {

            statement.setInt(1, product_id);
            ResultSet rs = statement.executeQuery();

            if (rs.next()) {
                return rs.getInt("recent_sell"); // 获取 recent_sell 值
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return -1; // 如果没有找到，返回一个指示值
    }



    // Get a product by its ID
    public Product getProductById(int id) {
        String sql = "SELECT * FROM products WHERE id = ?";
        try (Connection connection = dataSource.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {

            statement.setInt(1, id);
            ResultSet resultSet = statement.executeQuery();

            if (resultSet.next()) {
                Product product = new Product();
                product.setId(resultSet.getInt("id"));
                product.setName(resultSet.getString("name"));
                product.setPrice(resultSet.getDouble("price"));
                product.setDescription(resultSet.getString("description"));
                product.setStock(resultSet.getInt("stock"));  // 获取库存值
                product.setStock(resultSet.getInt("recent_sell"));  // 获取库存值
                return product;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }


    // Update a product's details
    public boolean updateProduct(Product product) {
        String sql = "UPDATE products SET name = ?, price = ?, description = ?, stock = ? WHERE id = ?";
        try (Connection connection = dataSource.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {

            statement.setString(1, product.getName());
            statement.setDouble(2, product.getPrice());
            statement.setString(3, product.getDescription());
            statement.setInt(4, product.getStock());  // 更新库存
            statement.setInt(5, product.getId());

            int rowsUpdated = statement.executeUpdate();
            return rowsUpdated > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
    public boolean updateProductstockbyid(int stock,int id) {
        String sql = "UPDATE products SET stock = ? WHERE id = ?";
        try (Connection connection = dataSource.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {


            statement.setInt(1, stock);  // 更新库存
            statement.setInt(2, id);

            int rowsUpdated = statement.executeUpdate();
            return rowsUpdated > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }


    // Delete a product by its ID
    public boolean deleteProduct(int id) {
        String sql = "DELETE FROM products WHERE id = ?";
        try (Connection connection = dataSource.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {

            statement.setInt(1, id);
            int rowsDeleted = statement.executeUpdate();
            return rowsDeleted > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    // Get a list of all products
    public List<Product> getAllProducts() {
        List<Product> products = new ArrayList<>();
        String sql = "SELECT * FROM products";
        try (Connection connection = dataSource.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql);
             ResultSet resultSet = statement.executeQuery()) {

            while (resultSet.next()) {
                Product product = new Product();
                product.setId(resultSet.getInt("id"));
                product.setName(resultSet.getString("name"));
                product.setPrice(resultSet.getDouble("price"));
                product.setDescription(resultSet.getString("description"));
                product.setStock(resultSet.getInt("stock"));
                product.setRecent_sell(resultSet.getInt("recent_sell"));
                products.add(product);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return products;
    }

    public List<Product> searchProductsByName(String name) {
        List<Product> products = new ArrayList<>();
        String sql = "SELECT * FROM products WHERE name LIKE ?";

        try (Connection conn = dataSource.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, "%" + name + "%");  // 使用通配符进行模糊查询
            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                Product product = new Product();
                product.setId(rs.getInt("id"));
                product.setName(rs.getString("name"));
                product.setPrice(rs.getDouble("price"));
                product.setDescription(rs.getString("description"));
                product.setStock(rs.getInt("stock"));
                product.setRecent_sell(rs.getInt("recent_sell"));
                products.add(product);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return products;
    }
}
