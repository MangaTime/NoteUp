import 'package:flex_color_picker/flex_color_picker.dart';
import 'package:flutter/material.dart';
import 'package:note_up/core/viewmodels/screens/settings_screen_view_model.dart';
import 'package:note_up/ui/shared/view_model_provider.dart';

class SettingsRouteArguments {
  SettingsRouteArguments();
}

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<SettingsScreenViewModel>(
        model: SettingsScreenViewModel(context: context),
        builder: (SettingsScreenViewModel model) {
          return Scaffold(
            appBar: AppBar(
              title: const Text("Settings"),
              leading: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () => {Navigator.pop(context)},
              ),
            ),
            body: Container(
              padding: const EdgeInsets.all(6),
              alignment: Alignment.center,
              child: ColorPicker(
                  // Use the screenPickerColor as start color.
                  color: model.color,
                  // Update the screenPickerColor using the callback.
                  onColorChanged: (Color color) => {model.updateColor(color)},
                  // setState(() => screenPickerColor = color),
                  width: 44,
                  height: 44,
                  borderRadius: 22,
                  pickersEnabled: const {ColorPickerType.accent: false},
                  enableShadesSelection: false,
                  heading: Text(
                    'Select color',
                    style: Theme.of(context).textTheme.headline5,
                  )),
            ),
          );
        });
  }
}
