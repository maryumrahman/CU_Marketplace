
import 'package:connect_ummah/configs/constants/extensions.dart';
import 'package:connect_ummah/configs/constants/styles.dart';
import 'package:flutter/material.dart';

import 'colors.dart';

Widget customTextField({required String title, controller }){
  return Column(
    children:[
      title!.box(height:10),
      TextFormField(
        decoration: const InputDecoration(
          hintStyle:TextStyle(
                    fontFamily: semibold,
                    color:textfieldGrey,
                  ),
          isDense: true,
          fillColor: lightGrey,
          filled:true,
          border: InputBorder.none,
          focusedBorder: OutlineInputBorder( borderSide: BorderSide(color:redColor) ),
        )
      )
    ]
  );
 }