import 'package:flutter/cupertino.dart';

class ProviderAge extends ChangeNotifier{

  int _age=50;

  int get age=>_age;

  void incrementAge(){
    _age=(age>=120)?120:age+1;
    notifyListeners();
  }

  void decrementAge(){
    _age=(age<=0)?0:age-1;
    notifyListeners();
  }


  void changeAge(int value){
    _age=value;
    notifyListeners();
  }

}