import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled/provider/jsonprovider.dart';

class Splash_screen extends StatefulWidget {
  const Splash_screen({super.key});

  @override
  State<Splash_screen> createState() => _Splash_screenState();
}

class _Splash_screenState extends State<Splash_screen> {
  bool? istap;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //getdata(context);
    Provider.of<JsonProvider>(context,listen: false)
        .getdata()
        .then((value) => Timer(Duration(seconds: 3), () {
              Navigator.of(context).pushNamed((istap==true)?'/':'getstart');
            }));
  }

  getdata(BuildContext context) async{
    SharedPreferences pref=await SharedPreferences.getInstance();
    istap= pref.getBool('istap');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(
                        "https://plus.unsplash.com/premium_photo-1675978140264-64fa94fde9aa?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8cGxhbmV0fGVufDB8fDB8fHww"),
                    fit: BoxFit.fill)),
          ),
          Text("Hii Hello")
        ],
      ),
    );
  }
}
