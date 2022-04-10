import 'package:realm/realm.dart';
part 'note.g.dart';

@RealmModel()
class _Note {
  @PrimaryKey()
  late String id;

  late String title;
  late String? content;

  late String? createdAt;
  late String? customIcon;
  late bool isDir = false;
  late bool isPinned = false;

  late _Note? parent;
}
