import 'package:flutter/material.dart';
import 'package:td2_app_mobile/UI/mytheme.dart';
import 'package:settings_ui/settings_ui.dart';

class Screen4 extends StatefulWidget {
  @override
  State<Screen4> createState() => _EcranSettingsState();
}

class _EcranSettingsState extends State<Screen4> {
  bool _dark = true;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SettingsList(
        darkTheme: SettingsThemeData(
          settingsListBackground: MyTheme.dark().scaffoldBackgroundColor,
          settingsSectionBackground: MyTheme.dark().scaffoldBackgroundColor,
        ),
        lightTheme: SettingsThemeData(
          settingsListBackground: MyTheme.light().scaffoldBackgroundColor,
          settingsSectionBackground: MyTheme.light().scaffoldBackgroundColor,
        ),
        sections: [
          SettingsSection(
            title: const Text('Theme'),
            tiles: [
              SettingsTile.switchTile(
                initialValue: _dark,
                onToggle: _onToggle,
                title: const Text('Dark mode'),
                leading: const Icon(Icons.invert_colors),)
            ])
        ],
      ),
    );
  }

  _onToggle(bool value) {
    debugPrint('value: $value');
    setState(() {
      _dark = !_dark;
    });
  }
}