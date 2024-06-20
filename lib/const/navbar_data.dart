import 'package:flutter/material.dart';
import 'package:highlight_flutter/app/app_router.dart';

class NavBarData {
  final String label;
  final void Function(BuildContext) go;
  final String location;

  const NavBarData({
    required this.label,
    required this.go,
    required this.location,
  });

  static final navBarDataList = [
    NavBarData(
      label: '리스트',
      go: const ListRouteData().go,
      location: const ListRouteData().location,
    ),
    NavBarData(
      label: '사진',
      go: const PhotosRouteData().go,
      location: const PhotosRouteData().location,
    ),
    NavBarData(
      label: '프로필',
      go: const ProfileRouteData().go,
      location: const ProfileRouteData().location,
    ),
  ];

  static int indexWherePathOrZero(String path) {
    final index = navBarDataList.indexWhere(
      (data) => path.contains(data.location),
    );
    return index == -1 ? 0 : index;
  }
}
