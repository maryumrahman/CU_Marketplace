
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../configs/constants/colors.dart';

import 'loginView.dart';

class SplashScreen extends StatefulWidget {

  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();

}

class _SplashScreenState extends State<SplashScreen> {

  void changeScreen(){
    Future.delayed(Duration(seconds:3));
    Navigator.push(context,
        MaterialPageRoute(builder: (context) {
          return LoginView();
        }));

   // Navigator.of(context).push(MaterialPageRoute(builder: (context){ return  LoginView(); } ));
  }

  @override
  void initState() {
    super.initState();
    changeScreen();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appColor,
      body:Center(
        child:Column(
          children: [
            Container()
          ],
        )
      )
    );
  }

}
