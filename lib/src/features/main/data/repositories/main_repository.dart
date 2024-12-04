import 'package:flutter_ebook_app/src/common/common.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

class MainRepository extends BookRepository {
  MainRepository(super.httpClient);

  Future<BookRepositoryData> getPopularMainFeed() {
    final successOrFailure = getCategory(popular);
    return successOrFailure;
  }

  Future<BookRepositoryData> getRecentMainFeed() {
    final successOrFailure = getCategory(recent);
    return successOrFailure;
  }
}

final mainRepositoryProvider = Provider.autoDispose<MainRepository>((ref) {
  final dio = ref.watch(dioProvider);
  return MainRepository(dio);
});
