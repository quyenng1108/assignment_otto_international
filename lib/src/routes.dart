import 'dart:io';

import 'package:assignment_otto_international/src/screens/bookmark_screen.dart';
import 'package:assignment_otto_international/src/screens/home_screen.dart';
import 'package:assignment_otto_international/src/screens/login_screen.dart';
import 'package:assignment_otto_international/src/state/bookmark_screen_state.dart';
import 'package:assignment_otto_international/src/state/home_state.dart';
import 'package:assignment_otto_international/src/widgets/image_fullscreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RouteGeneration {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    bool useMaterial = kIsWeb || Platform.isAndroid;
    switch (settings.name) {
      case RoutePath.loginScreen:
        return useMaterial
            ? MaterialPageRoute(builder: (_) => const LoginScreen())
            : CupertinoPageRoute(builder: (_) => const LoginScreen());
      case RoutePath.bookmarkScreen:
        return useMaterial
            ? MaterialPageRoute(
                builder: (_) => ChangeNotifierProvider(
                    create: (_) => BookmarkScreenState(),
                    child: const BookmarkScreen()))
            : CupertinoPageRoute(
                builder: (_) => ChangeNotifierProvider(
                    create: (_) => BookmarkScreenState(),
                    child: const BookmarkScreen()));
      case RoutePath.imageFullscreen:
        final args = settings.arguments as Map;
        return useMaterial
            ? MaterialPageRoute(
                builder: (_) => ImageFullscreen(
                      url: args['url'],
                      id: args['id'],
                    ))
            : CupertinoPageRoute(
                builder: (_) => ImageFullscreen(
                      url: args['url'],
                      id: args['id'],
                    ));
      case RoutePath.homeScreen:
        return useMaterial
            ? MaterialPageRoute(
                builder: (_) => ChangeNotifierProvider(
                    create: (_) => HomeState(), child: const HomeScreen()))
            : CupertinoPageRoute(
                builder: (_) => ChangeNotifierProvider(
                    create: (_) => HomeState(), child: const HomeScreen()));
      default:
        return useMaterial
            ? MaterialPageRoute(builder: (_) => const LoginScreen())
            : CupertinoPageRoute(builder: (_) => const LoginScreen());
      // return useMaterial
      //     ? MaterialPageRoute(
      //         builder: (_) => ChangeNotifierProvider(
      //             create: (_) => HomeState(), child: const HomeScreen()))
      //     : CupertinoPageRoute(
      //         builder: (_) => ChangeNotifierProvider(
      //             create: (_) => HomeState(), child: const HomeScreen()));
    }
  }
}

class RoutePath {
  static const String loginScreen = 'loginScreen';
  static const String homeScreen = 'homeScreen';
  static const String bookmarkScreen = 'bookmarkScreen';
  static const String imageFullscreen = 'imageFullscreen';
}
