import 'package:flutter/material.dart';

class ThemeScreen extends StatelessWidget {
  final ValueChanged<ThemeMode> onThemeChange;

  const ThemeScreen({super.key, required this.onThemeChange});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Choose Theme")),
      body: ListView(
        children: [
          ListTile(
            title: const Text("Dreamy Pastels"),
            onTap: () => onThemeChange(ThemeMode.light),
          ),
          ListTile(
            title: const Text("Earthy Warm"),
            onTap: () => onThemeChange(ThemeMode.system),
          ),
          ListTile(
            title: const Text("Mystic Deep"),
            onTap: () => onThemeChange(ThemeMode.dark),
          ),
        ],
      ),
    );
  }
}