import 'package:dreamapp/models/product.dart';
import 'package:flutter/material.dart';

class ProductList extends StatelessWidget {
  final List<Product> products;
  final String searchQuery;

  ProductList({required this.products, required this.searchQuery});

  @override
  Widget build(BuildContext context) {
    List<Product> filteredProducts = products
        .where((product) =>
            product.name.toLowerCase().contains(searchQuery.toLowerCase()))
        .toList();

    return ListView.builder(
      itemCount: filteredProducts.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(filteredProducts[index].name),
          subtitle: Text('\$${filteredProducts[index].price}'),
          leading: Image.network(filteredProducts[index].imageUrl),
        );
      },
    );
  }
}