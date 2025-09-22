import 'package:flutter/material.dart';

class AddNewProductScreen extends StatefulWidget {
  const AddNewProductScreen({super.key});

  @override
  State<AddNewProductScreen> createState() => _AddNewProductScreenState();
}

class _AddNewProductScreenState extends State<AddNewProductScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add New Product')),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                TextField(
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    hintText: 'Enter Product Name',
                    labelText: 'Product Name',
                  ),
                ),
                TextField(
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    hintText: 'Enter Product Code',
                    labelText: 'Product Code',
                  ),
                ),
                TextField(
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    hintText: 'Enter Quantity',
                    labelText: 'Quantity',
                  ),
                ),
                TextField(
                  textInputAction: TextInputAction.done,
                  decoration: InputDecoration(
                    hintText: 'Enter Unit Price',
                    labelText: 'Unit Price',
                  ),
                ),
                TextField(
                  decoration: InputDecoration(
                    hintText: 'image Url',
                    labelText: 'Image Url',
                  ),
                ),
                SizedBox(height: 20),
                FilledButton(onPressed: () {}, child: Text('Add Product')),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
