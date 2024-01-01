import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/provider/jsonprovider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var jsonprovider = Provider.of<JsonProvider>(context);
    return Scaffold(
        body: Stack(
      children: [
        Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/image/1.jpg"), fit: BoxFit.fill)),
        ),
        ListView.builder(
          itemCount: jsonprovider.jsondata.length,
          itemBuilder: (context, index) => Container(
            width: double.infinity,
            margin: EdgeInsets.all(18),
            decoration: BoxDecoration(
                color: Colors.white10, borderRadius: BorderRadius.circular(18)),
            child: Column(
              children: [
                Image(
                    image: NetworkImage(
                  "${jsonprovider.jsondata[index].image}",
                )),
                SizedBox(
                  height: 15,
                ),
                Text(
                  "${jsonprovider.jsondata[index].name}",
                  style: TextStyle(fontSize: 35, color: Colors.white),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  height: 40,
                  width: 350,
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Colors.black12,
                      borderRadius: BorderRadius.circular(18)),
                  child: Center(
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context)
                            .pushNamed('detail', arguments: index);
                      },
                      child: Text(
                        "More About This Planet",
                        style: TextStyle(color: Colors.green),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    ));
  }
}
