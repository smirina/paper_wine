import 'dart:async';

import 'package:flutter/material.dart';

class ProductPage extends StatelessWidget {
  final String title;
  final String imageUrl;
  final String description;

  ProductPage(this.title, this.imageUrl, this.description);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image.asset('assets/food.jpg'),
            Container(
              padding: EdgeInsets.all(10.0),
              child: Text(description),
            ),
          ],
        ));
  }
}
