import 'package:bd_shop/api/home.dart';
import 'package:bd_shop/components/Home/BdCategory.dart';
import 'package:bd_shop/components/Home/BdHot.dart';
import 'package:bd_shop/components/Home/BdMoreList.dart';
import 'package:bd_shop/components/Home/BdSlider.dart';
import 'package:bd_shop/components/Home/BdSuggestion.dart';
import 'package:bd_shop/viewmodels/home.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  // 模拟轮播图数据
  List<BannerItem> _bannerList = [
    // BannerItem(
    //   id: "1",
    //   imgUrl: "https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meituan/1.jpg",
    // ),
    // BannerItem(
    //   id: "2",
    //   imgUrl: "https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meituan/2.jpg",
    // ),
    // BannerItem(
    //   id: "3",
    //   imgUrl: "https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meituan/3.jpg",
    // ),
  ];
  // 分类数据
  List<CategoryItem> _categoryList = [];

  // 获取滚动容器的内容
  List<Widget> _getScrollChildren() {
    return [
      // 包裹普通Widget
      SliverToBoxAdapter(child: BdSlider(bannerList: _bannerList)), // 轮播图组件
      // 中间的间距
      SliverToBoxAdapter(child: SizedBox(height: 10)),
      // 放置分类组件
      // SliverGrid 和 SliverList只能纵向排列
      SliverToBoxAdapter(child: BdCategory(categoryList: _categoryList)),
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
  void initState() {
    // TODO: implement initState
    super.initState();
    _getBannerList();
    _getCategoryList();
  }

  // 调用接口，赋值数据
  void _getBannerList() async {
    _bannerList = await getBannerListAPI();
    setState(() {});
  }

  void _getCategoryList() async {
    _categoryList = await getCategoryListAPI();
    print(_categoryList);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    // 自由组合滚动容器，里面的元素必须是sliver家族的内容
    return CustomScrollView(slivers: _getScrollChildren());
  }
}
