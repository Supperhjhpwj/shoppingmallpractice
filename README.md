# 电子商务网站的构建

本项目为我网络应用与开发课程的作业（SCUT 202230441152 HuangJinheng），下面是对我的代码的简介



### 客户端Servlet 描述表

| **Servlet 名称**        | **描述**                                                     |
|-------------------------|-------------------------------------------------------------|
| **LoginServlet**        | 处理登录的逻辑                                               |
| **LogoutServlet**       | 处理登出的逻辑                                               |
| **CartServlet**         | 处理将商品加入购物车的逻辑                                   |
| **ShopServlet**         | 处理将商品从数据库读取出来并显示的逻辑                       |
| **searchProducts**      | 处理查询商品的逻辑                                           |
| **showAllProducts**     | 处理显示所有商品的逻辑                                       |
| **ClearServlet**        | 处理将购物车清空的逻辑                                       |
| **UpdateCartServlet**   | 处理更新购物车的逻辑                                         |
| **RemoveItemServlet**   | 处理删除购物车中商品的逻辑                                   |
| **CreateOrderServlet**  | 处理结算购物车的逻辑                                         |
| **payOrderServlet**     | 处理支付订单的逻辑                                           |
| **PayOrder**            | 处理管理订单页面支付逻辑                                     |
| **ViewOrdersServlet**   | 处理查看当前用户订单的逻辑                                   |
| **ViewProfileServlet**  | 处理显示个人信息的逻辑                                       |
| **EditProfileServlet**  | 处理编辑个人信息的逻辑                                       |
| **ConfirmOrderServlet** | 处理确认收货的逻辑                                           |

### 管理员 Servlet 描述表

| **Servlet 名称**          | **描述**                                                 |
|---------------------------|---------------------------------------------------------|
| **AddProductServlet**      | 管理员增加商品的逻辑                                     |
| **UpdateProductServlet**   | 管理员更新商品的逻辑                                     |
| **DeleteProductServlet**   | 管理员删除商品的逻辑                                     |
| **ResetSalesServlet**      | 管理员清空日志的逻辑                                     |
| **ShipOrderServlet**       | 管理员发货的逻辑                                         |
| **DeleteOrderServlet**     | 管理员删除（完成）订单的逻辑                             |
| **DeleteUserServlet**      | 管理员删除子管理员的逻辑                                 |
| **RegisterAdminServlet**   | 管理员创建新的子管理员逻辑                               |


### JSP 页面描述表

| **JSP 名称**                   | **描述**                       |
|---------------------------------|-------------------------------|
| **Login.jsp**                   | 登录界面                       |
| **Register.jsp**                | 注册页面                       |
| **UserDashboard.jsp**           | 用户首页                       |
| **Shop.jsp**                    | 购物页面                       |
| **Cart.jsp**                    | 购物车页面                     |
| **Order.jsp**                   | 订单支付页面                   |
| **Order_details_user.jsp**      | 用户所有订单页面               |
| **View_profile.jsp**            | 查看个人信息页面               |
| **Edit_profile.jsp**            | 编辑个人信息页面               |

### 管理员 JSP 页面描述表

| **JSP 名称**                 | **描述**                           |
|-----------------------------|-----------------------------------|
| **Admin_dashboard.jsp**      | 管理员页面首页                     |
| **Edit_product.jsp**         | 编辑商品信息页面                   |
| **Manage_products.jsp**      | 管理商品信息页面                   |
| **User_activity_logs.jsp**   | 查看用户日志页面                   |
| **SalesReport.jsp**          | 销售统计报表页面                   |
| **Customer_manager.jsp**     | 客户管理页面                       |
| **Register_admin.jsp**       | 注册新的管理员页面                 |

## 表结构说明

| 列名              | 数据类型        | 属性与描述                                                                                 |
|-------------------|----------------|------------------------------------------------------------------------------------------|
| **Id**            | `Int`          | 自增，主键，用于唯一标识用户。                                                             |
| **Username**      | `Varchar`      | 非空，唯一，用户名登录的唯一标识。                                                         |
| **Password**      | `Varchar`      | 用户密码，存储加密后的密码信息。                                                           |
| **Email**         | `Varchar`      | 用户邮箱地址，可选字段。                                                                  |
| **Phonenumber**   | `Varchar`      | 用户电话号码，可选字段。                                                                  |
| **recipientName** | `Varchar`      | 非空，收件人姓名。                                                                        |
| **ShoppingAddress** | `Varchar`    | 非空，收货地址。                                                                          |
| **Create_at**     | `CURRENT_TIMESTAMP` | 记录用户的创建时间，默认为当前时间。                                                     |
| **Role**          | `Varchar`      | 用户角色：`admin` 或 `user`。创建时默认为 `user`，仅有一个 `admin` 用户，支持管理员助手角色 `adminson`。|

## 角色说明

1. **普通用户（user）**
   - 默认角色，具备基本的用户权限。

2. **管理员（admin）**
   - 系统中仅允许存在一个 `admin` 用户。
   - `admin` 可创建或删除管理员助手（`adminson`）。

3. **管理员助手（adminson）**
   - 具备部分管理权限，但无权修改普通用户信息。

## 注意事项

- **用户名唯一性**：字段 `Username` 必须唯一，防止重复注册。
- **非空字段**：
  - `Username`
  - `recipientName`
  - `ShoppingAddress`
- **时间自动生成**：字段 `Create_at` 自动记录用户创建时间。

## 示例 SQL 创建语句

以下是用于创建上述用户表的示例 SQL 代码：

```sql
CREATE TABLE Users (
    Id INT AUTO_INCREMENT PRIMARY KEY,
    Username VARCHAR(255) NOT NULL UNIQUE,
    Password VARCHAR(255),
    Email VARCHAR(255),
    Phonenumber VARCHAR(20),
    recipientName VARCHAR(255) NOT NULL,
    ShoppingAddress VARCHAR(255) NOT NULL,
    Create_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    Role VARCHAR(20) DEFAULT 'user'
);
