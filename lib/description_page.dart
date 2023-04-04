// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors_in_immutables, prefer_const_constructors

import 'package:api_task/dart_classes.dart';
import 'package:flutter/material.dart';

class DescriptionPage extends StatefulWidget {
  final ProductList product;

  DescriptionPage({required this.product});

  @override
  State<DescriptionPage> createState() => _DescriptionPageState();
}

class _DescriptionPageState extends State<DescriptionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[100],
      appBar: AppBar(
        title: Text(widget.product.name!),
      ),
      body: Column(
        children: [
          Container(
            height: 400.0,
            width: 400.0,
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(40),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                Text(
                  widget.product.name!,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[800],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Code: ${widget.product.code!}',
                  style: TextStyle(color: Colors.grey[800]),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Price: ${widget.product.price} Taka',
                  style: TextStyle(
                    color: Colors.grey[800],
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Size: ${widget.product.sizeName} • Color: ${widget.product.colorName}',
                  style: TextStyle(
                    color: Colors.grey[800],
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
