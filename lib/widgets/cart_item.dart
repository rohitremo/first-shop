import 'package:flutter/material.dart';

class CartItem extends StatelessWidget {
  final String id;
  final String title;
  final double price;
  final int quantity;
  final String productId;

  CartItem({
    required this.id,
    required this.title,
    required this.price,
    required this.quantity,
    required this.productId,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: ListTile(
          leading: CircleAvatar(
            child: Padding(
              padding: const EdgeInsets.all(5),
              child: FittedBox(
                child: Text('$price\$'),
              ),
            ),
          ),
          title: Text(title),
          subtitle: Text('Total: ${(quantity * price).toStringAsFixed(2)}\$'),
          trailing: Text('${quantity}x'),
        ),
      ),
    );
  }
}
