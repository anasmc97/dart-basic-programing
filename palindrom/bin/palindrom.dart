import 'package:palindrom/palindrom.dart' as palindrom;
import 'dart:io';

void main() {
  print("input ur first Number: ");
  //make input value of firstNumber
  int firstNumber = int.tryParse(stdin.readLineSync());
  print("input ur last Number: ");
  //make input value of lastNumber
  int lastNumber = int.tryParse(stdin.readLineSync());
  //print and calling function of palindromCheck
  print("total of palindrom number from $firstNumber up to $lastNumber is " + palindromCheck(firstNumber, lastNumber).toString());
}

//create a function to check the palindrome number
int palindromCheck(int firstNumber, int lastNumber) {
  //create an object to calculate the number of palindromes obtained in loop process
  int count = 0;
  //create a looping that reverse number from firstNumber up to lastNumber
  for (firstNumber; firstNumber <= lastNumber; firstNumber++) {
    //split object firstNumber into list
    List firstNumberArr = firstNumber.toString().split('');
    //reverse index of object firstNumberArr
    String reversedFirstNumberArr = firstNumberArr.reversed.join();
    //if reversedFirstNumberArr have same value than previous value then count +1
    if (reversedFirstNumberArr == firstNumber.toString()) {
      count+= 1;
    }
  }
  return count;
}
