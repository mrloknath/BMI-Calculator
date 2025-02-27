
import 'package:flutter/cupertino.dart';

class ProviderWeight extends ChangeNotifier{

  int _weight=65;

  int get weight=>_weight;

  void incrementWeight(){
    _weight=(weight>=200)?200:weight+1;
    notifyListeners();
  }
  void decrementWeight(){
    _weight=(weight<=0)?0:weight-1;
    notifyListeners();
  }


  void changeWeight(int value){
    _weight=value;
    notifyListeners();
  }

}