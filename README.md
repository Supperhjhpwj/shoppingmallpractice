# 电子商务网站的构建（华南理工大学 黄劲恒 202230441152）

本项目为我网络应用与开发课程的作业（SCUT 202230441152 HuangJinheng），实现的功能如下所示：

顾客：

1、用户的注册、登录、注销。

2、展示产品列表。

3、购买流程（浏览/查询->添加至购物车->付款->发送电子邮件确认收货）。

4、可以查看订单状态和历史。

5、修改个人信息。

销售：

1、商品目录的管理（包括最基本的增删改等操作）。

2、订单管理、以及销售统计报表。

3、客户管理、以及客户的 浏览/购买 日志 记录。



下面是对我的代码文件进行简单的介绍：

## （一）数据库表的设计与建立

以下是我的数据表的设计：
### A.用户（users）
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

#### 角色说明

1. **普通用户（user）**
   - 默认角色，具备基本的用户权限。

2. **管理员（admin）**
   - 系统中仅允许存在一个 `admin` 用户。
   - `admin` 可创建或删除管理员助手（`adminson`）。

3. **管理员助手（adminson）**
   - 具备部分管理权限，但无权修改普通用户信息。

#### 注意事项

- **用户名唯一性**：字段 `Username` 必须唯一，防止重复注册。
- **非空字段**：
  - `Username`
  - `recipientName`
  - `ShoppingAddress`
- **时间自动生成**：字段 `Create_at` 自动记录用户创建时间。

### B.商品（products）

| **列名**           | **属性与描述**                                              |
|--------------------|-----------------------------------------------------------|
| **Id**             | Int 自增 主码                                               |
| **Name**           | Varchar 商品名                                              |
| **Price**          | Double 商品单价                                            |
| **Description**    | Text 商品描述                                              |
| **Stock**          | Int 商品库存，默认值为 0                                    |
| **Recentsell**     | Int 商品最近销售量，默认值为 0（用于统计商品最近销售量，方便生成销售统计报表） |




### C.购物车（carts）

| **列名**        | **属性与描述**                                            |
|-----------------|---------------------------------------------------------|
| **Username**    | Users 表的外码，用于标识商品的用户                       |
| **Product_id**  | Products 表的外码，用于标识购买的商品                    |
| **Quantity**    | Int 购买商品的数量                                       |
| **Create_at**   | CURRENT_TIMESTAMP 创建时间                               |
###D.订单（orders）



### E.订单细节（order_items）

| **列名**         | **属性与描述**                                                       |
|------------------|---------------------------------------------------------------------|
| **Order_id**     | Int 自增 主码                                                         |
| **Username**     | 用于标识订单属于哪个用户                                             |
| **Order_date**   | CURRENT_TIMESTAMP 订单创建时间                                       |
| **Total_amount** | Double 订单总价                                                     |
| **Status**       | Varchar 订单状态（订单状态有四种：待支付、已支付、已发货、已签收） |

### F.用户日志（user_activity_type）

| **列名**         | **属性与描述**                                                       |
|------------------|---------------------------------------------------------------------|
| **Id**           | Int 自增 主码                                                         |
| **Username**     | Users 表的外码，用于记录是哪一个用户的日志记录                       |
| **Activity_type**| Varchar 活动类型（浏览和购买两种）                                   |
| **Product_id**   | Products 表的外码，用于记录是哪一个商品的日志记录                    |
| **Timestamp**    | CURRENT_TIMESTAMP 日志生成时间                                       |
| **Details**      | Varchar 日志细节                                       

## （二）servlet文件的介绍
###  客户端Servlet 描述表

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

## （三）JSP文件的介绍
### 客户端JSP 页面描述表

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


## （四）filter文件的介绍
我只设置了一个Filter模块，用于统一整个项目的编码，防止出现乱码。
