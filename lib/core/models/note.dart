import 'package:realm/realm.dart';
import 'package:uuid/uuid.dart';
part 'note.g.dart';

@RealmModel()
class _Note {
  @PrimaryKey()
  late String id;

  late String content;
  late String? createdAt;
  late bool? isDir = false;
}
