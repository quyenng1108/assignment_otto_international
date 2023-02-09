import 'package:assignment_otto_international/src/routes.dart';
import 'package:assignment_otto_international/src/widgets/custom_cached_network_image.dart';
import 'package:assignment_otto_international/src/widgets/ripple.dart';
import 'package:flutter/material.dart';

class ImageItem extends StatefulWidget {
  const ImageItem(
      {Key? key,
      required this.id,
      required this.url,
      required this.cacheWidth,
      this.addedToBookmark = false,
      this.onBookmarkTap,
      this.shouldShowBookmark = true})
      : super(key: key);
  final String url;
  final String id;
  final int cacheWidth;
  final bool addedToBookmark;
  final Function(Map<String, String>)? onBookmarkTap;
  final bool shouldShowBookmark;
  @override
  State<ImageItem> createState() => _ImageItemState();
}

class _ImageItemState extends State<ImageItem>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Stack(
      children: [
        Ripple(
          onTap: () {
            Navigator.of(context).pushNamed(RoutePath.imageFullscreen,
                arguments: {'id': widget.id, 'url': widget.url});
          },
          child: Hero(
            tag: widget.id,
            child: CustomCachedNetworkImage(
              url: widget.url,
              cacheWidth: widget.cacheWidth,
            ),
          ),
        ),
        if (widget.shouldShowBookmark)
          Positioned(
              right: 16,
              top: 16,
              child: Ripple(
                  radius: 48,
                  onTap: () {
                    widget.onBookmarkTap?.call({widget.id: widget.url});
                  },
                  child: Container(
                    width: 32,
                    height: 32,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              offset: const Offset(2, 2),
                              color: Colors.black.withOpacity(.6),
                              blurRadius: 2,
                              spreadRadius: 2)
                        ]),
                    child: Icon(
                      widget.addedToBookmark
                          ? Icons.bookmark
                          : Icons.bookmark_add,
                    ),
                  )))
      ],
    );
  }

  @override
  bool get wantKeepAlive => true;
}
