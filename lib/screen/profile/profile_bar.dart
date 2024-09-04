import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:highlight_flutter/screen/profile/state/highlight_count_provider.dart';

class ProfileBar extends StatelessWidget {
  const ProfileBar({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
      child: Row(
        children: [
          // 프로필 이미지
          CircleAvatar(
            radius: 36,
            child: Icon(
              Icons.person,
              size: 36,
            ),
          ),

          Spacer(),

          // 작성한 하이라이트 개수
          Column(
            children: [
              Text(
                '내 하이라이트',
                style: TextStyle(fontSize: 18),
              ),
              CountText(),
            ],
          ),

          Spacer(),
        ],
      ),
    );
  }
}

class CountText extends ConsumerWidget {
  const CountText({super.key});

  String countText(int count) {
    return '$count 개';
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(highlightCountProvider).when(
        data: (data) => Text(countText(data)),
        error: (error, stackTrace) => Text(countText(0)),
        loading: () => Text(countText(0)));
  }
}
