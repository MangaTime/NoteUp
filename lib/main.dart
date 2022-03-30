import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:note_up/core/providers/note_provider.dart';
import 'package:note_up/ui/screens/home.dart';
import 'package:note_up/ui/screens/splash_screen.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    // TODO: Instance provider

    return MultiProvider(
        providers: [
          Provider<NoteProvider>(
            create: (_) => NoteProvider(),
            dispose: (_, NoteProvider provider) => provider.dispose(),
          ),
        ],
        child: MaterialApp(
          title: 'Flutter Provider Architecture Starter',
          theme: ThemeData(
              // TODO: config app theme over here somehow
              backgroundColor: Colors.white,
              primarySwatch: Colors.blue,
              primaryColor: Colors.amber,
              listTileTheme: const ListTileThemeData(
                tileColor: Colors.yellow,
              )),
          home: HomeScreen(),
        ));
  }
}
