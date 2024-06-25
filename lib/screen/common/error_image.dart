import 'package:flutter/material.dart';

class ErrorImage extends StatelessWidget {
  const ErrorImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Image.asset(
            'asset/icons/photo_default.png',
            width: 36,
            height: 36,
          ),
        ),
        const SizedBox(height: 8),
        const FittedBox(
          child: Text(
            '이미지를 불러오는데\n실패했습니다..',
            style: TextStyle(fontSize: 10),
            textAlign: TextAlign.center,
          ),
        )
      ],
    );
  }
}
