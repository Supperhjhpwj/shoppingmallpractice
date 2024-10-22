package dao;

import java.util.ArrayList;
import java.util.List;

public class Cart {
    private List<CartItem> items; // 购物车中的商品列表
    private double totalPrice; // 总价格

    // 构造方法，初始化购物车为空
    public Cart() {
        items = new ArrayList<>();
        totalPrice = 0.0;
    }

    // 获取购物车中的所有商品
    public List<CartItem> getItems() {
        return items;
    }

    // 获取购物车的总价格
    public double getTotalPrice() {
        return totalPrice;
    }

    // 向购物车添加商品
    public void addItem(Product product, int quantity) {
        boolean itemExists = false;
        for (CartItem item : items) {
            if (item.getProduct().getId() == product.getId()) {
                item.setQuantity(item.getQuantity() + quantity);
                itemExists = true;
                break;
            }
        }

        if (!itemExists) {
            items.add(new CartItem(product, quantity));
        }

        updateTotalPrice();
    }

    // 从购物车删除商品
    public void removeItem(int productId) {
        items.removeIf(item -> item.getProduct().getId() == productId);
        updateTotalPrice();
    }

    // 更新购物车的总价格
    private void updateTotalPrice() {
        totalPrice = 0.0;
        for (CartItem item : items) {
            totalPrice += item.getProduct().getPrice() * item.getQuantity();
        }
    }

    // 清空购物车
    public void clearCart() {
        items.clear();
        totalPrice = 0.0;
    }
}
