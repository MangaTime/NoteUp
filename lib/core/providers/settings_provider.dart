import 'package:note_up/core/models/setting.dart';
import 'package:note_up/core/providers/base_provider.dart';
import 'package:note_up/core/providers/realm_provider.dart';

class SettingsProvider extends BaseProvider {
  RealmProvider realmProvider;

  SettingsProvider(this.realmProvider) : super();

  Setting updateSetting(String key, String value) {
    Setting? setting = realmProvider.realm.find<Setting>(key);
    if (setting != null) {
      // setting already exist -> update
      realmProvider.realm.write(() {
        setting!.value = value;
      });
    } else {
      // create
      realmProvider.realm.write(() {
        setting = realmProvider.realm.add(Setting(key, value));
      });
    }
    return setting!;
  }

  String? getSetting(String key) {
    return realmProvider.realm.find<Setting>(key)?.value;
  }

  Setting? getSettingObject(String key) {
    return realmProvider.realm.find<Setting>(key);
  }
}
