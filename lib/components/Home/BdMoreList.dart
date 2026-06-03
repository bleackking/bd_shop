import 'package:flutter/material.dart';

// 商品无限滚动列表组件
class BdMoreList extends StatefulWidget {
  const BdMoreList({super.key});

  @override
  State<BdMoreList> createState() => _BdMoreListState();
}

class _BdMoreListState extends State<BdMoreList> {
  @override
  Widget build(BuildContext context) {
    // 必须放置Sliver家族的组件
    return SliverGrid.builder(
      // 设置网格列数为2列
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
      ),
      itemBuilder: (BuildContext context, int index) {
        return Container(
          child: Text("商品", style: TextStyle(color: Colors.white)),
          color: Colors.blue,
          alignment: Alignment.center,
        );
      },
    );
  }
}
