import 'dart:convert';

import 'package:cruid_api_for_task_management/screens/update_product_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

import '../models/product_model.dart';
import '../utils/urls.dart';
import '../widgets/product_item.dart';
import 'Add_new_product_screen.dart';

class HomeSCreen extends StatefulWidget {
  const HomeSCreen({super.key});

  @override
  State<HomeSCreen> createState() => _HomeSCreenState();
}

class _HomeSCreenState extends State<HomeSCreen> {
  List<ProductModel> _productList = [];

  bool _getproductInProgress = false;

  @override
  void initState() {
    super.initState();
    _getProducts();
  }

  Future<void> _getProducts() async {
    _productList.clear();
    _getproductInProgress = true;
    setState(() {});
    Uri uri = Uri.parse(Urls.getProductUrl);
    Response response = await get(uri);

    debugPrint(response.body);
    debugPrint(response.statusCode.toString());

    if (response.statusCode == 200) {
      final decodedJson = jsonDecode(response.body);

      for (Map<String, dynamic> productJson in decodedJson['data']) {
        ProductModel productModel = ProductModel.FromJson(productJson);
        _productList.add(productModel);
      }
    }
    _getproductInProgress = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product List'),
        actions: [
          IconButton(
            onPressed: () {
              _getProducts();
            },
            icon: Icon(Icons.refresh),
          ),
        ],
      ),
      body: Visibility(
        visible: _getproductInProgress == false,
        replacement: Center(child: CircularProgressIndicator()),
        child: ListView.separated(
          itemCount: _productList.length,
          itemBuilder: (context, index) {
            return product_item(
              product: _productList[index],
              refreshProductList: () {
                _getProducts();
              },
            );
          },
          separatorBuilder: (context, index) {
            return Divider(indent: 70);
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddNewProductScreen()),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
