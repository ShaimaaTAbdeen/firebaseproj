import 'package:firebase_core/firebase_core.dart';
import 'package:firebaseproj/firebase_options.dart';
import 'package:firebaseproj/widget/card_list_tile.dart';
import 'package:firebaseproj/widget/text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/rendering.dart';
class HomeScreen extends StatefulWidget{
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var namecontroller = TextEditingController();

  var phonecontroller = TextEditingController();

  CollectionReference users = FirebaseFirestore.instance.collection('users');

  //List<QueryDocumentSnapshot> data =[];

  @override
  void initState() {
    super.initState();
   // getData();
   
  }
  Stream<QuerySnapshot> userStream = FirebaseFirestore.instance.collection('users').snapshots();

  @override
  Widget build(BuildContext context) {
    //Firebase.initializeApp();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.black,
      body:Column(children: [
        TextFieldWidget(controller: namecontroller, hintText: 'Enter your name here', iconData: Icons.person),
        SizedBox(height: 10,),
        TextFieldWidget(controller: phonecontroller, hintText: 'Enter your phone here', iconData: Icons.phone),
        SizedBox(height: 20),
        MaterialButton(onPressed: (){
          addUser();
          
        },
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

        StreamBuilder<QuerySnapshot>(
          stream: userStream,
          builder: (context, snapshot) {
            if(snapshot.hasError)
            {
              return Text('Error', style: TextStyle(
                fontSize: 30,
                color:Colors.white,
              ),);
            }
            if(snapshot.connectionState==ConnectionState.waiting)
            {
              return CircularProgressIndicator(color: Colors.white,);
            }
            
            var data = snapshot.data?.docs??[];
            return Expanded(
              child: ListView.builder(itemBuilder:(context,index)=> 
              CardListTile(title: data[index]['name'], 
              subTitle: data[index]['phone'],
              onTap:() async {
                await deleteUser(data[index].id);
              },
              
              ),itemCount: data.length,));
          }
        )
        //CardListTile(title: "Mohamed Eid", subTitle: '01065016127'),
      ],)

    );
  }

    Future<void> addUser() {
      ShowLoading();
      // Call the user's CollectionReference to add a new user
      return users
          .add({
            'name': namecontroller.text, 
            'phone': phonecontroller.text, 
            
          })
          .then((value){
            Navigator.of(context).pop();
            namecontroller.clear();
            phonecontroller.clear();
    })
          .catchError((error) => ShowError('Failed to add user: $error'));
    }

    Future<void>deleteUser(String id)async
    {
      ShowLoading();
      await users.doc(id).delete().then((value)=>Navigator.of(context).pop())
      .catchError((error)=>ShowError('Failed to delete user $error'));
    }
    void ShowLoading()
    {
      showDialog(context: context, builder: (context){
        return AlertDialog(
          content: Row(
            children: [
              SizedBox(width: 10,),
              CircularProgressIndicator(),
              SizedBox(width: 10,),
              Text('Loading',style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),)
            ],
          ),
        );

      }) ;

    }

    void ShowError(String error)
    {
      showDialog(context: context, builder: (context){
        return AlertDialog(
          title: Text('ERROR'),
          content: Row(
            children: [
              SizedBox(width: 10,),
              Icon(Icons.error),
              SizedBox(width: 10,),
              Text(error,style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),)
            ],
            
          ),
          actions: [
            TextButton(onPressed: ()
            {
              Navigator.of(context).pop();
            }, 
            child: Text('Exit'))
          ],
        );

      }) ;

    }

    /*Future <void> getData () async{
      QuerySnapshot snapshot = await users.get();
      data.addAll(snapshot.docs);
       setState(() {
      
    });
    }*/
}