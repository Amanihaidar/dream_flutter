import 'package:dreamapp/widgets/expandablecard.dart';
import 'package:dreamapp/widgets/productdetail.dart';
import 'package:flutter/material.dart';
import 'package:dreamapp/models/product.dart';

class ProductSearchDelegate extends SearchDelegate {
  final List<Product> products; 

  ProductSearchDelegate({required this.products});

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
Widget buildResults(BuildContext context) {
  final List<Product> filteredProducts = products
      .where((product) => product.name.toLowerCase().contains(query.toLowerCase()))
      .toList();

  return ListView.builder(
    itemCount: filteredProducts.length,
    itemBuilder: (context, index) {
      return GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ProductDetailPage(product: filteredProducts[index]),
            ),
          );
        },
        child: ExpandableCard(
          title: filteredProducts[index].name,
          description: filteredProducts[index].description,
          price: '\$${filteredProducts[index].price}',
          imageUrl: filteredProducts[index].imageUrl,
        ),
      );
    },
  );
}

  @override
  Widget buildSuggestions(BuildContext context) {
    final List<Product> filteredProducts = products
        .where((product) => product.name.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return ListView.builder(
      itemCount: filteredProducts.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(filteredProducts[index].name),
          onTap: () {
            query = filteredProducts[index].name; 
            showResults(context); 
          },
        );
      },
    );
  }
}