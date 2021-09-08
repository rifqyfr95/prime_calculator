import 'package:flutter/material.dart';

class PrimeCalculation extends ChangeNotifier{
  var result = [];
  void calculatePrime(int number1, int number2) {
    if(result.isNotEmpty){
      result.clear();
    }
    int i = 0;
    int num = 0;
    for(i = number1;i<number2;i++){
      int counter = 0;
      for(num = i;num>=1;num--){
        if(i%num==0){
          counter = counter + 1;
        }
      }
      if (counter == 2){
        result.add(i);
      }
    }
    notifyListeners();
  }
  List get getResult{
    return result;
  }
}