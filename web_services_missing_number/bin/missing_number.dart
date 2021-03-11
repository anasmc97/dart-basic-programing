int missing_digits(String stringNumber){
  //l is a total digit first number
  int l = 1;
  //create looping process until get return value or break
  while (true){
    // return -1 if starting number gets too large
    if (l > stringNumber.length/2){
      return -1;
    }
    //nextnum: next number to find
    int nextnum = int.parse(stringNumber.substring(0,l));
    // stringTest: get value of string in strinjgNumber exceot value nextnum to test against
    String stringTest = stringNumber.substring(nextnum.toString().length);
    // skips: how many numbers have been skipped
    int skips = 0;
    //lastskip: contain either None or the last skipped number if end of input reached
    int lastskip;
    while (true){
      //will return lastskip if stringtest length reach 0 in this looping process
      if (stringTest.length == 0){
        return lastskip;
      }
      // stop if there is more than one number skipped
      if (skips > 1){
        break;
      }

      nextnum = nextnum + 1;

      List listStringNumber = [];
      //convert stringtest into list
      for(int i = 0; i < stringTest.length; i++){
        if(nextnum.toString().length + i <= stringTest.length ){
          //add string depend on nextnum length into listStringNumber
          listStringNumber.add(stringTest.substring(i,nextnum.toString().length + i));
        }
      }
      //convert list into map
      Map mapStringTestNumber = listStringNumber.asMap();
      //get index position from value of map
      var mapKey = mapStringTestNumber.keys.firstWhere(
              (k) => mapStringTestNumber [k] == nextnum.toString(), orElse: () => null);

      try{
      //if index of mapkey == 0 then it same as if nextnum is in index 0
        if (mapKey == 0){
          // continue if so and shorten stringTest
          stringTest = stringTest.substring(nextnum.toString().length);

          continue;
        }
      }
      catch(e){
        print("error");
      }
      // record the lastskip
      lastskip = nextnum;
      // loop to check each sequential number
      skips += 1;

    }
    //loop to increase total digit first number
    l += 1;

  }

}
