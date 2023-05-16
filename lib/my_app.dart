import 'package:flutter/material.dart';
import 'widgets/category_list.dart';
import 'widgets/theme_switching_appbar.dart';


class MyApp extends StatelessWidget {
  final ValueNotifier<ThemeMode> themeMode;

  const MyApp({Key? key, required this.themeMode}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: themeMode,
      builder: (context, ThemeMode value, child) {
        return MaterialApp(
          theme: ThemeData.light(),
          darkTheme: ThemeData.dark(),
          themeMode: value, // this line will set the themeMode
          debugShowCheckedModeBanner: false,
          home: Scaffold(
            appBar: ThemeSwitchingAppBar(themeMode: themeMode),
            body: CategoryList(),
          ),
        );
      },
    );
  }
}