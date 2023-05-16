import 'package:flutter/material.dart';

class ThemeSwitchingAppBar extends StatelessWidget implements PreferredSizeWidget {
  final ValueNotifier<ThemeMode> themeMode;

  const ThemeSwitchingAppBar({super.key, required this.themeMode});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('WallMazing Wallpapers'),
      actions: [
        ValueListenableBuilder(
          valueListenable: themeMode,
          builder: (context, value, child) {
            return IconButton(
              icon: Icon(
                value == ThemeMode.light ? Icons.dark_mode : Icons.light_mode,
              ),
              onPressed: () {
                if (value == ThemeMode.light) {
                  themeMode.value = ThemeMode.dark;
                } else {
                  themeMode.value = ThemeMode.light;
                }
              },
            );
          },
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
