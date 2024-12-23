import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget
{
  TextEditingController controller;
  String hintText ;
  IconData iconData;
  TextFieldWidget({required this.controller,required this.hintText,required this.iconData});
  @override
  Widget build(BuildContext context) {
    return TextFormField(
          controller: controller,
          style: TextStyle(
            fontSize: 20,
            color:Colors.grey,
          ),
          decoration:InputDecoration(
            hintText :hintText,
            hintStyle: TextStyle(fontSize: 20,color: Colors.grey),
            suffixIcon: Icon(iconData,size: 30,color:Colors.white,),
            focusedBorder : OutlineInputBorder(
              borderRadius:BorderRadius.circular(10),
              borderSide : BorderSide(color: Colors.white),

            ),
            enabledBorder : OutlineInputBorder(
              borderRadius:BorderRadius.circular(10),
              borderSide : BorderSide(color: Colors.white),

            ),
            errorBorder :OutlineInputBorder(
              borderRadius:BorderRadius.circular(10),
              borderSide : BorderSide(color: Colors.red),

            ),

          )
        );
  }

}