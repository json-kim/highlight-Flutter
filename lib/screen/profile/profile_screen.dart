import 'package:flutter/material.dart';
import 'package:highlight_flutter/screen/profile/menu_list.dart';
import 'package:highlight_flutter/screen/profile/profile_bar.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: const Column(
        children: [
          // 프로필 바
          ProfileBar(),

          // 메뉴 리스트
          MenuList(),
        ],
      ),
    );
  }
}
