import 'dart:ui';

import 'package:assignment_otto_international/src/constants.dart';
import 'package:assignment_otto_international/src/responsive_layout_builder.dart';
import 'package:assignment_otto_international/src/state/bookmark_screen_state.dart';
import 'package:assignment_otto_international/src/widgets/image_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BookmarkScreen extends StatelessWidget {
  const BookmarkScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final int cacheWidth = screenWidth.ceil() * window.devicePixelRatio.ceil();
    return ResponsiveLayoutBuilder(
      builder: (context, layout) {
        return Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: true,
              title: Text(
                "Bookmark List",
                style: titleStyle.copyWith(color: Colors.white),
              ),
            ),
            body: Consumer<BookmarkScreenState>(
              builder: (context, state, child) {
                return state.isLoading
                    ? const Center(
                        child: CircularProgressIndicator.adaptive(),
                      )
                    : ListView.builder(
                        itemCount: state.bookmarkList.length,
                        itemBuilder: (context, index) {
                          final item = state.bookmarkList[index];
                          return ImageItem(
                              shouldShowBookmark: false,
                              id: item.id,
                              url: item.url,
                              cacheWidth: layout == LayoutType.mobile
                                  ? cacheWidth
                                  : (cacheWidth * 0.6).ceil());
                        });
              },
            ));
      },
    );
  }
}
