package dao;

import java.util.Date;
import java.util.List;

public class Order {
    private int orderId;
    private String username;
    private Date orderDate;
    private int totalAmount;
    private String status;
    private List<OrderItem> orderItems; // 订单项列表

    // 构造函数
    public Order() {}

    public Order(int orderId, String username, int totalAmount, String status, List<OrderItem> orderItems) {
        this.orderId = orderId;
        this.username = username;
        this.totalAmount = totalAmount;
        this.status = status;
        this.orderItems = orderItems;
    }

    // Getter 和 Setter 方法
    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public Date getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(Date orderDate) {
        this.orderDate = orderDate;
    }

    public int getTotalAmount() {
        return totalAmount;
    }

    public void setTotalAmount(int totalAmount) {
        this.totalAmount = totalAmount;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public List<OrderItem> getOrderItems() {
        return orderItems;
    }

    public void setOrderItems(List<OrderItem> orderItems) {
        this.orderItems = orderItems;
    }

    @Override
    public String toString() {
        return "Order{" +
                "orderId=" + orderId +
                ", username='" + username + '\'' +
                ", orderDate=" + orderDate +
                ", totalAmount=" + totalAmount +
                ", status='" + status + '\'' +
                ", orderItems=" + orderItems +
                '}';
    }
}
