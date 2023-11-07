
import 'package:connect_ummah/presentation/providers/bottom_navigation_bar_provider.dart';
import 'package:connect_ummah/presentation/providers/remember_me_provider.dart';
import 'package:connect_ummah/presentation/screens/Auth/splash.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_)=> RememberMe() ),
      ChangeNotifierProvider(create: (_)=> BottomNavigationBarProvider() ),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: SplashScreen(),
    );
  }

}