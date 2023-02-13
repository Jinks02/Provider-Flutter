import 'package:flutter/foundation.dart';

class CountProvider with ChangeNotifier {
int _count =47;
int get getCount => _count;

void incrementCount (){
  _count++;
  notifyListeners();
}
}