import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:highlight_flutter/const/menu/menu_data.dart';

class MenuList extends StatelessWidget {
  const MenuList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: MenuData.menuList
          .map(
            (e) => MenuListItem(menuData: e),
          )
          .toList(),
    );
  }
}

class MenuListItem extends StatelessWidget {
  const MenuListItem({required this.menuData, super.key});

  final MenuData menuData;

  void goPage(BuildContext context, String route) {
    context.push('/$route');
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: () {
          goPage(context, menuData.route);
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Row(
            children: [
              Icon(menuData.icon),
              const SizedBox(width: 16),
              Text(menuData.label)
            ],
          ),
        ),
      ),
    );
  }
}
