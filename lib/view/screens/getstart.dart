import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GetStart extends StatelessWidget {
  const GetStart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(child: Center(child: Text("Welcome To the Galaxy Planet Application"),),),
          Container(
            height: 40,
            margin: EdgeInsets.all(20),
            decoration: BoxDecoration(color: Colors.white12,borderRadius: BorderRadius.circular(15)),
            child: Center(
              child: InkWell(onTap: () async{
                SharedPreferences pref=await SharedPreferences.getInstance();
                pref.setBool('istap', true);
                Navigator.of(context).pushNamed('/');
              }, child: Text("Get Started > ")),
            ),
          )
        ],
      ),
    );
  }
}
