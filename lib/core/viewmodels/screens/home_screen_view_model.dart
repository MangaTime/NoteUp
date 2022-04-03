import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:note_up/core/models/note.dart';
import 'package:note_up/core/providers/note_provider.dart';
import 'package:note_up/core/viewmodels/base_view_model.dart';
import 'package:provider/provider.dart';
import 'package:realm/realm.dart';

const initialTake = 20;
const furtherTake = 5;

class HomeScreenViewModel extends BaseViewModel {
  late RealmResults<Note> pinned;
  late RealmResults<Note> dirs;
  late RealmResults<Note> notes;

  late StreamSubscription<RealmResultsChanges<Note>> pinnedSub;
  late StreamSubscription<RealmResultsChanges<Note>> dirsSub;
  late StreamSubscription<RealmResultsChanges<Note>> notesSub;
  HomeScreenViewModel({required BuildContext context})
      : super(context: context) {
    // noteProvider = Provider.of<NoteProvider>(context);
    // pagingState = PagingState(nextPageKey: 0, itemList: List<Note>.empty());
    notes = noteProvider.getAllNotes(parent: null);
    dirs = noteProvider.getAllDirs(parent: null);
    pinned = noteProvider.getAllPinned();
    pinnedSub = pinned.changes.listen((event) {
      notifyListeners();
    });
    dirsSub = dirs.changes.listen((event) {
      notifyListeners();
    });
    notesSub = notes.changes.listen((event) {
      notifyListeners();
    });
  }

  void addNote() {
    noteProvider.addNote("content");
    notifyListeners();
  }

  @override
  void dispose() async {
    await pinnedSub.cancel();
    await dirsSub.cancel();
    await notesSub.cancel();
    super.dispose();
  }
}
