import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget{
   final String title;
   final TextInputType type;
   final Function callback;

  const MyTextField({required this.title, required this.type, required this.callback });
  @override
  Widget build(BuildContext context){
    return Column(
      children: [

        TextFormField(
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius:BorderRadius.circular(20),
            ),
            hintText: title,
          ),
          onChanged: (value){
            callback(value);
          },
          keyboardType: type,
        ),
        SizedBox(height: 25,),
      ],
    );
  }
}