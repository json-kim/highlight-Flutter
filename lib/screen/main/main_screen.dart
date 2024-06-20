import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// 앱 메인 화면(메인 네비게이션)
class MainScreen extends StatelessWidget {
  const MainScreen({required this.navigationShell, super.key});

  final StatefulNavigationShell navigationShell;

  void _onTap(int index) {
    navigationShell.goBranch(index,
        initialLocation: index == navigationShell.currentIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: NavigationBar(
        selectedIndex: navigationShell.currentIndex,
        onDestinationSelected: (value) => _onTap(value),
        destinations: const [
          NavigationDestination(icon: Icon(Icons.list), label: '리스트'),
          NavigationDestination(icon: Icon(Icons.photo), label: '사진'),
          NavigationDestination(icon: Icon(Icons.person), label: '프로필'),
        ],
      ),
    );
  }
}
