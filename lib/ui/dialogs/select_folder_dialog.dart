import 'package:flutter/material.dart';
import 'package:note_up/core/models/note.dart';
import 'package:note_up/core/viewmodels/dialogs/select_folder_view_model.dart';
import 'package:note_up/ui/dialogs/base_dialog.dart';
import 'package:note_up/ui/shared/view_model_provider.dart';

Future<Note?> showSelectFolderDialog({required BuildContext context}) {
  // var model = SelectFolderViewModel(context: context);
  // bool hasFolders = model.dirs.isNotEmpty;
  return showBaseDialog<Note>(context: context, child: _Content());
}

class _Content extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<SelectFolderViewModel>(
        model: SelectFolderViewModel(context: context),
        builder: (SelectFolderViewModel model) {
          return model.dirs.isNotEmpty
              ? Container(
                  margin: const EdgeInsets.all(24),
                  decoration: const BoxDecoration(color: Colors.white),
                  child: Column(
                    children: [
                      // TODO: link to create folder screen from this popup
                      ListView.builder(
                          scrollDirection: Axis.vertical,
                          itemCount: model.dirs.length,
                          itemBuilder: (BuildContext context, int index) {
                            return ListTile(
                                onTap: () {
                                  model.selectFolder(model.dirs[index]);
                                },
                                title: Text(model.dirs[index].title));
                          })

                      // const Center(
                      //     child: Text("No folders"),
                      //   )
                    ],
                  ))
              : AlertDialog(
                  title: const Text(
                      'You don\'t have any folders yet, please create them first'),
                  // content: SingleChildScrollView(
                  //   child: ListBody(
                  //     children: const <Widget>[
                  //       Text('Would you like to approve of this message?'),
                  //     ],
                  //   ),
                  // ),
                  actions: <Widget>[
                    TextButton(
                      child: const Text('Ok'),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                );
        });
  }
}
