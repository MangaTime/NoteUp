import 'package:flutter/material.dart';
import 'package:note_up/core/viewmodels/screens/splash_screen_view_model.dart';
import 'package:note_up/ui/shared/view_model_provider.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<SplashScreenViewModel>(
      model: SplashScreenViewModel(context: context),
      builder: (SplashScreenViewModel model) {
        return Scaffold(
          backgroundColor: Colors.black45,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                model.mainTitle,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 20,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                model.secondTitle,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        );
      },
    );
  }
}
