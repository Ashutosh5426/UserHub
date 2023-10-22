import 'package:flutter/material.dart';

class HorizontalBar extends StatelessWidget {
  final double width;
  final Color color;
  const HorizontalBar({required this.width, required this.color, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: width,
          height: 5,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ],
    );
  }
}
