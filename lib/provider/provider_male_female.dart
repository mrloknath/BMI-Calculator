import 'package:flutter/material.dart';

class ProviderMaleFemale extends ChangeNotifier{
  String  _maleFemale="man";

  String get maleFemale=>_maleFemale;

  void changeMaleFemale(String value){
    _maleFemale=value;
    notifyListeners();
  }

}