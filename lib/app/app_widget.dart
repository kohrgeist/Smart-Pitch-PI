//import 'package:flutter/material.dart';
//import 'routes/app_pages.dart';
//import 'routes/app_routes.dart';

//class AppWidget extends StatelessWidget {
//const AppWidget({super.key});

//@override
//Widget build(BuildContext context) {
//return MaterialApp(
//debugShowCheckedModeBanner: false,
//title: 'Projeto 01 - Smart Pitch',
//theme: ThemeData(useMaterial3: true),
//initialRoute: AppRoutes.splash,
//routes: AppPages.routes,
//);
//}
//}
//
import 'package:flutter/material.dart';
import 'routes/app_pages.dart';
import 'routes/app_routes.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Projeto 01 - Smart Pitch',
      theme: ThemeData(useMaterial3: true),
      initialRoute: AppRoutes.login,
      routes: AppPages.routes,
    );
  }
}
