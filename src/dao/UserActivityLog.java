package dao;

import java.sql.Timestamp;

public class UserActivityLog {
    private int id;
    private String username;
    private String activityType;
    private int productId;
    private Timestamp timestamp;
    private String details;

    public UserActivityLog(int id, String username, String activityType, int productId, Timestamp timestamp, String details) {
        this.id = id;
        this.username = username;
        this.activityType = activityType;
        this.productId = productId;
        this.timestamp = timestamp;
        this.details = details;
    }

    // Getter 和 Setter 方法
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getActivityType() {
        return activityType;
    }

    public void setActivityType(String activityType) {
        this.activityType = activityType;
    }

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public Timestamp getTimestamp() {
        return timestamp;
    }

    public void setTimestamp(Timestamp timestamp) {
        this.timestamp = timestamp;
    }

    public String getDetails() {
        return details;
    }

    public void setDetails(String details) {
        this.details = details;
    }
}
