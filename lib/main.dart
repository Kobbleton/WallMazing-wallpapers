import 'package:flutter/material.dart';
import 'my_app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  final themeMode =
      ValueNotifier<ThemeMode>(ThemeMode.dark); // Default to dark theme
  runApp(MyApp(themeMode: themeMode));
}
