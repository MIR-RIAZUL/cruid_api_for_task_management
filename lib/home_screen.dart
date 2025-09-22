import 'package:flutter/material.dart';

import 'Add_new_product_screen.dart';

class HomeSCreen extends StatefulWidget {
  const HomeSCreen({super.key});

  @override
  State<HomeSCreen> createState() => _HomeSCreenState();
}

class _HomeSCreenState extends State<HomeSCreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Product List')),
      body: ListView.separated(
        itemCount: 10,
        itemBuilder: (context, index) {
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
          );
        },
        separatorBuilder: (context, index) {
          return Divider(indent: 70);
        },
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
