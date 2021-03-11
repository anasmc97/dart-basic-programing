import 'package:find_missing_number/find_missing_number.dart';
import 'package:test/test.dart';

void main() {
  test('angka hilang', () {
     expect(missing_digits("23242526272830"), 29); 
     expect(missing_digits("101102103104105106107108109111112113"), 110); 
     expect(missing_digits("12346789"), 5); 
     expect(missing_digits("79101112"), 8); 
     expect(missing_digits("7891012"), 11); 
     expect(missing_digits("9799100101102"), 98); 
     expect(missing_digits("100001100002100003100004100006"), 100005); 
  });
}
