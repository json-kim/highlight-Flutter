import 'package:flutter/material.dart';

class TitleBar extends StatelessWidget {
  const TitleBar({required this.child, super.key});

  final Widget child;

  static const titleNameStyle = TextStyle(fontWeight: FontWeight.bold);
  static const titleTextStyle = TextStyle(color: Colors.black, fontSize: 14);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('제목', style: titleNameStyle),
          const SizedBox(width: 8),
          Expanded(
            child: Theme(
                data: Theme.of(context).copyWith(
                    textTheme: const TextTheme(bodyLarge: titleTextStyle)),
                child: DefaultTextStyle.merge(
                    style: titleTextStyle, child: child)),
          ),
        ],
      ),
    );
  }
}
