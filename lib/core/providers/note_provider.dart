import 'package:flutter/foundation.dart';
import 'package:note_up/core/models/note.dart';
import 'package:note_up/core/providers/base_provider.dart';
import 'package:realm/realm.dart';
import 'package:uuid/uuid.dart';

class NoteProvider extends BaseProvider {
  late Configuration config;
  late Realm realm;

  NoteProvider() : super() {
    config = Configuration([Note.schema]);
    realm = Realm(config);
  }

  Note addNote() {
    var newNote = Note(const Uuid().v4().toString(), "content",
        createdAt: DateTime.now().toUtc().toIso8601String());
    realm.write(() {
      realm.add(newNote);
    });
    if (kDebugMode) {
      print("added");
    }
    return newNote;
  }

  List<Note> loadNotes(int skip, int take) {
    return realm.all<Note>().skip(skip).take(take).toList();
  }

  void hello() {
    if (kDebugMode) {
      print("object");
    }
  }
}
