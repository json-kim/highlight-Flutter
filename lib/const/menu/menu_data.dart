import 'package:flutter/material.dart';
import 'package:highlight_flutter/app/router/app_router.dart';

class MenuData {
  const MenuData({
    required this.label,
    required this.icon,
    required this.route,
  });

  final String label;
  final IconData icon;
  final String route;

  static const menuList = [
    MenuData(
      label: '백업하기',
      icon: Icons.file_copy,
      route: Routes.backup,
    ),
    MenuData(
      label: '초기화하기',
      icon: Icons.restore,
      route: Routes.reset,
    ),
    MenuData(
      label: '버전정보',
      icon: Icons.settings,
      route: Routes.version,
    ),
  ];
}
