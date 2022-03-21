import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:note_up/ui/screens/home.dart';
import 'package:note_up/ui/screens/splash_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    // TODO: Instance provider
    // Example:
    //    return Provider<AuthenticationProvider>(
    //      builder: (_) => AuthenticationProvider(),
    //      dispose: (_, model) => model.dispose(),
    //      child: Consumer<AuthenticationProvider>(
    //        builder: (_, AuthenticationProvider authenticationProvider, __) {
    //          return MultiProvider(
    //            providers: <SingleChildCloneableWidget>[
    //              Provider<ChatProvider>(
    //                builder: (_) => ChatProvider(authenticationProvider: authenticationProvider),
    //                dispose: (_, ChatProvider provider) => provider.dispose(),
    //              ),
    //              Provider<ResourcesProvider>(
    //                builder: (_) => ResourcesProvider(authenticationProvider: authenticationProvider),
    //                dispose: (_, ResourcesProvider provider) => provider.dispose(),
    //              ),
    //            ],
    //            child: MaterialApp(
    //              title: 'Flutter Provider Architecture Starter',
    //              home: SplashScreen(),
    //            ),
    //          );
    //        },
    //      ),
    //    );

    return MaterialApp(
      title: 'Flutter Provider Architecture Starter',
      theme: ThemeData(
          // TODO: config app theme over here somehow
          primarySwatch: Colors.blue,
          primaryColor: Colors.amber,
          listTileTheme: ListTileThemeData(
            tileColor: Colors.yellow,
          )),
      home: const HomeView(),
    );
  }
}
