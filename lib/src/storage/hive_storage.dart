import 'package:assignment_otto_international/src/constants.dart';
import 'package:hive_flutter/hive_flutter.dart';

// hive keys

const String bookmarkListKey = 'bookmarkListKey';

class HiveStorage {
  final Box box;
  HiveStorage() : box = Hive.box(bookmarkBox);

  Map<dynamic, dynamic> get bookmarkList =>
      box.get(bookmarkListKey, defaultValue: {});

  void updateBookmarkList(Map<dynamic, dynamic> value) =>
      box.put(bookmarkListKey, value);
}
