// 存放的是全局的常量
class GlobalConstants {
  // static修饰的属性就会变成静态属性
  static const String BASE_URL = "https://meikou-api.itheima.net"; // 基础接口地址
  static const int TIME_OUT = 10; // 超时时间
  static const String SUCCESS_CODE = "1"; //成功状态
}

// 存放请求地址接口的常量
class HttpConstants {
  // 轮播图接口地址
  static const String BANNER_LIST = "/home/banner";
  // 头部商品接口地址
  static const String CATEGORY_LIST = "/home/category/head";
}
