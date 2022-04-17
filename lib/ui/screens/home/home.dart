import 'package:flutter/material.dart';
import 'package:note_up/core/viewmodels/screens/home_screen_view_model.dart';
import 'package:note_up/ui/screens/home/home_bottom_tabs.dart';
import 'package:note_up/ui/screens/home/home_note_section.dart';
import 'package:note_up/ui/shared/view_model_provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => ViewModelProvider<HomeScreenViewModel>(
      model: HomeScreenViewModel(context: context),
      builder: (HomeScreenViewModel model) {
        return Scaffold(
            body: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                      child: ListView(
                    children: [
                      {
                        "title": "Pinned",
                        "icon": Icons.push_pin_outlined,
                        "data": model.pinned
                      },
                      {
                        "title": "Folders",
                        "icon": Icons.folder_open,
                        "data": model.dirs
                      },
                      {
                        "title": "Notes",
                        "icon": Icons.list,
                        "data": model.notes
                      }
                    ].map(
                      (e) {
                        return HomeNoteSection(
                          section: e,
                        );
                      },
                    ).toList(),
                  ))
                ]),
            bottomNavigationBar: const HomeBottomTabs());
      });
}
