import 'package:flutter/material.dart';

class LineWidget extends StatelessWidget {
  const LineWidget({super.key, required this.width});

  final double width;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 2,
      width: width,
      decoration: const BoxDecoration(
        color: Colors.black45,
        borderRadius: BorderRadius.all(Radius.circular(10))
      ),
    );
  }
}
