import 'package:flutter/cupertino.dart';

class ProviderHeight extends ChangeNotifier{

  int _height=180;

  int get height=>_height;

  void incrementHeight(){
    _height=(height>=300)?300:height+1;
    notifyListeners();
  }

  void decrementHeight(){
    _height=(height<=0)?0:height-1;
    notifyListeners();
  }

  void changeHeight(int value){
    _height=value;
    notifyListeners();
  }

}