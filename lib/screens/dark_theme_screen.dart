import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/theme_provider.dart';

class DarkThemeScreen extends StatefulWidget {
  const DarkThemeScreen({Key? key}) : super(key: key);

  @override
  State<DarkThemeScreen> createState() => _DarkThemeScreenState();
}

class _DarkThemeScreenState extends State<DarkThemeScreen> {
  @override
  Widget build(BuildContext context) {
    final _themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("dark theme screen"),
      ),
      body: Column(
        children: [
          RadioListTile(
            title: Text("Light Mode"),
            value: ThemeMode.light,
            groupValue: _themeProvider.getThemeMode,
            onChanged: (value) {
              _themeProvider.setTheme(value!);
            },
          ),
          RadioListTile(
            title: Text("Dark Mode"),
            value: ThemeMode.dark,
            groupValue: _themeProvider.getThemeMode,
            onChanged: (value) {
              _themeProvider.setTheme(value!);
            },
          ),
          RadioListTile(
            title: Text("System Mode"),
            value: ThemeMode.system,
            groupValue: _themeProvider.getThemeMode,
            onChanged: (value) {
              _themeProvider.setTheme(value!);
            },
          ),
        ],
      ),
    );
  }
}
