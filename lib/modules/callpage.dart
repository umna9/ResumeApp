import 'dart:io';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:share_plus/share_plus.dart';

class CallPage extends StatelessWidget {


  final String name;
  final String email;
  final String phone;
  final String? website;
  final String imagePath;

  const CallPage({
    required this.name,
    required this.phone,
    required this.email,
    required this.website,
    required this.imagePath,
  });


  @override
  Widget build(BuildContext context) {
   var appBar = AppBar(
     backgroundColor: Colors.white,
     elevation: 0,
     leading: IconButton(
       color: Colors.blue,
       icon: Icon(Icons.arrow_back_ios_outlined),
       onPressed: (){
         Navigator.pop(context);
       },
     ),
     actions: [
       IconButton(
         color: Colors.blue,
         icon: Icon(Icons.share),
         onPressed: (){
           Share.share('My name is: $name\n My email is: $email\n My github id: https://github.com/umnak99');
         },
       ),
       SizedBox(width: 5,),
     ],
   );


    return Scaffold(

      appBar: appBar,


      body: Container(
        width: double.infinity,
        height: (MediaQuery.of(context).size.height) - appBar.preferredSize.height-MediaQuery.of(context).padding.top * 0.7,
        color: Colors.white,
        child: Column(
          children: [

            SizedBox(height: 40,),

            Image.file(File(imagePath), width: 200, height: 200,),

            Text("My name is $name", style: TextStyle(fontSize: 20, color: Colors.blue)),
            SizedBox(height: 20,),




            //phone
            TextButton(
                onPressed: (){
                  launch("tel://$phone");
                },
                child: Text('Call me')
            ),
            SizedBox(height: 10,),

            //email
            TextButton(
                onPressed: (){
                  launch("mailto:$email?subject= flutter course &body= hi");
                },
                child: Text('email me')
            ),
            SizedBox(height: 10,),

            //website
            TextButton(
                onPressed: (){
                  launch("$website");
                },
                child: Text('website')
            ),

          ],
        ),
      ),
    );
  }
}
