import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:highlight_flutter/const/navbar_data.dart';

/// 앱 메인 화면(메인 네비게이션)
class MainScreen extends StatefulWidget {
  const MainScreen({required this.child, super.key});

  final Widget child;

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int getCurrentIndex(BuildContext context) {
    final String path = GoRouterState.of(context).uri.path;

    return NavBarData.indexWherePathOrZero(path);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.child,
      bottomNavigationBar: NavigationBar(
        selectedIndex: getCurrentIndex(context),
        onDestinationSelected: (value) =>
            NavBarData.navBarDataList[value].go(context),
        destinations: const [
          NavigationDestination(icon: Icon(Icons.list), label: '리스트'),
          NavigationDestination(icon: Icon(Icons.photo), label: '사진'),
          NavigationDestination(icon: Icon(Icons.person), label: '프로필'),
        ],
      ),
    );
  }
}
