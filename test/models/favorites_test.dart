import 'package:test/test.dart';
import 'package:testing/models/favorits.dart';

void main() {
  group('testing App Provider', () {
    var favorites = Favorites();
    test('A new item should be added ', () {
      var number = 5;
      favorites.add(number);
      expect(favorites.items.contains(number), true);
    });

    test('item should be removed ', () {
      var number = 22;
      favorites.add(number);
      expect(favorites.items.contains(number), true);
      favorites.remove(number);
      expect(favorites.items.contains(number), false);
    });
  });
}
