// ignore_for_file: use_key_in_widget_constructors, library_private_types_in_public_api, prefer_const_constructors, unnecessary_string_interpolations

import 'dart:convert';
import 'package:api_task/description_page.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:api_task/dart_classes.dart';

class ProductListPage extends StatefulWidget {
  @override
  _ProductListPageState createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {
  List<ProductList>? productList;
  String? errorMessage;

  Future<void> _fetchData() async {
    try {
      final url =
          Uri.parse('https://pqstec.com/invoiceapps/Values/GetProductList');
      final response = await http.get(
        url,
        headers: {
          'Authorization':
              'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJVc2VySWQiOiI3OCIsIkN1cnJlbnRDb21JZCI6IjEiLCJuYmYiOjE2ODAzMjgyNDksImV4cCI6MTY4MDkzMzA0OSwiaWF0IjoxNjgwMzI4MjQ5fQ.omRdXE60o3NkHdMeY38PywWu83IOrtBhhKzuwWDKxTY'
        },
      );
      final responseData = json.decode(response.body);
      setState(() {
        productList = Products.fromJson(responseData).productList;
      });
    } catch (error) {
      setState(() {
        errorMessage = error.toString();
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[100],
      appBar: AppBar(
        leading: Icon(Icons.home),
        title: Text('Products'),
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductListPage(),
                ),
              );
            },
          ),
        ],
      ),
      body: errorMessage != null
          ? Center(child: Text(errorMessage!))
          : productList == null
              ? Center(child: CircularProgressIndicator())
              : ListView.builder(
                  itemCount: productList!.length,
                  itemBuilder: (context, index) {
                    final product = productList![index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DescriptionPage(
                              product: product,
                            ),
                          ),
                        );
                      },
                      child: Card(
                        color: Colors.blueGrey[300],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        margin: EdgeInsets.all(8.0),
                        child: Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Row(
                            children: [
                              Container(
                                width: 70,
                                height: 70,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  color: Colors.grey[100],
                                ),
                              ),
                              SizedBox(width: 20.0),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    '${product.name.toString()}',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey[800],
                                    ),
                                  ),
                                  SizedBox(height: 15.0),
                                  Text(
                                    'Price: ${product.price!.toDouble()}',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.grey[800],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
    );
  }
}
