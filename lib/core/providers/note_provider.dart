import 'package:flutter/foundation.dart';
import 'package:note_up/core/models/note.dart';
import 'package:note_up/core/providers/base_provider.dart';
import 'package:note_up/core/providers/realm_provider.dart';
import 'package:realm/realm.dart';
import 'package:uuid/uuid.dart';

class NoteProvider extends BaseProvider {
  late Configuration config;
  // late Realm realm;
  RealmProvider realmProvider;

  NoteProvider(this.realmProvider) : super();

  Note addNote(String title,
      {String? content, bool? isDir, Note? parent, String? customIcon}) {
    var newNote = Note(const Uuid().v4().toString(), title,
        createdAt: DateTime.now().toUtc().toIso8601String(),
        content: content,
        isDir: isDir ?? false,
        parent: parent,
        customIcon: customIcon);
    realmProvider.realm.write(() {
      realmProvider.realm.add(newNote);
    });
    if (kDebugMode) {
      print("added note");
    }
    return newNote;
  }

  Note? editNote(String id,
      {String? title,
      String? content,
      bool? isDir,
      Note? parent,
      String? customIcon}) {
    final note = realmProvider.realm.find<Note>(id);
    if (note != null) {
      realmProvider.realm.write(() {
        note.title = title ?? note.title;
        note.content = content ?? note.content;
        note.isDir = isDir ?? note.isDir;
        note.customIcon = customIcon ?? note.customIcon;
        note.parent = parent ?? note.parent;
      });
      if (kDebugMode) {
        print("updated note");
      }
      return note;
    } else {
      return null;
    }
  }

  Note? addOrUpdateNote(
      {String? id,
      String? title,
      String? content,
      bool? isDir,
      Note? parent,
      String? customIcon}) {
    if (id != null) {
      return editNote(id,
          title: title,
          content: content,
          isDir: isDir,
          parent: parent,
          customIcon: customIcon);
    } else {
      if (title != null) {
        return addNote(title,
            content: content,
            isDir: isDir,
            parent: parent,
            customIcon: customIcon);
      } else {
        return null;
      }
    }
  }

  bool setPinnedNote(Note note, bool newStatus) {
    bool originalStatus = note.isPinned;
    if (originalStatus == newStatus) return false;
    realmProvider.realm.write(() {
      note.isPinned = newStatus;
    });
    return true; // return if edit's success or not?
  }

  RealmResults<Note> getAllPinned() {
    var result =
        realmProvider.realm.all<Note>().query(r'isPinned == $0', [true]);
    result.forEach((element) {
      print("hmm" + element.isPinned.toString());
    });
    return result;
  }

  RealmResults<Note> getAllNotes({
    Note? parent,
  }) {
    var result = realmProvider.realm.all<Note>().query(r'isDir == $0', [false]);
    if (parent != null) {
      result = result.query(r'parent.id=$0', [parent.id]);
    }
    return result;
  }

  RealmResults<Note> getAllDirs({
    Note? parent,
  }) {
    var result = realmProvider.realm.all<Note>().query(r'isDir == $0', [true]);
    if (parent != null) {
      result = result.query(r'parent.id=$0', [parent.id]);
    }
    return result;
  }

  Note? getNote(String id) {
    return realmProvider.realm.find<Note>(id);
  }

  bool deleteNote(String id) {
    Note? note = getNote(id);
    if (note != null) {
      realmProvider.realm.write(() {
        realmProvider.realm.delete(note);
      });
      return true;
    } else {
      return false;
    }
  }

  List<Note> loadNotes(
    int skip,
    int take, {
    Note? parent,
  }) {
    return realmProvider.realm.all<Note>().skip(skip).take(take).toList();
  }
}
