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
  // 控制轮播图跳转的控制器
  CarouselSliderController _controller = CarouselSliderController();
  // 当前激活的索引
  int _currentIndex = 0;

  // 轮播图
  Widget _getSlider() {
    // 在flutter获取屏幕宽度的方法
    final double screenWidth = MediaQuery.of(context).size.width; //屏幕的宽度
    // 返回轮播图插件
    // 根据数据渲染的不同的轮播图选项
    return CarouselSlider(
      carouselController: _controller, // 绑定controller
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
        // 当滑动播放或点击时会触发下面的函数
        onPageChanged: (int index, reason) {
          _currentIndex = index;
          setState(() {});
        },
      ),
    );
  }

  // 搜索框
  Widget _getSearch() {
    return Positioned(
      top: 10,
      left: 0,
      right: 0,
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Container(
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.symmetric(horizontal: 40),
          height: 50,
          decoration: BoxDecoration(
            color: Color.fromRGBO(0, 0, 0, 0.4),
            borderRadius: BorderRadius.circular(25),
          ),
          child: Text(
            "搜索...",
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
        ),
      ),
    );
  }

  // 轮播图指示器
  Widget _getDots() {
    return Positioned(
      left: 0,
      right: 0,
      bottom: 0,
      child: SizedBox(
        height: 40,
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center, // 主轴居中
          children: List.generate(widget.bannerList.length, (int index) {
            // 点击
            return GestureDetector(
              onTap: () {
                _controller.jumpToPage(index);
              },
              // 切换指示器
              // AnimatedContainer：动画效果组件
              child: AnimatedContainer(
                // 动画过渡时长
                duration: Duration(milliseconds: 300),
                height: 6,
                // 激活的状态下宽度是40
                width: index == _currentIndex ? 40 : 20,
                margin: EdgeInsets.symmetric(horizontal: 4),
                decoration: BoxDecoration(
                  color: index == _currentIndex
                      ? Colors.white
                      : Color.fromRGBO(0, 0, 0, 0.3),
                  borderRadius: BorderRadius.circular(3),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Stack里面放置轮播图、搜索框、指示灯导航
    return Stack(children: [_getSlider(), _getSearch(), _getDots()]);
  }
}
