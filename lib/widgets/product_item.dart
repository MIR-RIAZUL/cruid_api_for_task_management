import 'package:cruid_api_for_task_management/screens/update_product_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

import '../models/product_model.dart';
import '../utils/urls.dart';

class product_item extends StatefulWidget {
  const product_item({
    super.key,
    required this.product,
    required this.refreshProductList,
  });

  final ProductModel product;
  final VoidCallback refreshProductList;

  @override
  State<product_item> createState() => _product_itemState();
}

class _product_itemState extends State<product_item> {
  bool _DeleteproductInProgress = false;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.network(
        width: 40,
        widget.product.image,
        errorBuilder: (_, __, ___) {
          return Icon(Icons.error, size: 40);
        },
      ),
      title: Text(widget.product.Name),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Product Code: ${widget.product.Code}"),

          Row(
            spacing: 15,
            children: [
              Text('Quantity: ${widget.product.quentity}'),
              Text('Unit Price: ${widget.product.UnitPrice}'),
            ],
          ),
        ],
      ),
      trailing: Visibility(
        visible: _DeleteproductInProgress == false,
        replacement: SizedBox(
          width: 24,
          height: 24,
          child: CircularProgressIndicator(),
        ),
        child: PopupMenuButton<ProductOption>(
          itemBuilder: (context) {
            return [
              PopupMenuItem(value: ProductOption.update, child: Text('Update')),
              PopupMenuItem(value: ProductOption.delete, child: Text('Delete')),
            ];
          },
          onSelected: (ProductOption SelectedOption) {
            if (SelectedOption == ProductOption.delete) {
              _DeleteProduct();
            } else if (SelectedOption == ProductOption.update) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => UpdateProductScreen()),
              );
            }
          },
        ),
      ),
    );
  }

  Future<void> _DeleteProduct() async {
    _DeleteproductInProgress = true;
    setState(() {});
    Uri uri = Uri.parse(Urls.deleteProduct(widget.product.id));
    Response response = await get(uri);

    debugPrint(response.body);
    debugPrint(response.statusCode.toString());

    if (response.statusCode == 200) {
      widget.refreshProductList();
    }

    _DeleteproductInProgress = false;
    setState(() {});
  }
}

enum ProductOption { update, delete }
