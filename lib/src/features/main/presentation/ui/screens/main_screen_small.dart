import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ebook_app/src/common/common.dart';
import 'package:flutter_ebook_app/src/features/downloads/downloads.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MainScreenSmall extends ConsumerStatefulWidget {
  const MainScreenSmall({super.key});

  @override
  ConsumerState<MainScreenSmall> createState() => _MainScreenSmallState();
}

class _MainScreenSmallState extends ConsumerState<MainScreenSmall> {
  void loadData() {}

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {});
  }

  @override
  Widget build(BuildContext context) {
    return const DownloadsScreen();
  }
}

class _SectionTitle extends StatelessWidget {
  final String title;

  const _SectionTitle({required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            title,
            style: const TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}

class _GenreSection extends StatelessWidget {
  final CategoryFeed popular;

  const _GenreSection({required this.popular});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.0,
      child: Center(
        child: ListView.builder(
          primary: false,
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          scrollDirection: Axis.horizontal,
          itemCount: popular.feed?.link?.length ?? 0,
          shrinkWrap: true,
          itemBuilder: (BuildContext context, int index) {
            final Link link = popular.feed!.link![index];

            // We don't need the tags from 0-9 because
            // they are not categories
            if (index < 10) {
              return const SizedBox.shrink();
            }

            return Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 5.0,
                vertical: 10.0,
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: context.theme.colorScheme.secondary,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(20.0),
                  ),
                ),
                child: InkWell(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(20.0),
                  ),
                  onTap: () {
                    final route = GenreRoute(
                      title: '${link.title}',
                      url: link.href!,
                    );
                    if (context.isLargeScreen) {
                      context.router.replace(route);
                    } else {
                      context.router.push(route);
                    }
                  },
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Text(
                        '${link.title}',
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class _NewSection extends StatelessWidget {
  final CategoryFeed recent;

  const _NewSection({required this.recent});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      primary: false,
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: recent.feed?.entry?.length ?? 0,
      itemBuilder: (BuildContext context, int index) {
        final Entry entry = recent.feed!.entry![index];

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
          child: BookListItem(entry: entry),
        );
      },
    );
  }
}
