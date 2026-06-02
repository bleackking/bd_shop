import 'package:bd_shop/pages/Cart/index.dart';
import 'package:bd_shop/pages/Category/index.dart';
import 'package:bd_shop/pages/Home/index.dart';
import 'package:bd_shop/pages/Mine/index.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  // 定义数据，根据数据渲染4个导航
  // 一般应用程序的导航是固定的
  final List<Map<String, String>> _tabList = [
    {
      "icon": "lib/assets/images/ic_public_home_normal.png", //正常显示图标
      "active": "lib/assets/images/ic_public_home_active.png", //激活选中的图标
      "text": "首页",
    },
    {
      "icon": "lib/assets/images/ic_public_pro_normal.png", //正常显示图标
      "active": "lib/assets/images/ic_public_pro_active.png", //激活选中的图标
      "text": "分类",
    },
    {
      "icon": "lib/assets/images/ic_public_cart_normal.png", //正常显示图标
      "active": "lib/assets/images/ic_public_cart_active.png", //激活选中的图标
      "text": "购物车",
    },
    {
      "icon": "lib/assets/images/ic_public_my_normal.png", //正常显示图标
      "active": "lib/assets/images/ic_public_my_active.png", //激活选中的图标
      "text": "我的",
    },
  ];
  int _currentIndex = 0;

  // 返回底部渲染的4个分类
  List<BottomNavigationBarItem> _getTabBarWidget() {
    return List.generate(_tabList.length, (int index) {
      return BottomNavigationBarItem(
        // 正常显示图标
        icon: Image.asset(_tabList[index]["icon"]!, width: 30, height: 30),
        // 激活显示的图标
        activeIcon: Image.asset(
          _tabList[index]["active"]!,
          width: 30,
          height: 30,
        ),
        label: _tabList[index]["text"],
      );
    });
  }

  List<Widget> _getChildren() {
    return [HomeView(), CategoryView(), CartView(), MineView()];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // SafeArea避开安全区组件
      body: SafeArea(
        child: IndexedStack(
          // 切换时的索引，与导航栏中切换的索引对应，直接用导航栏对应的索引
          index: _currentIndex,
          // 放置4个组件，与导航栏的数量所对应
          children: _getChildren(),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (int index) {
          // index就是当前点击的索引
          _currentIndex = index;
          setState(() {});
        },
        // 选中底部图标时不进行移动，也就是固定
        type: BottomNavigationBarType.fixed,
        // 选中项的字体颜色
        selectedItemColor: Colors.black,
        // 没有选中项的字体颜色
        unselectedItemColor: Colors.black,
        // 展示没有选择的文本
        showUnselectedLabels: true,
        // 选中项绑定index
        currentIndex: _currentIndex,
        items: _getTabBarWidget(),
      ),
    );
  }
}
