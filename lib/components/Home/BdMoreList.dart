import 'package:flutter/material.dart';

// 商品无限滚动列表组件
class BdMoreList extends StatefulWidget {
  final List<dynamic> recommendList;
  const BdMoreList({super.key, required this.recommendList});

  @override
  State<BdMoreList> createState() => _BdMoreListState();
}

class _BdMoreListState extends State<BdMoreList> {
  // 子组件
  Widget _getChildren(int index) {
    return Container(
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: AspectRatio(
              aspectRatio: 1.0, // 设置宽高比
              child: Image.network(
                widget.recommendList[index].picture ?? "",
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Image.asset(
                    "lib/asset/images/1.jpg",
                    fit: BoxFit.cover,
                  );
                },
              ),
            ),
          ),
          // ),
          const SizedBox(height: 6),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Text(
              widget.recommendList[index].name ?? "",
              maxLines: 2,
              style: const TextStyle(fontSize: 20, color: Colors.black87),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const SizedBox(height: 6),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text.rich(
                  TextSpan(
                    text: "¥${widget.recommendList[index].price ?? ""}",
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.red,
                      fontWeight: FontWeight.w900,
                    ),
                    children: [
                      const TextSpan(text: "  "),
                      TextSpan(
                        text: "${widget.recommendList[index].price ?? ""}",
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.black87,
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                    ],
                  ),
                ),
                Text(
                  "${widget.recommendList[index].payCount ?? "0"}人付款",
                  style: const TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // 必须放置Sliver家族的组件
    return SliverGrid.builder(
      itemCount: widget.recommendList.length,
      // 设置网格列数为2列
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        childAspectRatio: 0.7,
      ),
      itemBuilder: (BuildContext context, int index) {
        return Container(child: _getChildren(index));
      },
    );
  }
}
