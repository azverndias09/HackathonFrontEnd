import 'package:flutter/material.dart';
import 'package:health_hack/Pages/signupPage.dart';
import 'package:health_hack/utils/routes.dart';

import 'Pages/HomePage.dart';
import 'Pages/login.dart';
import 'utils/themes.dart';
import 'Pages/signupPage.dart';
import 'package:provider/provider.dart';
import 'utils/api.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ApiProvider(),
      child: MaterialApp(
        title: 'Flutter Demo',
        themeMode: ThemeMode.dark,
        theme: MyTheme.lightTheme(context),
        darkTheme: MyTheme.darkTheme(context),
        initialRoute: MyRoutes.signupRoute,
        routes: {
          "/": (context) => const SignupPage(),
          MyRoutes.homeRoute: (context) => const HomePage(),
          MyRoutes.loginRoute: (context) => LoginPage(),
          MyRoutes.signupRoute: (context) => const SignupPage(),
        },
      ),
    );
  }
}
