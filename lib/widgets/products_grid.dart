import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/product_item.dart';
import '../provider/products_provider.dart';

class ProductsGrid extends StatelessWidget {
  final bool showFave;

  ProductsGrid(this.showFave);

  @override
  Widget build(BuildContext context) {
    final productsProviderData = Provider.of<ProductsProvider>(context);
    final products = showFave
        ? productsProviderData.favoriteitems
        : productsProviderData.items;

    return GridView.builder(
      padding: EdgeInsets.all(10),
      itemCount: products.length,
      itemBuilder: (ctx, index) => ChangeNotifierProvider.value(
        value: products[index],
        child: ProductItem(),
      ),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
    );
  }
}
