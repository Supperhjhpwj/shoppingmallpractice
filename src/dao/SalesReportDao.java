package dao;

import com.mchange.v2.c3p0.ComboPooledDataSource;

import java.beans.PropertyVetoException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class SalesReportDao {
    private static final String JDBC_URL = "your_database_url";
    private static final String JDBC_USER = "your_database_user";
    private static final String JDBC_PASSWORD = "your_database_password";
    private static ComboPooledDataSource dataSource;

    static {
        try {
            dataSource = new ComboPooledDataSource();
            dataSource.setDriverClass("com.mysql.cj.jdbc.Driver"); // 替换为你的数据库驱动
            dataSource.setJdbcUrl(JDBC_URL);
            dataSource.setUser(JDBC_USER);
            dataSource.setPassword(JDBC_PASSWORD);
            dataSource.setInitialPoolSize(5);
            dataSource.setMinPoolSize(5);
            dataSource.setMaxPoolSize(20);
            dataSource.setAcquireIncrement(5);
            dataSource.setMaxIdleTime(300);
        } catch (PropertyVetoException e) {
            e.printStackTrace();
        }
    }

    public List<SalesReport> getSalesReports() {
        List<SalesReport> salesReports = new ArrayList<>();
        String sql = "SELECT product_id, name, quantity, price FROM sales_report";

        try (Connection conn = dataSource.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql);
             ResultSet rs = pstmt.executeQuery()) {

            while (rs.next()) {
                int productId = rs.getInt("product_id");
                String name = rs.getString("name");
                int quantity = rs.getInt("quantity");
                double price = rs.getDouble("price");


                SalesReport report = new SalesReport(productId, name, quantity, price);
                salesReports.add(report);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return salesReports;
    }
    public SalesReport getSalesReportsById(int productId) {
        SalesReport salesReport = null;  // 改为单个对象
        String sql = "SELECT product_id, name, quantity, price FROM sales_report WHERE product_id = ?";

        try (Connection conn = dataSource.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, productId);  // 设置查询参数
            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {  // 只需获取第一条记录
                String name = rs.getString("name");
                int quantity = rs.getInt("quantity");
                double price = rs.getDouble("price");


                // 创建SalesReport对象
                salesReport = new SalesReport(productId, name, quantity, price);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return salesReport;  // 返回单个销售报告对象
    }


    public void addSalesReport(SalesReport salesReport) {
        String sql = "INSERT INTO sales_report (product_id, name, quantity, price) VALUES (?, ?, ?, ?, ?)";

        try (Connection conn = dataSource.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, salesReport.getProductId());
            pstmt.setString(2, salesReport.getName());
            pstmt.setInt(3, salesReport.getQuantity());
            pstmt.setDouble(4, salesReport.getPrice());


            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void updateSalesReport(int product_id,int quantity) {
        String sql = "UPDATE sales_report SET quantity = ? WHERE product_id = ?";

        try (Connection conn = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASSWORD);
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, quantity);


            pstmt.setInt(2, product_id);


            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void refresh() {
        String sql = "update sales_report set quantity=?";

        try (Connection conn = dataSource.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, 0);

            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void deletereportitem(int product_id) {
        String sql = "DELETE FROM sales_report where product_id=?";

        try (Connection conn = dataSource.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, product_id);

            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
