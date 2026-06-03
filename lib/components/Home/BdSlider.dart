import 'package:bd_shop/viewmodels/home.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

// 轮播图组件
class BdSlider extends StatefulWidget {
  // 子组件接收轮播图的数据
  final List<BannerItem> bannerList;
  const BdSlider({super.key, required this.bannerList});

  @override
  State<BdSlider> createState() => _BdSliderState();
}

class _BdSliderState extends State<BdSlider> {
  // 轮播图
  Widget _getSlider() {
    // 在flutter获取屏幕宽度的方法
    final double screenWidth = MediaQuery.of(context).size.width; //屏幕的宽度
    // 返回轮播图插件
    // 根据数据渲染的不同的轮播图选项
    return CarouselSlider(
      items: List.generate(widget.bannerList.length, (int index) {
        return Image.network(
          widget.bannerList[index].imgUrl,
          fit: BoxFit.cover,
          width: screenWidth,
        );
      }),
      options: CarouselOptions(
        viewportFraction: 1, // 图片的视口占比
        autoPlay: true, // 轮播图自动播放
        autoPlayInterval: Duration(seconds: 5), // 设置轮播图每过几秒播放一次
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Stack里面放置轮播图、搜索框、指示灯导航
    return Stack(children: [_getSlider()]);
  }
}
