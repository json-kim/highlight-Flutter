import 'package:flutter/material.dart';

class ContentBar extends StatelessWidget {
  const ContentBar({required this.child, super.key});

  final Widget child;

  static const contentTextStyle = TextStyle(color: Colors.black, fontSize: 14);
  static const contentNameStyle = TextStyle(fontWeight: FontWeight.bold);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('내용', style: contentNameStyle),
          const SizedBox(width: 8),
          Expanded(
            child: Theme(
                data: Theme.of(context).copyWith(
                    textTheme: const TextTheme(bodyLarge: contentTextStyle)),
                child: DefaultTextStyle.merge(
                    style: contentTextStyle, child: child)),
          )
        ],
      ),
    );
  }
}
