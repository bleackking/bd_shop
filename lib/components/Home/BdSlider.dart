import 'package:flutter/material.dart';

// 轮播图组件
class BdSlider extends StatefulWidget {
  const BdSlider({super.key});

  @override
  State<BdSlider> createState() => _BdSliderState();
}

class _BdSliderState extends State<BdSlider> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      height: 300,
      alignment: Alignment.center,
      child: Text("轮播图", style: TextStyle(color: Colors.white)),
    );
  }
}
