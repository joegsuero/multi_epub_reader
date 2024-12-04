// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main_feed_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$mainFeedNotifierHash() => r'3e2ca1bcecbd6448410c3abcd8e45c513195ad14';

/// See also [MainFeedNotifier].
@ProviderFor(MainFeedNotifier)
final mainFeedNotifierProvider = AutoDisposeAsyncNotifierProvider<
    MainFeedNotifier,
    ({CategoryFeed popularFeed, CategoryFeed recentFeed})>.internal(
  MainFeedNotifier.new,
  name: r'mainFeedNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$mainFeedNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$MainFeedNotifier = AutoDisposeAsyncNotifier<
    ({CategoryFeed popularFeed, CategoryFeed recentFeed})>;
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
