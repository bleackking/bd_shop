import 'package:flutter/material.dart';

// 推荐组件
class BdSuggestion extends StatefulWidget {
  const BdSuggestion({super.key});

  @override
  State<BdSuggestion> createState() => _BdSuggestionState();
}

class _BdSuggestionState extends State<BdSuggestion> {
  @override
  Widget build(BuildContext context) {
    // Padding：横向有10个的内边距
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        color: Colors.blue,
        alignment: Alignment.center,
        height: 300,
        child: Text("推荐", style: TextStyle(color: Colors.white)),
      ),
    );
  }
}
