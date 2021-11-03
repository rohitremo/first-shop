import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/cart_provider.dart';
import '../provider/products_provider.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({Key? key}) : super(key: key);

  static const routeName = '/product-detail';

  @override
  Widget build(BuildContext context) {
    final productId = ModalRoute.of(context)?.settings.arguments as String;

    final loadedproduct = Provider.of<ProductsProvider>(context, listen: false)
        .findById(productId);
    final cartProduct = Provider.of<CartProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: Text(loadedproduct.title),
      ),
      body: Column(
        children: [
          Image.network(
            loadedproduct.imageUrl,
            fit: BoxFit.cover,
            width: double.infinity,
            height: 300,
          ),
          SizedBox(height: 10),
          Text('\$ ${loadedproduct.price}'),
          SizedBox(height: 10),
          SingleChildScrollView(
            child: Container(
              height: 176,
              child: Text(loadedproduct.description),
            ),
          ),
          Row(
            children: [
              Expanded(
                flex: 1,
                child: ElevatedButton(
                  child: Text('Add to cart'),
                  //style: ButtonStyle(),
                  onPressed: () {
                    cartProduct.addItem(
                      loadedproduct.id,
                      loadedproduct.title,
                      loadedproduct.price,
                    );
                    Navigator.of(context).pop();
                  },
                ),
              ),
              Expanded(
                flex: 1,
                child: ElevatedButton(
                  child: Text('Buy now'),
                  onPressed: () {},
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
