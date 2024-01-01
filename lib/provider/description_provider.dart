import 'package:flutter/material.dart';
import 'package:untitled/model/description_model.dart';

class Description_provider extends ChangeNotifier{
  DescriptionModel descriptionModel=DescriptionModel(isClick: false);
  void show(){
    descriptionModel.isClick=!descriptionModel.isClick;
    notifyListeners();
  }
}