import 'package:flutter/material.dart';
import 'package:note_up/core/providers/note_provider.dart';
import 'package:provider/provider.dart';

class BaseViewModel extends ChangeNotifier {
  final BuildContext context;

  // Set all providers
  late NoteProvider noteProvider;

  BaseViewModel({required this.context}) {
    // Retrieve all providers here
    noteProvider = Provider.of<NoteProvider>(context);
  }
}
