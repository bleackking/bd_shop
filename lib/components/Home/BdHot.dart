import 'package:bd_shop/viewmodels/home.dart';
import 'package:flutter/material.dart';

// 爆款组件
class BdHot extends StatefulWidget {
  // 热榜推荐
  final SpecialRecommendResult result;
  // 类型
  final String type;
  const BdHot({super.key, required this.result, required this.type});

  @override
  State<BdHot> createState() => _BdHotState();
}

class _BdHotState extends State<BdHot> {
  // 获取前两条数据
  // 类似于计算属性 .xxx就可以调用
  // 方法() 调用
  List<GoodsItem> get _items {
    if (widget.result.subTypes.isEmpty) {
      return [];
    }
    return widget.result.subTypes.first.goodsItems.items.take(2).toList();
  }

  // 构建子项
  List<Widget> _getChildrenList() {
    return _items.map((item) {
      return Container(
        width: 80,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                item.picture,
                errorBuilder: (context, error, stackTrace) =>
                    Image.asset("lib/asset/images/1.jpg"),
                width: 80,
                height: 100,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              "￥${item.price ?? 0}",
              style: const TextStyle(
                fontSize: 12,
                color: Color.fromARGB(255, 86, 24, 20),
              ),
            ),
          ],
        ),
      );
    }).toList();
  }

  // 头部
  Widget _buildHeader() {
    return Row(
      children: [
        Text(
          widget.type == "step" ? "一站式买全" : "推荐爆款",
          style: const TextStyle(
            color: Color.fromARGB(255, 86, 24, 20),
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(width: 10),
        Text(
          widget.type == "step" ? "精心优先" : "最受欢迎",
          style: const TextStyle(
            color: Color.fromARGB(255, 124, 63, 58),
            fontSize: 12,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: widget.type == "step"
              ? const Color.fromARGB(255, 249, 247, 215)
              : const Color.fromARGB(255, 211, 228, 240),
        ),
        child: Column(
          children: [
            _buildHeader(),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: _getChildrenList(),
            ),
          ],
        ),
      ),
    );
  }
}
