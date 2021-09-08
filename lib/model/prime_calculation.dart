import 'package:flutter/material.dart';

class PrimeCalculation extends ChangeNotifier{
  var result = "";
  void calculatePrime(int number1, int number2) {
    if(result.isNotEmpty){
      result = "";
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
        result = result + i.toString() + " ";
      }
    }
    notifyListeners();
  }
  String get getResult{
    return result;
  }
}