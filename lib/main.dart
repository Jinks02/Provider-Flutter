import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_with_mvvm/provider/auth_provider.dart';
import 'package:provider_with_mvvm/provider/count_provider.dart';
import 'package:provider_with_mvvm/provider/example_one_provider_multi_provider.dart';
import 'package:provider_with_mvvm/provider/favourite_item_provider.dart';
import 'package:provider_with_mvvm/provider/theme_provider.dart';
import 'package:provider_with_mvvm/screens/count_example.dart';
import 'package:provider_with_mvvm/screens/dark_theme_screen.dart';
import 'package:provider_with_mvvm/screens/example_one_screen.dart';
import 'package:provider_with_mvvm/screens/favourite_screen.dart';
import 'package:provider_with_mvvm/screens/login_with_rest_api_auth.dart';
import 'package:provider_with_mvvm/screens/stful_from_stless_screen_value_notifier.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => CountProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ExampleOneProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => FavouriteItemProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ThemeProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => AuthProvider(),
        ),
      ],
      child: Builder(
        builder: (BuildContext context) {
          final _themeProvider = Provider.of<ThemeProvider>(context);
          return MaterialApp(
            themeMode: _themeProvider.getThemeMode,
            title: 'Flutter Demo',
            darkTheme: ThemeData(
                brightness: Brightness.dark,
                appBarTheme: AppBarTheme(color: Colors.brown)),
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            home: LoginScreen(),
          );
        },
      ),
    );
  }
}
