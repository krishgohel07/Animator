import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/provider/description_provider.dart';
import 'package:untitled/provider/jsonprovider.dart';
import 'package:untitled/provider/theme_provider.dart';

class Detail_screen extends StatefulWidget {
  const Detail_screen({super.key});

  @override
  State<Detail_screen> createState() => _Detail_screenState();
}

class _Detail_screenState extends State<Detail_screen>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animationController = AnimationController(
        vsync: this,
        upperBound: 1,
        lowerBound: 0,
        duration: Duration(seconds: 2));
  }

  @override
  Widget build(BuildContext context) {
    int index = ModalRoute.of(context)!.settings.arguments as int;
    var provider = Provider.of<JsonProvider>(context);
    var description = Provider.of<Description_provider>(context);
    var theme = Provider.of<ThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                theme.changetheme();
              },
              icon: (theme.thememodel.isDark == true)
                  ? Icon(Icons.light_mode)
                  : Icon(Icons.dark_mode_outlined))
        ],
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text("${provider.jsondata[index].name}"),
            SizedBox(
              height: 10,
            ),
            AnimatedBuilder(
                animation: animationController,
                builder: (context, widget) {
                  return Transform.rotate(
                    angle: animationController.value * 2 * pi,
                    child: Image(
                      image: NetworkImage("${provider.jsondata[index].image}"),
                    ),
                  );
                }),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  height: 40,
                  width: 120,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.black12),
                  child: Center(
                    child: InkWell(
                      onTap: () {
                        animationController.repeat();
                      },
                      child: Text(
                        "Start Animation",
                        style: TextStyle(color: Colors.green),
                      ),
                    ),
                  ),
                ),
                // Container(
                //   height: 40,
                //   width: 120,
                //   decoration: BoxDecoration(
                //       borderRadius: BorderRadius.circular(10),
                //       color: Colors.white10),
                //   child: Center(
                //     child: InkWell(
                //       onTap: () {
                //         animationController.repeat();
                //       },
                //       child: Text(
                //         "Repeat Animation",
                //         style: TextStyle(color: Colors.yellowAccent),
                //       ),
                //     ),
                //   ),
                // ),
                Container(
                  height: 40,
                  width: 120,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white10),
                  child: Center(
                    child: InkWell(
                      onTap: () {
                        animationController.stop();
                      },
                      child: Text(
                        "Stop Animation",
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                  ),
                )
              ],
            ),
            Container(
              height:
                  (description.descriptionModel.isClick == true) ? 436 : 250,
              width: double.infinity,
              margin: EdgeInsets.only(left: 30, top: 40, right: 30),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white12),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 15, left: 15),
                        child: Column(
                          children: [
                            Text(
                              "Velocity",
                              style: TextStyle(fontSize: 30),
                            ),
                            Text(
                              "${provider.jsondata[index].velocity}",
                              style: TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 15, left: 15),
                        child: Column(
                          children: [
                            Text(
                              "Orbital Period",
                              style: TextStyle(fontSize: 28),
                            ),
                            Text(
                              "${provider.jsondata[index].period}",
                              style: TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 15, left: 15),
                        child: Column(
                          children: [
                            Text(
                              "Distance",
                              style: TextStyle(fontSize: 30),
                            ),
                            Text(
                              "${provider.jsondata[index].distance}",
                              style: TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 15, left: 15),
                        child: Column(
                          children: [
                            Text(
                              "Radius",
                              style: TextStyle(fontSize: 30),
                            ),
                            Text(
                              "${provider.jsondata[index].radius}",
                              style: TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  TextButton(
                      onPressed: () {
                        description.show();
                      },
                      child: Text((description.descriptionModel.isClick == true)
                          ? "Hide Description"
                          : "Show Description")),
                  if (description.descriptionModel.isClick == true)
                    Text("${provider.jsondata[index].discription}")
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
