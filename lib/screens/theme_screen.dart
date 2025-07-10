import 'package:flutter/material.dart';
import '../theme/app_themes.dart';

class ThemeScreen extends StatelessWidget {
  final ValueChanged<ThemeData> onThemeChange;

  const ThemeScreen({super.key, required this.onThemeChange});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Choose Theme")),
      body: ListView(
        children: [
          ListTile(
            title: const Text("Dreamy Pastels"),
            onTap: () => onThemeChange(AppThemes.dreamyPastels),
          ),
          ListTile(
            title: const Text("Earthy Warm"),
            onTap: () => onThemeChange(AppThemes.earthyWarm),
          ),
          ListTile(
            title: const Text("Mystic Deep"),
            onTap: () => onThemeChange(AppThemes.mysticDeep),
          ),
          const Divider(),
          ListTile(
            title: const Text("Blush Bloom"),
            onTap: () => onThemeChange(AppThemes.blushBloom),
          ),
          ListTile(
            title: const Text("Forest Calm"),
            onTap: () => onThemeChange(AppThemes.forestCalm),
          ),
          ListTile(
            title: const Text("Cyber Night"),
            onTap: () => onThemeChange(AppThemes.cyberNight),
          ),
        ],
      ),
    );
  }
}
