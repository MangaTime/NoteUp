import 'package:note_up/core/models/note.dart';
import 'package:note_up/core/models/setting.dart';
import 'package:note_up/core/providers/base_provider.dart';
import 'package:realm/realm.dart';

class RealmProvider extends BaseProvider {
  late Configuration config;
  late Realm realm;

  RealmProvider() : super() {
    config = Configuration([Note.schema, Setting.schema]);
    realm = Realm(config);
  }

  @override
  void dispose() {
    realm.close();
  }
}
