import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:highlight_flutter/data/data_source/local/dao/highlights_dao.dart';
import 'package:highlight_flutter/data/data_source/local/dao/photos_dao.dart';
import 'package:highlight_flutter/data/data_source/local/database/app_database.dart';
import 'package:highlight_flutter/data/data_source/local/image_file/image_file_local_data_source.dart';

final appDatabaseProvider =
    AutoDisposeProvider((ref) => AppDatabase(), name: '[Provider]AppDatabase');

final highlightsDaoProvider = AutoDisposeProvider(
    (ref) => HighlightsDao(ref.watch(appDatabaseProvider)),
    name: '[Provider]HighlightsDao');

final photosDaoProvider = AutoDisposeProvider(
    (ref) => PhotosDao(ref.watch(appDatabaseProvider)),
    name: '[Provider]PhotosDao');

final imageFileLocalDataSourceProvider = AutoDisposeProvider(
    (ref) => ImageFileLocalDataSource(),
    name: '[Provider]ImageFileLocalDataSource');
