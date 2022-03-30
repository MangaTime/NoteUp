import 'package:flutter/material.dart';
import 'package:note_up/core/providers/note_provider.dart';
import 'package:provider/provider.dart';

class BaseViewModel extends ChangeNotifier {
  final BuildContext context;

  // TODO: Set all providers here
  // Example:
  late NoteProvider noteProvider;

  BaseViewModel({required this.context}) {
    // TODO: Retrieve all providers here
    // Example:
    noteProvider = Provider.of<NoteProvider>(context);
  }
}
