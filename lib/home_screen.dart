import 'package:firebaseproj/widget/card_list_tile.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget{
  var namecontroller = TextEditingController();
  var phonecontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.black,
      body:Column(children: [
        TextFormField(
          controller: namecontroller,
          style: TextStyle(
            fontSize: 20,
            color:Colors.grey,
          ),
          decoration:InputDecoration(
            hintText :'Enter your name here',
            hintStyle: TextStyle(fontSize: 20,color: Colors.grey),
            suffixIcon: Icon(Icons.person,size: 30,color:Colors.white,),
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
        ),
        SizedBox(height: 10,),
         TextFormField(
          controller:phonecontroller,
          style: TextStyle(
            fontSize: 20,
            color:Colors.grey,
          ),
          decoration:InputDecoration(
            hintText :'Enter your name here',
            hintStyle: TextStyle(fontSize: 20,color: Colors.grey),
            suffixIcon: Icon(Icons.person,size: 30,color:Colors.white,),
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
        ),
        SizedBox(height: 20),
        MaterialButton(onPressed: (){},
        color: Color(0XFF8875FF),
        minWidth: 200,
        child: Text('ADD',
        style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
          color:Colors.white,
        ),),
        ),
        SizedBox(height: 10,),
        CardListTile(title: "Mohamed Eid", subTitle: '01065016127'),
      ],)

    );
  }

}