import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomActionBar extends StatelessWidget {
  const BottomActionBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Theme.of(context).colorScheme.background,
      child: IconTheme(
        data: IconThemeData(color: Theme.of(context).colorScheme.onPrimary),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            IconButton(
              tooltip: 'Add note',
              icon: const Icon(Icons.playlist_add_rounded),
              color: Theme.of(context).colorScheme.onBackground,
              onPressed: () {
                Navigator.pushNamed(context, "ADD_NOTE");
              },
            ),
            IconButton(
              tooltip: 'Add folder',
              icon: const Icon(Icons.create_new_folder_outlined),
              color: Theme.of(context).colorScheme.onBackground,
              onPressed: () {},
            ),
            IconButton(
              tooltip: 'Settings',
              icon: const Icon(Icons.settings_outlined),
              color: Theme.of(context).colorScheme.onBackground,
              onPressed: () {
                Navigator.pushNamed(context, "SETTINGS");
              },
            ),
          ],
        ),
      ),
    );
  }
}
