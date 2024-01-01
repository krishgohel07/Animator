import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/provider/description_provider.dart';
import 'package:untitled/provider/jsonprovider.dart';
import 'package:untitled/provider/theme_provider.dart';
import 'package:untitled/view/screens/details.dart';
import 'package:untitled/view/screens/getstart.dart';
import 'package:untitled/view/screens/homepage.dart';
import 'package:untitled/view/screens/splashscreen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(Myapp());
}

class Myapp extends StatefulWidget {
  const Myapp({super.key});

  @override
  State<Myapp> createState() => _MyappState();
}

class _MyappState extends State<Myapp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => JsonProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ThemeProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => Description_provider(),
        )
      ],
      builder: (context, child) => MaterialApp(
        theme: ThemeData.light(),
        darkTheme: ThemeData.dark(),
        themeMode:
            (Provider.of<ThemeProvider>(context).thememodel.isDark) ? ThemeMode.dark : ThemeMode.light,
        initialRoute: 'splash',
        routes: {
          'splash': (context) => Splash_screen(),
          'detail': (context) => Detail_screen(),
          '/': (context) => HomePage(),
          'getstart':(context)=>GetStart()
        },
      ),
    );
  }
}
