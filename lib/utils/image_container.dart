import 'package:cv_builder_admin/constants.dart';
import 'package:flutter/material.dart';


class LogoContainer{
  Widget logoContainer(){
    return Container(
      height: 500.0,
      width: 200.0,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: primaryColor,width: 2.0),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Center(child: Text("Image",style: TextStyle(color: primaryColor,fontSize: 10.0),)),
    );
  }
}