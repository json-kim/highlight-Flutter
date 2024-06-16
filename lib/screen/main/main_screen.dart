import 'package:flutter/material.dart';

/// 앱 메인 화면(메인 네비게이션)
class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentIndex = 0;
  final PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        physics: const NeverScrollableScrollPhysics(),
        controller: pageController,
        itemCount: 3,
        itemBuilder: (context, index) {
          return Center(
            child: Text('$index 페이지'),
          );
        },
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: currentIndex,
        onDestinationSelected: (value) {
          setState(() {
            currentIndex = value;
            pageController.jumpToPage(currentIndex);
          });
        },
        destinations: const [
          NavigationDestination(icon: Icon(Icons.list), label: '리스트'),
          NavigationDestination(icon: Icon(Icons.photo), label: '사진'),
          NavigationDestination(icon: Icon(Icons.person), label: '프로필'),
        ],
      ),
    );
  }
}
