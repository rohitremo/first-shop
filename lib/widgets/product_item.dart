import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/product.dart';
import '../provider/cart_provider.dart';
import '../screens/product_detail_screen.dart';

class ProductItem extends StatelessWidget {
  // const ProductItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context, listen: false);
    final cartProduct = Provider.of<CartProvider>(context, listen: false);
    print('build run');
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: GridTile(
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(ProductDetailScreen.routeName,
                arguments: product.id);
          },
          child: Image.network(
            product.imageUrl,
            fit: BoxFit.cover,
          ),
        ),
        footer: GridTileBar(
          leading: Consumer<Product>(
            builder: (ctx, product, _) => IconButton(
              icon: product.isFavorite
                  ? Icon(Icons.favorite)
                  : Icon(Icons.favorite_outline),
              onPressed: product.toogleFavorite,
            ),
          ),
          title: Text(product.title),
          trailing: IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () =>
                cartProduct.addItem(product.id, product.title, product.price),
          ),
        ),
      ),
    );
  }
}
