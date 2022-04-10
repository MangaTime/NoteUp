import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:note_up/core/providers/note_provider.dart';
import 'package:note_up/core/providers/realm_provider.dart';
import 'package:note_up/ui/screens/note.dart';
import 'package:note_up/ui/screens/home.dart';
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
                title: 'Flutter Provider Architecture Starter',
                theme: ThemeData(
                  colorScheme:
                      ColorScheme.fromSeed(seedColor: Colors.deepOrange),
                ),
                // TODO: config app theme over here somehow
                // backgroundColor: Colors.white,
                // bottomAppBarTheme: BottomAppBarTheme(),
                // primarySwatch: Colors.blue,
                // primaryColor: Colors.amber,
                // listTileTheme: const ListTileThemeData(
                //   tileColor: Colors.yellow,
                // )),
                home: const HomeScreen(),
                routes: {"ADD_NOTE": (context) => const NoteScreen()},
              ));
        }));
  }
}
