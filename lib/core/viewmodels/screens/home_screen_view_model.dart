import 'package:flutter/cupertino.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:note_up/core/models/note.dart';
import 'package:note_up/core/providers/note_provider.dart';
import 'package:note_up/core/viewmodels/base_view_model.dart';
import 'package:provider/provider.dart';

const initialTake = 20;
const furtherTake = 5;

class HomeScreenViewModel extends BaseViewModel {
  // Values
  // String mainTitle = 'Flutter Provider & ChangeNotifier Starter';
  // String secondTitle = 'by Julien Grand-Chavin';
  // bool hasMore = true;
  late List<Note> notes = List.empty(growable: true);
  late PagingController<int, Note> pagingController;
  // late PagingState<int, Note> pagingState;
  int lastPageKey = 0;
  HomeScreenViewModel({required BuildContext context})
      : super(context: context) {
    noteProvider = Provider.of<NoteProvider>(context);
    // pagingState = PagingState(nextPageKey: 0, itemList: List<Note>.empty());
    pagingController = PagingController(firstPageKey: 0);
    // notes = noteProvider.loadNotes(0, initialTake);
    print('created');
    // loadMore(0);
    pagingController.addPageRequestListener((pageKey) {
      print('page request: ' + pageKey.toString());
      loadMore(pageKey);
    });
  }

  void addNote() {
    noteProvider.addNote();
    refreshView();
    notifyListeners();
  }

  void refreshView() {
    // refresh();
    pagingController.nextPageKey = 0;
    pagingController.itemList = noteProvider.loadNotes(0, initialTake);
    notifyListeners();
  }

  Future<void> loadMore(int pageKey) async {
    await Future.delayed(const Duration(seconds: 1));
    print("pagekey" + pageKey.toString());
    lastPageKey = pageKey;

    if (pageKey == 0) {
      var loadedNotes = noteProvider.loadNotes(0, initialTake);
      pagingController.appendPage(loadedNotes, pageKey + 1);

      return;
    }
    var loadedNotes = noteProvider.loadNotes(
        (pagingController.itemList?.length ?? 0), furtherTake);
    if (loadedNotes.isNotEmpty) {
      pagingController.appendPage(loadedNotes, pageKey + 1);
    } else {
      pagingController.appendLastPage(loadedNotes);
    }
    // pagingController.appendPage(loadedNotes, pageKey + 1);

    // final itemList = notes + loadedNotes;
    // pagingController.itemList = itemList;
    // pagingState = PagingState<int, Note>(
    //     nextPageKey: itemList.length, itemList: itemList, error: null);
    // } else {
    // pagingState = PagingState<int, Note>(
    // nextPageKey: null, itemList: notes, error: null);
    // appendLastPage([]);
    // }
    notifyListeners();
  }

  void hello() {
    noteProvider.hello();
  }
}
