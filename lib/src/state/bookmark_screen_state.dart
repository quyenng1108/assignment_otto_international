import 'package:assignment_otto_international/src/dependencies.dart';
import 'package:assignment_otto_international/src/models/bookmark_item_model.dart';
import 'package:assignment_otto_international/src/state/base_state.dart';
import 'package:assignment_otto_international/src/storage/hive_storage.dart';

class BookmarkScreenState extends BaseState {
  BookmarkScreenState() {
    getBookmarkList();
  }

  List<BookmarkItemModel> bookmarkList = [];
  final HiveStorage hive = getIt();

  void getBookmarkList() {
    Map<dynamic, dynamic> bookmarkMap = hive.bookmarkList;
    bookmarkMap.forEach((key, value) {
      bookmarkList.insert(0, BookmarkItemModel(id: key, url: value));
    });
    dismissLoading();
  }
}
