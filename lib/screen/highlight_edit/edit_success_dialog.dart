import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class EditSuccessDialog extends StatelessWidget {
  const EditSuccessDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      icon: Image.asset(
        'asset/icons/clapping_hands.png',
        width: 80,
        height: 80,
      ),
      content: const Text(
        '잘했어요!\n새로운 하이라이트를 만들었어요',
        textAlign: TextAlign.center,
      ),
      actions: [
        TextButton(
          onPressed: () {
            context.pop();
          },
          child: const Text('확인'),
        )
      ],
    );
  }
}
