import 'package:cached_network_image/cached_network_image.dart';
import 'package:dismissible_page/dismissible_page.dart';
import 'package:flutter/material.dart';

class ImageFullscreen extends StatelessWidget {
  const ImageFullscreen({Key? key, required this.id, required this.url})
      : super(key: key);
  final String id;
  final String url;
  @override
  Widget build(BuildContext context) {
    return DismissiblePage(
      onDismissed: Navigator.of(context).pop,
      direction: DismissiblePageDismissDirection.multi,
      child: WillPopScope(
        child: Hero(
          tag: id,
          child: Scaffold(
              appBar: AppBar(
                automaticallyImplyLeading: false,
                elevation: 0,
                backgroundColor: Colors.transparent,
                actions: [
                  IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: const Icon(
                        Icons.close,
                        color: Colors.black,
                      ))
                ],
              ),
              body: InteractiveViewer(
                child: SizedBox(
                    height: double.infinity,
                    child: Center(child: CachedNetworkImage(imageUrl: url))),
              )),
        ),
        onWillPop: () async {
          return Future.value(false);
        },
      ),
    );
  }
}
