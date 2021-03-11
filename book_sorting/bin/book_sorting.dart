import 'dart:io';

import 'package:book_sorting/book_sorting.dart' as book_sorting;

void main(List<String> arguments) {
  print("masukan input: ");
  String input =  stdin.readLineSync();
  //convert input into list
  List listInput = input.split(" ");
  //print(listInput);
  //call function sortingbyHeight
  List sortByHeight = sortingByHeight(listInput);
  //call function sortingByCategory
  List sortBycategory = sortingByCategory(sortByHeight);
  //call function sameValue
  List mapOutput = sameValue(sortBycategory);
  //call function convertToList
  List listOutput = convertToList(mapOutput);
  //convert listOutput into String
  String hasilAkhir = listOutput.join(" ");
  print(hasilAkhir);


}
List rawOutput = [];
  List output = [];
  List hasil = [];
  List<Map> listMapByTinggi = [];

//create function that sort input by height
  List sortingByHeight(List input) {
    //create loop process to create list of map object from list
    for (int i = 0; i < input.length; i++) {
      //convert String from index of input list into map object
      Map mapInput = {
        'category': input[i].substring(0, 1),
        'judul': input[i].substring(1, 2),
        "identitas": input[i].substring(0, 2),
        "tinggi": input[i].substring(2, 4)
      };
      //adding object of map into List of Map object
      listMapByTinggi.add(mapInput);
    }
    //sorting content of listMapByTinggi by value of tinggi
    listMapByTinggi.sort(
        (tinggi1, tinggi2) => tinggi2['tinggi'].compareTo(tinggi1['tinggi']));
    //print(listMapByTinggi);
    return listMapByTinggi;
  }

//create function that sorting it by category which has been determined
  List sortingByCategory(List listMapByTinggi) {
    //create loop process for object listMapbyTinggi
    for (int i = 0; i < listMapByTinggi.length; i++) {
      //if listMapByTinggi index of "i" have value of "category" == 6 then add it to new list object
      if (listMapByTinggi[i]['category'] == "6") {
        rawOutput.add(listMapByTinggi[i]);
      }
    }
    //create again loop process for object listMapbyTinggi
    for (int i = 0; i < listMapByTinggi.length; i++) {
      //if listMapByTinggi index of "i" have value of "category" == 7 then add it to new list object
      if (listMapByTinggi[i]['category'] == "7") {
        rawOutput.add(listMapByTinggi[i]);
      }
    }
    //create again loop process for object listMapbyTinggi
    for (int i = 0; i < listMapByTinggi.length; i++) {
      //if listMapByTinggi index of "i" have value of "category" == 0 then add it to new list object
      if (listMapByTinggi[i]['category'] == "0") {
        rawOutput.add(listMapByTinggi[i]);
      }
    }
    //create again loop process for object listMapbyTinggi
    for (int i = 0; i < listMapByTinggi.length; i++) {
      //if listMapByTinggi index of "i" have value of "category" == 9 then add it to new list object
      if (listMapByTinggi[i]['category'] == "9") {
        rawOutput.add(listMapByTinggi[i]);
      }
    }
    //create again loop process for object listMapbyTinggi
    for (int i = 0; i < listMapByTinggi.length; i++) {
      //if listMapByTinggi index of "i" have value of "category" == 4 then add it to new list object
      if (listMapByTinggi[i]['category'] == "4") {
        rawOutput.add(listMapByTinggi[i]);
      }
    }
    //create again loop process for object listMapbyTinggi
    for (int i = 0; i < listMapByTinggi.length; i++) {
      //if listMapByTinggi index of "i" have value of "category" == 8 then add it to new list object
      if (listMapByTinggi[i]['category'] == "8") {
        rawOutput.add(listMapByTinggi[i]);
      }
    }
    //create again loop process for object listMapbyTinggi
    for (int i = 0; i < listMapByTinggi.length; i++) {
      //if listMapByTinggi index of "i" have value of "category" == 1 then add it to new list object
      if (listMapByTinggi[i]['category'] == "1") {
        rawOutput.add(listMapByTinggi[i]);
      }
    }
    //create again loop process for object listMapbyTinggi
    for (int i = 0; i < listMapByTinggi.length; i++) {
      //if listMapByTinggi index of "i" have value of "category" == 2 then add it to new list object
      if (listMapByTinggi[i]['category'] == "2") {
        rawOutput.add(listMapByTinggi[i]);
      }
    }
    //create again loop process for object listMapbyTinggi
    for (int i = 0; i < listMapByTinggi.length; i++) {
      //if listMapByTinggi index of "i" have value of "category" == 5 then add it to new list object
      if (listMapByTinggi[i]['category'] == "5") {
        rawOutput.add(listMapByTinggi[i]);
      }
    }
    //create again loop process for object listMapbyTinggi
    for (int i = 0; i < listMapByTinggi.length; i++) {
      //if listMapByTinggi index of "i" have value of "category" == 3 then add it to new list object
      if (listMapByTinggi[i]['category'] == "3") {
        rawOutput.add(listMapByTinggi[i]);
      }
    }
    return rawOutput;
  }

//create function which check book with same identity
  List sameValue(List rawOutput) {
    //create again loop process for object rawOutput
    for (int i = 0; i < rawOutput.length; i++) {
      //create object count that count amount of book that have same identity
      int count = 0;
      //if list of output is still empty just add rawOutput index of "i"
      if (output.isEmpty) {
        output.add(rawOutput[i]);
      } else {
        //if list of output is not empty, create looping process for list of output which check same identity value, if they have the same identity count +1
        for (int a = 0; a < output.length; a++) {
          if (output[a]["identitas"] == rawOutput[i]["identitas"]) {
            count++;
          }
        }
        //if count less than 2 add rawouput index of "i"
        if (count < 2) {
          output.add(rawOutput[i]);
        }
      }
    }
    return output;
  }
//create function that convert from map to list
  List convertToList(List output) {
    //create looping for output
    for (int i = 0; i < output.length; i++) {
      //add output of i to list hasil
      hasil.add(
          output[i]["category"] + output[i]["judul"] + output[i]["tinggi"]);
    }
    return hasil;
  }

