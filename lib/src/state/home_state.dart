import 'package:assignment_otto_international/src/dependencies.dart';
import 'package:assignment_otto_international/src/models/photo_model.dart';
import 'package:assignment_otto_international/src/repository/photo_repository.dart';
import 'package:assignment_otto_international/src/state/base_state.dart';
import 'package:assignment_otto_international/src/storage/hive_storage.dart';

class HomeState extends BaseState {
  HomeState() {
    getBookmarkList();
    fetchPhotos();
  }
  int page = 1;
  final int perPage = 10;
  List<PhotoModel> photoList = [];
  bool hasReachedMax = false;

  Map<dynamic, dynamic> bookmarkList = {};
  final HiveStorage hive = getIt();


  // get list of book mark.
  void getBookmarkList() {
    bookmarkList = hive.bookmarkList;
  }

  void toggleSavingToBookmark(Map<String, String> bookmarkItem) {
    // when the photo has already been in the bookmark, remove it
    if (bookmarkList[bookmarkItem.keys.first] != null) {
      bookmarkList = Map.of(bookmarkList)..remove(bookmarkItem.keys.first);
      // when the photo has not been in the book mark, add it to the book mark
    } else {
      bookmarkList = Map.of(bookmarkList)..addAll(bookmarkItem);
    }
    notifyListeners();
    hive.updateBookmarkList(bookmarkList);
  }

  Future<void> fetchPhotos({bool isRefreshing = false}) async {
    // do nothing when there's no more
    if (hasReachedMax) return;
    try {
      // on init or refreshing, start from page 1
      if (photoList.isEmpty || isRefreshing) {
        if (isRefreshing) {
          page = 1;
        }
        final response = await getIt<PhotoRepository>().fetchPhotos(page: page);
        photoList
          ..clear()
          ..addAll(response);
        page++;
        hasReachedMax = response.length < perPage;
        dismissLoading();
        return;
      }
      // get more photos
      if (isGettingMoreData) return;
      isGettingMoreData = true;
      final response = await getIt<PhotoRepository>().fetchPhotos(page: page);
      photoList.addAll(response);
      page++;
      hasReachedMax = response.length < perPage;
      isGettingMoreData = false;
      notifyListeners();
    } catch (_) {
      if (photoList.isEmpty) {
        dismissLoading();
      }
    }
  }
}
