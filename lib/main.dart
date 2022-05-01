import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:note_up/core/providers/note_provider.dart';
import 'package:note_up/core/providers/realm_provider.dart';
import 'package:note_up/ui/routes/app_routes.dart';
import 'package:note_up/ui/screens/folder/folder.dart';
import 'package:note_up/ui/screens/home/home.dart';
import 'package:note_up/ui/screens/note.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    return Provider<RealmProvider>(
        create: (_) => RealmProvider(),
        dispose: (_, model) => model.dispose(),
        child: Consumer<RealmProvider>(
            builder: (_, RealmProvider realmProvider, __) {
          return MultiProvider(
              providers: [
                Provider<NoteProvider>(
                  create: (_) => NoteProvider(realmProvider),
                  dispose: (_, NoteProvider provider) => provider.dispose(),
                ),
              ],
              child: MaterialApp(
                debugShowCheckedModeBanner: false,
                theme: ThemeData(
                    brightness: Brightness.dark, primaryColor: Colors.blueGrey),
                initialRoute: AppRoutes.home.route,
                routes: {
                  AppRoutes.home.route: (context) => const HomeScreen(),
                  AppRoutes.addNote.route: (context) => const NoteScreen(),
                  AppRoutes.addFolder.route: (context) => const FolderScreen()
                },
              ));
        }));
  }
}
