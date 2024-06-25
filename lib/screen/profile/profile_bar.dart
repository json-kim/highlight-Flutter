import 'package:flutter/material.dart';

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
              Text('7'),
            ],
          ),

          Spacer(),
        ],
      ),
    );
  }
}
