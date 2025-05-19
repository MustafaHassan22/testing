import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:testing/models/favorits.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  static String routeName = 'favorites_page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Favorites')),
      body: Consumer<Favorites>(
        builder:
            (context, value, child) => ListView.builder(
              itemCount: value.items.length,
              padding: const EdgeInsets.symmetric(vertical: 16),
              itemBuilder:
                  (context, index) => FavoriteItemTile(value.items[index]),
            ),
      ),
    );
  }
}

class FavoriteItemTile extends StatelessWidget {
  const FavoriteItemTile(this.itemNumber, {super.key});

  final int itemNumber;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor:
              Colors.primaries[itemNumber % Colors.primaries.length],
        ),
        title: Text('Item $itemNumber', key: Key('favorites_text_$itemNumber')),
        trailing: IconButton(
          key: Key('remove_icon_$itemNumber'),
          icon: const Icon(Icons.close),
          onPressed: () {
            Provider.of<Favorites>(context, listen: false).remove(itemNumber);
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Removed from favorites.'),
                duration: Duration(seconds: 1),
              ),
            );
          },
        ),
      ),
    );
  }
}
