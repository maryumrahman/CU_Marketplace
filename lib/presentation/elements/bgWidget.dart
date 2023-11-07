import 'package:flutter/cupertino.dart';

import '../../configs/constants/assets.dart';


 Widget bgWidget({required Widget ch}){
   return Container(
     decoration:BoxDecoration(
       image:DecorationImage(image:AssetImage(Assets.imagesAppLogo), fit:BoxFit.fill )),
       child:ch
     );
 }