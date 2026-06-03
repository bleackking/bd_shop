import 'package:bd_shop/viewmodels/home.dart';
import 'package:flutter/material.dart';

// 分类组件
class BdCategory extends StatefulWidget {
  // 接收分类列表数据
  final List<CategoryItem> categoryList;
  const BdCategory({super.key, required this.categoryList});

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
        itemCount: widget.categoryList.length, // 渲染多少项
        itemBuilder: (BuildContext context, int index) {
          // 从widget中获取分类列表数据'
          final category = widget.categoryList[index];
          return Container(
            alignment: Alignment.center,
            margin: EdgeInsets.symmetric(horizontal: 10),
            width: 80,
            height: 100,
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 231, 232, 234),
              borderRadius: BorderRadius.circular(40),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.network(category.picture, width: 40, height: 40),
                Text(category.name, style: TextStyle(color: Colors.black)),
              ],
            ),
          );
        },
      ),
    );
  }
}
