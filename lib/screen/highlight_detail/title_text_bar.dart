import 'package:flutter/material.dart';
import 'package:highlight_flutter/screen/highlight_detail/title_bar.dart';

class TitleTextBar extends StatelessWidget {
  const TitleTextBar({required this.title, super.key});

  final String title;

  @override
  Widget build(BuildContext context) {
    return TitleBar(
      child: Text(
        title,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
