import 'dart:io';

import 'package:dayone/modules/callpage.dart';
import 'package:flutter/material.dart';
//import 'package:share_plus/share_plus.dart';
import 'package:dayone/modules/mytextfield.dart';
import 'package:image_picker/image_picker.dart';

class HomePage extends StatefulWidget{
     @override
   State<StatefulWidget> createState(){
       return _HomePageState();
     }
}

class _HomePageState extends State<HomePage> {

  String myName = '';
  String myEmail = '';
  String myPhone = '';
  String? myWebsite;
  XFile? image;
  final ImagePicker _picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    var appBar = AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
    );
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: appBar,


      body: Padding(
        padding: EdgeInsets.all(20),
        child: ListView(
          children: [

            InkWell(
              child:
              image == null? Image.asset('assets/images/per.jpg',height: 200,width: 200, ):
              Image.file(File(image!.path)),

              onTap:() async{
                 image = await _picker.pickImage(source: ImageSource.gallery);
                 setState(() {

                 });
              },

            ),

            SizedBox(height: 10,),
            MyTextField(title: 'Enter Name', type: TextInputType.text, callback: (value){myName = value;},),
            MyTextField(title: 'Enter Email', type: TextInputType.emailAddress, callback: (value){myEmail = value;},),
            MyTextField(title: 'Enter Phone', type: TextInputType.phone, callback: (value){myPhone = value;}, ),
            MyTextField(title: 'Enter Website', type: TextInputType.text, callback: (value){myWebsite = value;},),
          ],
        ),
      ),



      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_forward),
        onPressed: (){
          if(myName.isNotEmpty && myEmail.isNotEmpty && myPhone.isNotEmpty && image!=null){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) =>  CallPage(name:myName,
                  phone:myPhone,
                  email:myEmail,
                  website:myWebsite,
                 imagePath: image!.path,
              )),
            );
          }
          else{
            print('User has to enter his data');
          }
        },
      ),

    );
  }
}






