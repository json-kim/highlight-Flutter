import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

Future<bool> showConfirmtDialog(BuildContext context, String contentText,
    String noText, String yesText) async {
  return await showDialog<bool>(
        context: context,
        builder: (context) => AlertDialog(
          content: Text(contentText),
          actions: [
            TextButton(
                onPressed: () => context.pop(false), child: Text(noText)),
            TextButton(onPressed: () => context.pop(true), child: Text(yesText))
          ],
        ),
      ) ??
      false;
}
