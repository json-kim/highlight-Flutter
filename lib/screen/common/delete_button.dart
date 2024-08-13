import 'package:flutter/material.dart';

class DeleteButton extends StatelessWidget {
  const DeleteButton(
      {this.height = 20, this.width = 20, required this.onTap, super.key});

  final VoidCallback onTap;
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Image.asset(
        'asset/icons/cross_mark_button.png',
        width: height,
        height: width,
      ),
    );
  }
}
