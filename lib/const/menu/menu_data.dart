import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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
      route: 'route',
    ),
    MenuData(
      label: '초기화하기',
      icon: Icons.restore,
      route: 'route',
    ),
    MenuData(
      label: '버전정보',
      icon: Icons.settings,
      route: 'route',
    ),
  ];
}
