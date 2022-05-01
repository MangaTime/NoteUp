import 'package:flutter/material.dart';
import 'package:note_up/core/viewmodels/screens/note_screen_view_model.dart';
import 'package:note_up/ui/screens/folder/folder_icons.dart';
import 'package:note_up/ui/screens/folder/select_icon_button.dart';
import 'package:note_up/ui/shared/view_model_provider.dart';

class NoteRouteArguments {
  NoteRouteArguments({this.id});
  final String? id;
}

class FolderScreen extends StatefulWidget {
  const FolderScreen({Key? key}) : super(key: key);

  @override
  State<FolderScreen> createState() => _FolderScreenState();
}

class _FolderScreenState extends State<FolderScreen> {
  String selectedIcon = "default";
  String folderName = "";

  void setSelectedIcon(String newIcon) {
    setState(() {
      selectedIcon = newIcon;
    });
  }

  void setFolderName(String newFolderName) {
    setState(() {
      folderName = newFolderName;
    });
  }

  @override
  Widget build(BuildContext context) {
    var id =
        (ModalRoute.of(context)?.settings.arguments as NoteRouteArguments?)?.id;
    return ViewModelProvider<NoteScreenViewModel>(
      model: NoteScreenViewModel(context: context, id: id),
      builder: (NoteScreenViewModel model) {
        return Scaffold(
            appBar: AppBar(
              title: TextField(
                autofocus: true,
                decoration: const InputDecoration(
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    contentPadding: EdgeInsets.only(left: 16, right: 24),
                    hintText: "Folder Name"),
                onSubmitted: (String value) {
                  setFolderName(value);
                },
              ),
              leading: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () => {
                  model.addDir(folderName, selectedIcon),
                  Navigator.pop(context)
                },
              ),
            ),
            body: GridView.count(
              primary: true,
              padding: const EdgeInsets.all(20),
              crossAxisSpacing: 24,
              mainAxisSpacing: 24,
              crossAxisCount: 4,
              children: folderIcons.map(
                (e) {
                  return SelectIconButton(
                    selectedIcon: selectedIcon,
                    icon: e,
                    setSelectedIcon: setSelectedIcon,
                  );
                },
              ).toList(),
            ));
      },
    );
  }
}
