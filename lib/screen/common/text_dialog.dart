import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

Future<void> showTextDialog(BuildContext context, String text) async {
  await showDialog(
    context: context,
    builder: (context) => AlertDialog(
      content: Text(text),
      actions: [
        TextButton(
          onPressed: () {
            context.pop();
          },
          child: const Text('확인'),
        )
      ],
    ),
  );
}
