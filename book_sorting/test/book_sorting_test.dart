import 'package:book_sorting/book_sorting.dart';
import 'package:test/test.dart';

void main() {
  test('urutkan buku', () {
    expect(mainUrutkanBuku("3A13 5X19 9Y20 2C18 1N20 3N20 1M21 1F14 9A21 3N21 0E13 5G14 8A23 9E22 3N14"), "0E13 9E22 9A21 9Y20 8A23 1M21 1N20 1F14 2C18 5X19 5G14 3N21 3N20 3A13");
  });
}
