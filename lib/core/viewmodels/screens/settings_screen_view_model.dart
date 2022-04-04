import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:note_up/core/models/setting.dart';
import 'package:note_up/core/providers/settings_provider.dart';
import 'package:note_up/core/viewmodels/base_view_model.dart';
import 'package:realm/realm.dart';

class SettingsScreenViewModel extends BaseViewModel {
  late Setting themeColorSetting;
  late Color color;
  late StreamSubscription<RealmObjectChanges<Setting>> colorChangedSub;
  SettingsScreenViewModel({required BuildContext context})
      : super(context: context) {
    var existingSetting = settingsProvider.getSettingObject('themeColor');
    if (existingSetting != null) {
      themeColorSetting = existingSetting;
    } else {
      themeColorSetting = settingsProvider.updateSetting(
          'themeColor', Colors.orange.value.toString());
    }
    color = Color(int.parse(themeColorSetting.value));
    colorChangedSub = themeColorSetting.changes.listen((event) {
      color = Color(int.parse(themeColorSetting.value));
      notifyListeners();
    });
  }

  void updateColor(Color newColor) {
    settingsProvider.updateSetting('themeColor', newColor.value.toString());
    notifyListeners();
  }

  @override
  void dispose() async {
    await colorChangedSub.cancel();
    super.dispose();
  }
}
