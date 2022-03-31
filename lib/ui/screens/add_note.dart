import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:note_up/core/models/note.dart';
import 'package:note_up/core/viewmodels/screens/home_screen_view_model.dart';
import 'package:note_up/ui/shared/view_model_provider.dart';
import 'package:note_up/ui/widgets/paged_animated_list/paged_animated_list.dart';

class AddNoteScreen extends StatelessWidget {
  const AddNoteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add note"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => {Navigator.pop(context)},
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.add,
              color: Theme.of(context).colorScheme.onPrimary,
            ),
            onPressed: () => {Navigator.pop(context)},
          )
        ],
      ),
      body: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(children: const [
            TextField(
              decoration: InputDecoration(hintText: "Title"),
              minLines: 1,
              maxLines: 1,
            ),
            SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(hintText: "Content"),
              minLines: 6,
              maxLines: 6,
            )
          ])),
    );
  }
}
