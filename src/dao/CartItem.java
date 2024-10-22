package dao;

public class CartItem {
    private Product product; // 商品
    private int quantity; // 购买数量

    // 构造方法
    public CartItem(Product product, int quantity) {
        this.product = product;
        this.quantity = quantity;
    }

    // 获取商品
    public Product getProduct() {
        return product;
    }

    // 设置商品
    public void setProduct(Product product) {
        this.product = product;
    }

    // 获取数量
    public int getQuantity() {
        return quantity;
    }

    // 设置数量
    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }
}
