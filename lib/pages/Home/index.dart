import 'package:bd_shop/components/Home/BdCategory.dart';
import 'package:bd_shop/components/Home/BdHot.dart';
import 'package:bd_shop/components/Home/BdMoreList.dart';
import 'package:bd_shop/components/Home/BdSlider.dart';
import 'package:bd_shop/components/Home/BdSuggestion.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  // 获取滚动容器的内容
  List<Widget> _getScrollChildren() {
    return [
      // 包裹普通Widget
      SliverToBoxAdapter(child: BdSlider()), // 轮播图组件
      // 中间的间距
      SliverToBoxAdapter(child: SizedBox(height: 10)),
      // 放置分类组件
      // SliverGrid 和 SliverList只能纵向排列
      SliverToBoxAdapter(child: BdCategory()),
      // 中间的间距
      SliverToBoxAdapter(child: SizedBox(height: 10)),
      // 放置推荐组件
      SliverToBoxAdapter(child: BdSuggestion()),
      // 中间的间距
      SliverToBoxAdapter(child: SizedBox(height: 10)),
      // 放置爆款组件
      SliverToBoxAdapter(
        // Padding：横向有10个的内边距
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          // 使用Flex左右布局
          child: Flex(
            direction: Axis.horizontal,
            children: [
              // Expanded：均分组件所占空间
              Expanded(child: BdHot()), // 左边爆款组件
              SizedBox(width: 10), // 中间间距
              Expanded(child: BdHot()), // 右边爆款组件
            ],
          ),
        ),
      ),
      // 中间的间距
      SliverToBoxAdapter(child: SizedBox(height: 10)),
      // 商品无限滚动列表组件
      BdMoreList(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    // 自由组合滚动容器，里面的元素必须是sliver家族的内容
    return CustomScrollView(slivers: _getScrollChildren());
  }
}
