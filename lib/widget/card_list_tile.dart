import 'package:flutter/material.dart';

class CardListTile extends StatelessWidget {
   
   CardListTile({required this.title,required this.subTitle,required this.onTap});
   String title;
   String subTitle;
   void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
          color: Colors.white,
          child: ListTile(
            title: Text(title,style: TextStyle(fontSize: 20,color: Colors.black),),
            subtitle: Text(subTitle,style: TextStyle(fontSize: 20,color: Colors.black),),
            trailing: InkWell(onTap:onTap,
            child:Icon(Icons.delete,size:25,color: Colors.red,)),
          ),
        );
  }
}