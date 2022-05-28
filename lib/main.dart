import 'package:flutter/material.dart';
import 'package:health_hack/Pages/analyticPage.dart';
import 'package:health_hack/Pages/dashboard.dart';
import 'package:health_hack/Pages/dataEntryPage.dart';
import 'package:health_hack/Pages/forgotPass.dart';
import 'package:health_hack/Pages/MainPage.dart';
import 'package:health_hack/Pages/premiumDetail.dart';
import 'package:health_hack/Pages/resetPage.dart';
import 'package:health_hack/Pages/signupPage.dart';
import 'package:health_hack/models/premium.dart';
import 'package:health_hack/utils/routes.dart';

import 'Pages/MainPage.dart';
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
        themeMode: ThemeMode.light,
        theme: MyTheme.lightTheme(context),
        darkTheme: MyTheme.darkTheme(context),
        initialRoute: MyRoutes.analyticRoute,
        routes: {
          "/": (context) => const SignupPage(),
          MyRoutes.loginRoute: (context) => LoginPage(),
          MyRoutes.signupRoute: (context) => const SignupPage(),
          MyRoutes.forgotRoute: (context) => ForgotPage(),
          MyRoutes.resetRoute: (context) => ResetPage(),
          MyRoutes.entryRoute: (context) => DataEntryPage(),
          MyRoutes.mainRoute: (context) => const MainPage(),
          MyRoutes.dashRoute: (context) => const DashboardPage(),
          MyRoutes.analyticRoute: (context) => const AnalyticsPage(),
          MyRoutes.premiumRoute: (context) => const PremiumDetailPage(),
        },
      ),
    );
  }
}
