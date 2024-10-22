package dao;

public class Product {
    private int id;
    private String name;
    private double price;
    private String description;
    private int stock;  // 新增库存字段
    private int recent_sell;
    private double recent_total_sell;

//    private  int quantity=0;

    // Constructor
    public Product() {}

    public Product(int id, String name, double price, String description, int stock) {
        this.id = id;
        this.name = name;
        this.price = price;
        this.description = description;
        this.stock = stock;  // 初始化库存
        this.recent_sell=0;

        this.recent_total_sell=this.recent_sell*this.price ;
    }

    public Product(int id, String name, double price, String description, int stock,int recent_sell) {
        this.id = id;
        this.name = name;
        this.price = price;
        this.description = description;
        this.stock = stock;  // 初始化库存
        this.recent_sell=recent_sell;

        this.recent_total_sell=this.recent_sell*this.price ;
    }

    // Getters and Setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getStock() {
        return stock;
    }

    public void setStock(int stock) {
        this.stock = stock;
    }

    public int getRecent_sell() {
        return recent_sell;
    }

    public void setRecent_sell(int recent_sell) {
        this.recent_sell= recent_sell;
    }
    public double getRecent_total_sell() {
        return recent_total_sell;
    }

    public void setRecent_total_sell(double recent_total_sell) {
        this.recent_total_sell = recent_total_sell;
    }
//
//    public int getQuantity() {
//        return quantity;
//    }
//
//    public void setQuantity(int stock) {
//        this.stock = quantity;
//    }

    // toString method for easy representation
    @Override
    public String toString() {
        return "Product [id=" + id + ", name=" + name + ", price=" + price + ", description=" + description + ", stock=" + stock + "]";
    }
}

