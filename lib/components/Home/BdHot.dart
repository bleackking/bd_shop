import 'package:flutter/material.dart';

// 爆款组件
class BdHot extends StatefulWidget {
  const BdHot({super.key});

  @override
  State<BdHot> createState() => _BdHotState();
}

class _BdHotState extends State<BdHot> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      alignment: Alignment.center,
      height: 200,
      child: Text("爆款推荐", style: TextStyle(color: Colors.white)),
    );
  }
}
