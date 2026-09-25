import 'package:evently/screens/create_event_screen.dart';
import 'package:evently/app_theme.dart';
import 'package:evently/screens/home_screen.dart';
import 'package:evently/screens/login_screen.dart';
import 'package:evently/screens/register_screen.dart';
import 'package:evently/screens/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(Evently());
}

class Evently extends StatelessWidget {
  const Evently({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        //SplashScreen.routeName: (_) => SplashScreen(),
        // RegisterScreen.routeName: (_) => RegisterScreen(),
        // LoginScreen.routeName: (_) => LoginScreen(),
        HomeScreen.routeName: (_) => HomeScreen(),
        CreateEventScreen.routeName: (_) => CreateEventScreen(),
      },
      initialRoute: HomeScreen.routeName,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.light,
    );
  }
}
