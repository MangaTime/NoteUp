import 'package:realm/realm.dart';
part 'setting.g.dart';

@RealmModel()
class _Setting {
  @PrimaryKey()
  late String key;
  late String value;
}
