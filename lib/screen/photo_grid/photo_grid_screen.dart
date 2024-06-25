import 'package:flutter/material.dart';
import 'package:highlight_flutter/screen/photo_grid/photo_grid_view.dart';

class PhotoGridScreen extends StatelessWidget {
  const PhotoGridScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Photos'),
      ),
      body: const PhotoGridView(),
    );
  }
}
