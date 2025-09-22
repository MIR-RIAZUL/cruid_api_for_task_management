import 'package:cruid_api_for_task_management/screens/update_product_screen.dart';
import 'package:flutter/material.dart';

import '../models/product.dart';

class product_item extends StatelessWidget {
  const product_item({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.network(
        width: 40,
        product.image,
        errorBuilder: (_, __, ___) {
          return Icon(Icons.error, size: 40);
        },
      ),
      title: Text(product.Name),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Product Code: ${product.Code}"),

          Row(
            spacing: 15,
            children: [
              Text('Quantity: ${product.quentity}'),
              Text('Unit Price: ${product.UnitPrice}'),
            ],
          ),
        ],
      ),
      trailing: PopupMenuButton<ProductOption>(
        itemBuilder: (context) {
          return [
            PopupMenuItem(value: ProductOption.update, child: Text('Update')),
            PopupMenuItem(value: ProductOption.delete, child: Text('Delete')),
          ];
        },
        onSelected: (ProductOption SelectedOption) {
          if (SelectedOption == ProductOption.delete) {
            print("delete");
          } else if (SelectedOption == ProductOption.update) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => UpdateProductScreen()),
            );
          }
        },
      ),
    );
  }
}

enum ProductOption { update, delete }
