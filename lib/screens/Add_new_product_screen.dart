import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

class AddNewProductScreen extends StatefulWidget {
  const AddNewProductScreen({super.key});

  @override
  State<AddNewProductScreen> createState() => _AddNewProductScreenState();
}

class _AddNewProductScreenState extends State<AddNewProductScreen> {
  bool _AddproductInProgress = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _codeController = TextEditingController();
  final TextEditingController _quantityController = TextEditingController();
  final TextEditingController _unitPriceController = TextEditingController();
  final TextEditingController _imageUrlController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add New Product')),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                TextField(
                  controller: _nameController,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    hintText: 'Enter Product Name',
                    labelText: 'Product Name',
                  ),
                ),
                TextField(
                  controller: _codeController,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    hintText: 'Enter Product Code',
                    labelText: 'Product Code',
                  ),
                ),
                TextField(
                  keyboardType: TextInputType.number,
                  controller: _quantityController,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    hintText: 'Enter Quantity',
                    labelText: 'Quantity',
                  ),
                ),
                TextField(
                  keyboardType: TextInputType.number,
                  controller: _unitPriceController,
                  textInputAction: TextInputAction.done,
                  decoration: InputDecoration(
                    hintText: 'Enter Unit Price',
                    labelText: 'Unit Price',
                  ),
                ),
                TextField(
                  controller: _imageUrlController,
                  decoration: InputDecoration(
                    hintText: 'image Url',
                    labelText: 'Image Url',
                  ),
                ),
                SizedBox(height: 20),
                Visibility(
                  visible: _AddproductInProgress == false,
                  replacement: Center(child: CircularProgressIndicator()),
                  child: FilledButton(
                    onPressed: _ontapAddProductBUtton,
                    child: Text('Add Product'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _ontapAddProductBUtton() async {
    _AddproductInProgress = true;
    setState(() {});

    //prepare url ro request
    Uri uri = Uri.parse('http://35.73.30.144:2008/api/v1/CreateProduct');
    //prepare data

    Map<String, dynamic> requestbody = {
      "ProductName": _nameController.text,
      "ProductCode": _codeController.text,
      "Img": _imageUrlController.text,
      "Qty": int.parse(_quantityController.text),
      "UnitPrice": int.parse(_unitPriceController.text),
      "TotalPrice":
          int.parse(_quantityController.text) *
          int.parse(_unitPriceController.text),
    };
    //send request
    Response response = await post(
      uri,
      headers: {'Content-Type': 'application/json'},

      body: jsonEncode(requestbody),
    );
    print(response.statusCode);
    print(response.body);

    final decodedjson = jsonDecode(response.body);
    if (decodedjson['status'] == 'success') {
      _clearTextField();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Product created Successfully'),
          backgroundColor: Colors.green,
        ),
      );
    } else {
      String errorMessage = decodedjson['data'];
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(errorMessage), backgroundColor: Colors.red),
      );
    }

    _AddproductInProgress = false;
    setState(() {});
  }

  void _clearTextField() {
    _nameController.clear();
    _codeController.clear();
    _quantityController.clear();
    _unitPriceController.clear();
    _imageUrlController.clear();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _codeController.dispose();
    _quantityController.dispose();
    _unitPriceController.dispose();
    _imageUrlController.dispose();
    super.dispose();
  }
}
