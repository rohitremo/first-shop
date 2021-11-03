import 'package:flutter/material.dart';

import '../widgets/products_grid.dart';
import '../screens/cart_screen.dart';

enum FilterOption {
  Favorite,
  All,
}

class ProductsOverviewScreen extends StatefulWidget {
  const ProductsOverviewScreen({Key? key}) : super(key: key);

  @override
  _ProductsOverviewScreenState createState() => _ProductsOverviewScreenState();
}

class _ProductsOverviewScreenState extends State<ProductsOverviewScreen> {
  var _showFavoritesOnly = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Shop'),
        actions: [
          PopupMenuButton(
            icon: Icon(Icons.more_vert),
            onSelected: (FilterOption selectedValue) {
              setState(() {
                if (selectedValue == FilterOption.Favorite) {
                  _showFavoritesOnly = true;
                } else {
                  _showFavoritesOnly = false;
                }
              });
            },
            itemBuilder: (_) => [
              PopupMenuItem(
                child: Text('favotite'),
                value: FilterOption.Favorite,
              ),
              PopupMenuItem(
                child: Text('All'),
                value: FilterOption.All,
              ),
            ],
          ),
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.of(context).pushNamed(CartScreen.routeName);
            },
          )
        ],
      ),
      body: ProductsGrid(_showFavoritesOnly),
    );
  }
}
