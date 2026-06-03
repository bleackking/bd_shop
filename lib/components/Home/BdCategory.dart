import 'package:flutter/material.dart';

// 分类组件
class BdCategory extends StatefulWidget {
  const BdCategory({super.key});

  @override
  State<BdCategory> createState() => _BdCategoryState();
}

class _BdCategoryState extends State<BdCategory> {
  @override
  Widget build(BuildContext context) {
    // ListView组件不能设置高度，所以必须得用Container组件或者SizeBox组件设置高度
    return SizedBox(
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal, // 横向排列
        itemCount: 10, // 渲染10项
        itemBuilder: (BuildContext context, int index) {
          return Container(
            color: Colors.blue,
            alignment: Alignment.center,
            margin: EdgeInsets.symmetric(horizontal: 10),
            width: 80,
            height: 100,
            child: Text(
              "分类${index + 1}",
              style: TextStyle(color: Colors.white),
            ),
          );
        },
      ),
    );
  }
}
