import 'package:flutter/cupertino.dart';
import 'package:note_up/core/models/note.dart';
import 'package:note_up/core/viewmodels/base_view_model.dart';

class NoteScreenViewModel extends BaseViewModel {
  final formKey = GlobalKey<FormState>();
  String? id;
  String title = "";
  String? content;
  bool? isPinned;
  NoteScreenViewModel({required BuildContext context, this.id})
      : super(context: context) {
    // noteProvider = Provider.of<NoteProvider>(context);
    if (id != null) {
      Note? note = noteProvider.getNote(id!);
      if (note != null) {
        title = note.title;
        content = note.content;
        isPinned = note.isPinned;
      }
    }
  }

  void togglePin() {
    if (id != null) {
      Note? note = noteProvider.getNote(id!);
      if (note != null) {
        var changed = noteProvider.setPinnedNote(note, !note.isPinned);
        if (changed) {
          isPinned = note.isPinned;
          notifyListeners();
        }
      }
    }
  }

  void deleteNote() {
    if (id != null) {
      noteProvider.deleteNote(id!);
    }
  }

  void onFormUpdate() {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();

      var updatedNote = noteProvider.addOrUpdateNote(
          id: id, title: title, content: content, isDir: false);
      if (updatedNote != null) {
        id = updatedNote.id;
      }
      notifyListeners();
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
