import 'package:assignment_otto_international/src/constants.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CustomCachedNetworkImage extends StatelessWidget {
  const CustomCachedNetworkImage({
    Key? key,
    required this.url,
    required this.cacheWidth,
  }) : super(key: key);

  final String url;
  final int cacheWidth;
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: url,
      progressIndicatorBuilder: (context, url, progress) {
        return SizedBox(
          height: 150,
          child: Center(
              child: CircularProgressIndicator(value: progress.progress)),
        );
      },
      errorWidget: (context, url, error) {
        return const Center(
          child: Text(
            "Error loading image",
            style: contentStyle,
          ),
        );
      },
      memCacheWidth: kIsWeb ? null : cacheWidth,
    );
  }
}
