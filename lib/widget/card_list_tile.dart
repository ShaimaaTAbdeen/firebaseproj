import 'package:flutter/material.dart';

class CardListTile extends StatelessWidget {
   
   CardListTile({required this.title,required this.subTitle});
   String title;
   String subTitle;

  @override
  Widget build(BuildContext context) {
    return Card(
          color: Colors.white,
          child: ListTile(
            title: Text(title,style: TextStyle(fontSize: 20,color: Colors.black),),
            subtitle: Text(subTitle,style: TextStyle(fontSize: 20,color: Colors.black),),
            trailing: Icon(Icons.delete,size:25,color: Colors.red,),
          ),
        );
  }
}