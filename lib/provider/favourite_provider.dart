import 'package:flutter/foundation.dart';

class favouriteitemprovider with ChangeNotifier{

  List<int> _selecteditem = [];

  List<int> get selecteditem => _selecteditem;

  void additem(int value){
   _selecteditem.add(value);
   notifyListeners();
  }

  void removeitem(int value){
   _selecteditem.remove(value);
   notifyListeners();
  }
//   double _value = 1.0;
// double get value => _value;

// void setValue(double val){
//   _value = val;
//   notifyListeners();
// }
}