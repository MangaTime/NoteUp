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

class NoteScreenViewModel extends BaseViewModel {
  final formKey = GlobalKey<FormState>();
  String? id;
  String title = "";
  String? content;
  NoteScreenViewModel({required BuildContext context, this.id})
      : super(context: context) {
    // noteProvider = Provider.of<NoteProvider>(context);
    if (id != null) {
      Note? note = noteProvider.getNote(id!);
      print(note);
      if (note != null) {
        title = note.title;
        content = note.content;
      }
    }
  }

  void onFormUpdate() {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      print('Processing Data' + (formKey.currentState!.toString()));

      var updatedNote = noteProvider.addOrUpdateNote(
          id: id, title: title, content: content, isDir: false);
      if (updatedNote != null) {
        id = updatedNote.id;
      }
      notifyListeners();
      // Navigator.pop(context);
    }
  }

  @override
  void dispose() {
    if (id != null && title.isEmpty) {
      noteProvider.deleteNote(id!);
    }
    super.dispose();
  }
}
