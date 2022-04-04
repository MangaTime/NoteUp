import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:note_up/core/providers/note_provider.dart';
import 'package:note_up/core/providers/realm_provider.dart';
import 'package:note_up/core/providers/settings_provider.dart';
import 'package:note_up/core/viewmodels/screens/app_view_model.dart';
import 'package:note_up/core/viewmodels/screens/settings_screen_view_model.dart';
import 'package:note_up/ui/screens/note.dart';
import 'package:note_up/ui/screens/home.dart';
import 'package:note_up/ui/screens/settings.dart';
import 'package:note_up/ui/screens/splash_screen.dart';
import 'package:note_up/ui/shared/view_model_provider.dart';
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
                Provider<SettingsProvider>(
                  create: (_) => SettingsProvider(realmProvider),
                  dispose: (_, SettingsProvider provider) => provider.dispose(),
                ),
              ],
              builder: (context, child) => ViewModelProvider<AppViewModel>(
                  model: AppViewModel(context: context),
                  builder: (AppViewModel model) {
                    // var settingProvider = Provider.of<SettingsProvider>(context);
                    // var themeColorSetting =
                    //     settingProvider.getSetting('themeColor');
                    // var themeColor = themeColorSetting != null
                    //     ? Color(int.parse(themeColorSetting))
                    //     : Colors.deepOrange;
                    return MaterialApp(
                      debugShowCheckedModeBanner: false,
                      title: 'Flutter Provider Architecture Starter',
                      theme: ThemeData(
                        colorScheme:
                            ColorScheme.fromSeed(seedColor: model.color),
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
                      routes: {
                        "ADD_NOTE": (context) => const NoteScreen(),
                        "SETTINGS": (context) => const SettingsScreen()
                      },
                    );
                  }));
        }));
  }
}
