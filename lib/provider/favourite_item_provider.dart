import 'package:flutter/foundation.dart';

class FavouriteItemProvider with ChangeNotifier{
  List<int> _selectedItemList =[];
  List<int> get getSelectedItemList => _selectedItemList;

  void addSelectedItem (int value){
    _selectedItemList.add(value);
    notifyListeners();
  }

  void removeSelectedItem (int value){
    _selectedItemList.remove(value);
    notifyListeners();
  }
}