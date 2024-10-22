package dao;

public class myUser {
    // 私有属性
    private int userid;
    private String username;
    private String password;
    private String email;
    private String phoneNumber;
    private String recipientName; // 收货人
    private String shippingAddress; // 收货地址

    private String role;

    // 无参构造函数
    public myUser() {
    }

    // 带参数的构造函数
    public myUser(String username, String password, String email, String phoneNumber,
                  String recipientName, String shippingAddress,String role) {
        this.username = username;
        this.password = password;
        this.email = email;
        this.phoneNumber = phoneNumber;
        this.recipientName = recipientName;
        this.shippingAddress = shippingAddress;
        this.role=role;
    }

    // Getter 和 Setter 方法
    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getRecipientName() {
        return recipientName;
    }

    public void setRecipientName(String recipientName) {
        this.recipientName = recipientName;
    }

    public String getShippingAddress() {
        return shippingAddress;
    }

    public void setShippingAddress(String shippingAddress) {
        this.shippingAddress = shippingAddress;
    }

    // 自定义方法：例如校验密码是否符合要求
    public boolean validatePassword(String inputPassword) {
        return this.password.equals(inputPassword);
    }

    public String getRole() {
        return role;
    }
    public void setRole(String role) {
        this.role = role;
    }

    // 重写 toString 方法
    @Override
    public String toString() {
        return "myUser{" +
                "username='" + username + '\'' +
                ", email='" + email + '\'' +
                ", phoneNumber='" + phoneNumber + '\'' +
                ", recipientName='" + recipientName + '\'' +
                ", shippingAddress='" + shippingAddress + '\'' +
                ",role='"+role+'\''+
                '}';
    }
}
