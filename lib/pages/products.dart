import 'package:flutter/material.dart';

import '../product_manager.dart';

class ProductsPage extends StatelessWidget {
  final List<Map<String, dynamic>> products;
  final List<String> basicTags;

  ProductsPage(this.products, this.basicTags);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Paper Wines'),
      ),
      body: Column(
        children: <Widget>[
          Container(),
          ProductManager(products),
        ],
      ) 
    );
  }
}
