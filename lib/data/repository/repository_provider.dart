import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:highlight_flutter/data/data_source/local/local_data_source_provider.dart';
import 'package:highlight_flutter/data/repository/highlight_local_repository.dart';
import 'package:highlight_flutter/data/repository/photo_local_repository.dart';

final highlightRepositoryProvider = AutoDisposeProvider(
    (ref) => HighlightLocalRepository(
        highlightsDao: ref.watch(highlightsDaoProvider),
        photosDao: ref.watch(photosDaoProvider),
        imageDataSource: ref.watch(imageFileLocalDataSourceProvider)),
    name: '[Provider]HighlightRepository');

final photoRepositoryProvider = AutoDisposeProvider(
    (ref) => PhotoLocalRepository(
        photosDao: ref.watch(photosDaoProvider),
        highlightsDao: ref.watch(highlightsDaoProvider),
        imageDataSource: ref.watch(imageFileLocalDataSourceProvider)),
    name: '[Provider]PhotoRepository');
