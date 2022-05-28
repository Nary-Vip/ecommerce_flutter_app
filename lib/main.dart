import 'package:basics/pages/LoginPage.dart';
import 'package:basics/pages/home.dart';
import 'package:basics/utils/routes_pages.dart';
import 'package:basics/widgets/themes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NaryKart',
      theme: MyThemes.litethemedata(context),
      darkTheme: ThemeData(brightness: Brightness.dark),
      themeMode: ThemeMode.light,
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      routes: {
        "/": (context) => const HomePage(),
        MyRoutes.homeRoute: (context) => const HomePage(),
        MyRoutes.loginRoute: (context) => const LoginPage()
      },
    );
  }
}
