import 'package:flutter/material.dart';

class ColorBar extends StatelessWidget {
  const ColorBar({required this.color, super.key});

  final Color color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            'asset/icons/palette.png',
            width: 32,
            height: 32,
          ),
          const SizedBox(width: 16),
          ColorBox(
            color: color,
          )
        ],
      ),
    );
  }
}

class ColorBox extends StatelessWidget {
  const ColorBox({required this.color, super.key});

  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 32,
      width: 32,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: color,
      ),
    );
  }
}
