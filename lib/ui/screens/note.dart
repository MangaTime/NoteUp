import 'package:flutter/material.dart';
import 'package:note_up/core/models/note.dart';
import 'package:note_up/core/viewmodels/screens/note_screen_view_model.dart';
import 'package:note_up/ui/dialogs/showSelectFolderDialog.dart';
import 'package:note_up/ui/shared/view_model_provider.dart';

class NoteRouteArguments {
  NoteRouteArguments({this.id});
  final String? id;
}

class NoteScreen extends StatelessWidget {
  const NoteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var id =
        (ModalRoute.of(context)?.settings.arguments as NoteRouteArguments?)?.id;
    return ViewModelProvider<NoteScreenViewModel>(
        model: NoteScreenViewModel(context: context, id: id),
        builder: (NoteScreenViewModel model) {
          return Scaffold(
              // persistentFooterButtons: [
              // AnimatedSize(
              //   child: Container(
              //     height: model.id != null ? 100 : 0,
              //     child:
              // Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceAround,
              //     children: [
              //       IconButton(
              //           onPressed: () {},
              //           icon: const Icon(Icons.delete_outline)),
              //       IconButton(
              //           onPressed: () {},
              //           icon: const Icon(Icons.create_new_folder_outlined)),
              //       IconButton(
              //           onPressed: () {},
              //           icon: const Icon(Icons.push_pin_outlined))
              //     ]),
              // ),
              // duration: const Duration(milliseconds: 2000),
              // curve: Curves.easeIn,
              // )
              // ],
              appBar: AppBar(
                title: const Text("Note"),
                leading: IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () => {Navigator.pop(context)},
                ),
              ),
              body: Column(
                children: [
                  Expanded(
                    child: Padding(
                        padding: const EdgeInsets.all(24),
                        child: Form(
                            onChanged: () => model.onFormUpdate(),
                            key: model.formKey,
                            child: Column(children: [
                              TextFormField(
                                initialValue: model.title,
                                onSaved: ((newValue) =>
                                    model.title = newValue ?? ""),
                                // validator: (value) {
                                //   if (value == null || value.isEmpty) {
                                //     return 'Please enter some text';
                                //   }
                                //   return null;
                                // },
                                decoration:
                                    const InputDecoration(hintText: "Title"),
                                minLines: 1,
                                maxLines: 1,
                              ),
                              const SizedBox(height: 16),
                              TextFormField(
                                initialValue: model.content,
                                onSaved: ((newValue) =>
                                    model.content = newValue ?? ""),
                                decoration:
                                    const InputDecoration(hintText: "Content"),
                                minLines: 6,
                                maxLines: 6,
                              )
                            ]))),
                  ),
                  AnimatedSize(
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border(
                              top: BorderSide(
                                  color: Theme.of(context).colorScheme.primary,
                                  width: 0.5))),
                      height:
                          (model.id != null && model.title.isNotEmpty) ? 50 : 0,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            IconButton(
                                onPressed: () {
                                  model.deleteNote();
                                },
                                icon: const Icon(Icons.delete_outline)),
                            IconButton(
                                onPressed: () async {
                                  Note? note = await showSelectFolderDialog(
                                      context: context);
                                  print(note);
                                },
                                icon: const Icon(
                                    Icons.create_new_folder_outlined)),
                            IconButton(
                                onPressed: () {
                                  model.togglePin();
                                },
                                icon: model.isPinned ?? false
                                    ? const Icon(Icons.push_pin)
                                    : const Icon(Icons.push_pin_outlined))
                          ]),
                    ),
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.ease,
                  )
                ],
              ));
        });
  }
}
