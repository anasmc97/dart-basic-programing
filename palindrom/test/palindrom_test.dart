import 'package:palindrom/palindrom.dart';
import 'package:test/test.dart';

void main() {
  test('palindrom', () {
    expect(palindromCheck(1, 10), 9);
  });
  test('palindrom', () {
    expect(palindromCheck(99, 100), 1);
  });
  test('palindrom', () {
    expect(palindromCheck(21, 31), 1);
  });
}
