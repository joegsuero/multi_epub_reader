import 'package:flutter_ebook_app/src/common/common.dart';
import 'package:flutter_ebook_app/src/features/features.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'main_feed_notifier.g.dart';

typedef MainFeedData = ({CategoryFeed popularFeed, CategoryFeed recentFeed});

@riverpod
class MainFeedNotifier extends _$MainFeedNotifier {
  MainFeedNotifier() : super();

  @override
  Future<MainFeedData> build() async {
    state = const AsyncValue.loading();
    return _fetch();
  }

  Future<void> fetch() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async => _fetch());
  }

  Future<MainFeedData> _fetch() async {
    final MainRepository mainRepository = ref.read(mainRepositoryProvider);
    final popularFeedSuccessOrFailure =
        await mainRepository.getPopularMainFeed();
    final recentFeedSuccessOrFailure = await mainRepository.getRecentMainFeed();
    final popularFeed = popularFeedSuccessOrFailure.feed;
    final recentFeed = recentFeedSuccessOrFailure.feed;
    if (popularFeed == null) {
      throw popularFeedSuccessOrFailure.failure!.description;
    }

    if (recentFeed == null) {
      throw recentFeedSuccessOrFailure.failure!.description;
    }
    return (popularFeed: popularFeed, recentFeed: recentFeed);
  }
}
