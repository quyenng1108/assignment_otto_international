import 'dart:ui';

import 'package:assignment_otto_international/src/constants.dart';
import 'package:assignment_otto_international/src/responsive_layout_builder.dart';
import 'package:assignment_otto_international/src/routes.dart';
import 'package:assignment_otto_international/src/state/home_state.dart';
import 'package:assignment_otto_international/src/widgets/image_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final int cacheWidth = screenWidth.ceil() * window.devicePixelRatio.ceil();
    return ResponsiveLayoutBuilder(builder: (context, layout) {
      return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text(
            "Photo List",
            style: titleStyle.copyWith(color: Colors.white),
          ),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(RoutePath.bookmarkScreen);
                },
                icon: const Icon(Icons.bookmark_outline))
          ],
        ),
        body: Consumer<HomeState>(
          builder: (context, state, child) {
            // when state is loading => show loading
            return state.isLoading
                ? const Center(
                    child: CircularProgressIndicator.adaptive(),
                  )
                : Center(
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                          maxWidth: layout == LayoutType.mobile
                              ? double.infinity
                              : screenWidth * 0.6),
                      child: RefreshIndicator(
                        onRefresh: () async {
                          context
                              .read<HomeState>()
                              .fetchPhotos(isRefreshing: true);
                        },
                        child: ListView.builder(
                            itemCount: state.photoList.length + 1,
                            itemBuilder: (context, index) {
                              // when the index == photo list length
                              // if the photo list has reached max => do nothing
                              // else get more photos

                              if (index == state.photoList.length) {
                                if (state.hasReachedMax) {
                                  return const SizedBox();
                                }
                                context.read<HomeState>().fetchPhotos();
                                return const SizedBox(
                                  height: 52,
                                  child: Center(
                                    child: CircularProgressIndicator.adaptive(),
                                  ),
                                );
                              }
                              final item = state.photoList[index];
                              return ImageItem(
                                  onBookmarkTap: (item) {
                                    context
                                        .read<HomeState>()
                                        .toggleSavingToBookmark(item);
                                  },
                                  addedToBookmark:
                                      state.bookmarkList[item.id ?? 0] ==
                                          (item.urls?.regular ?? ''),
                                  id: item.id ?? '',
                                  url: item.urls?.regular ?? '',
                                  cacheWidth: layout == LayoutType.mobile
                                      ? cacheWidth
                                      : (cacheWidth * 0.6).ceil());
                            }),
                      ),
                    ),
                  );
          },
        ),
      );
    });
  }
}
