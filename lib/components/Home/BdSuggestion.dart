import 'package:bd_shop/viewmodels/home.dart';
import 'package:flutter/material.dart';

// 推荐组件
class BdSuggestion extends StatefulWidget {
  // 接收数据
  final SpecialRecommendResult specialRecommendResult;
  const BdSuggestion({super.key, required this.specialRecommendResult});

  @override
  State<BdSuggestion> createState() => _BdSuggestionState();
}

class _BdSuggestionState extends State<BdSuggestion> {
  // 只取前3条数据
  List<GoodsItem> _getDisplayItems() {
    final subList = widget.specialRecommendResult.subTypes;
    // 先判空安全取值
    if (subList.isEmpty) return [];
    // 非空再取数据
    return subList.first.goodsItems.items.take(3).toList();
  }

  // 头部
  Widget _buildHeader() {
    return Row(
      children: [
        Text(
          "特惠推荐",
          style: TextStyle(
            color: const Color.fromARGB(255, 123, 11, 3),
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
        ),
        SizedBox(width: 10),
        Text(
          "精选省攻略",
          style: TextStyle(
            color: const Color.fromARGB(255, 211, 131, 123),
            fontSize: 12,
          ),
        ),
      ],
    );
  }

  // 左侧结构
  Widget _buildLeft() {
    return Container(
      width: 100,
      height: 140,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          image: AssetImage("lib/assets/images/home_cmd_inner.png"),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  List<Widget> _getChildrenList() {
    List<GoodsItem> list = _getDisplayItems(); // 取到了前3条数据
    return List.generate(list.length, (int index) {
      return Column(
        children: [
          // ClipRRect可以包裹子元素，裁剪图片设置圆角
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              list[index].picture,
              errorBuilder: (context, error, stackTrace) {
                // 当图片加载失败，返回新的部件替换原有的图片
                return Image.asset(
                  "lib/assets/images/home_cmd_inner.png",
                  width: 100,
                  height: 140,
                  fit: BoxFit.cover,
                );
              },
              width: 100,
              height: 140,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 10),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: const Color.fromARGB(255, 221, 103, 29),
            ),
            child: Text(
              "￥${list[index].price}",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    // Padding：横向有10个的内边距
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(12),
          image: DecorationImage(
            image: AssetImage(
              "lib/assets/images/home_cmd_sm.png", //设置Container容器的背景图片
            ),
            fit: BoxFit.cover, // 图片撑满
          ),
        ),
        child: Column(
          children: [
            // 顶部内容
            _buildHeader(),
            SizedBox(height: 10),
            Row(
              children: [
                _buildLeft(),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: _getChildrenList(),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
