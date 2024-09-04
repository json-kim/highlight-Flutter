import 'package:flutter/widgets.dart';

class FailWidget extends StatelessWidget {
  const FailWidget(
      {required this.failText, this.width = 80, this.height = 80, super.key});

  final String failText;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'asset/icons/crying_face_ani.png',
            width: width,
            height: height,
          ),
          Text(failText, textAlign: TextAlign.center),
        ],
      ),
    );
  }
}
