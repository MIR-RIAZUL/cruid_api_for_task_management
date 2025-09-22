import 'package:cruid_api_for_task_management/screens/update_product_screen.dart';
import 'package:flutter/material.dart';

class product_item extends StatelessWidget {
  const product_item({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(),
      title: Text('Product name'),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Code: 123456'),

          Row(
            spacing: 15,
            children: [Text("Quantity: 5"), Text(" unit Price: 500")],
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
