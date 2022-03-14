import 'package:flutter/material.dart';
import 'package:note_up/ui/dialogs/base_dialog.dart';

showExampleDialog({required BuildContext context}) {
  showBaseDialog(context: context, child: _Content());
}

class _Content extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
