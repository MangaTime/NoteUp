import 'package:flutter/material.dart';
import 'package:note_up/ui/routes/app_routes.dart';

class HomeBottomTabs extends StatelessWidget {
  const HomeBottomTabs({
    Key? key,
  }) : super(key: key);

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
                Navigator.pushNamed(context, AppRoutes.addNote.route);
              },
            ),
            IconButton(
              tooltip: 'Add folder',
              icon: const Icon(Icons.create_new_folder_outlined),
              color: Theme.of(context).colorScheme.onBackground,
              onPressed: () {
                Navigator.pushNamed(context, AppRoutes.addFolder.route);
              },
            ),
            IconButton(
              tooltip: 'Settings',
              icon: const Icon(Icons.settings_outlined),
              color: Theme.of(context).colorScheme.onBackground,
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
