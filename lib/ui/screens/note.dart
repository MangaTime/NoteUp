import 'package:flutter/material.dart';
import 'package:note_up/core/viewmodels/screens/note_screen_view_model.dart';
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
              persistentFooterButtons: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      model.id != null
                          ? IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.delete_outline))
                          : Text(""),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.create_new_folder_outlined)),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.push_pin_outlined))
                    ]),
              ],
              appBar: AppBar(
                title: const Text("Note"),
                leading: IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () => {Navigator.pop(context)},
                ),
              ),
              body: Column(
                children: [
                  Padding(
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
                ],
              ));
        });
  }
}
