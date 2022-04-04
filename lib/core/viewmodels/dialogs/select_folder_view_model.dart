import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:note_up/core/models/note.dart';
import 'package:note_up/core/viewmodels/base_view_model.dart';
import 'package:realm/realm.dart';

class SelectFolderViewModel extends BaseViewModel {
  late RealmResults<Note> dirs;

  late StreamSubscription<RealmResultsChanges<Note>> dirsSub;
  SelectFolderViewModel({required BuildContext context})
      : super(context: context) {
    // noteProvider = Provider.of<NoteProvider>(context);
    // pagingState = PagingState(nextPageKey: 0, itemList: List<Note>.empty());
    dirs = noteProvider.getAllDirs(parent: null);
    dirsSub = dirs.changes.listen((event) {
      notifyListeners();
    });
  }

  void selectFolder(Note folder) {
    Navigator.pop<Note>(context, folder);
  }

  @override
  void dispose() async {
    await dirsSub.cancel();
    super.dispose();
  }
}
