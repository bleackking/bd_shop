// 管理路由

import 'package:bd_shop/pages/Login/index.dart';
import 'package:bd_shop/pages/Main/index.dart';
import 'package:flutter/material.dart';

// 返回App根级组件
Widget getRootWidget() {
  return MaterialApp(
    // 默认路由
    initialRoute: "/",
    // 命名路由
    routes: getRootRoutes(),
  );
}

// 返回该App的路由配置
Map<String, Widget Function(BuildContext)> getRootRoutes() {
  return {
    "/": (context) => MainPage(), // 主页路由
    "/login": (context) => LoginPage(), // 登录路由
  };
}
