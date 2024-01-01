import 'package:flutter/material.dart';
import 'package:untitled/model/thememodel.dart';

class ThemeProvider extends ChangeNotifier{
 Thememodel thememodel=Thememodel(isDark: true);
 void changetheme(){
   thememodel.isDark=!thememodel.isDark;
   notifyListeners();
 }
}