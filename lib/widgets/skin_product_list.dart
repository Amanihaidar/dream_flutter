import 'package:flutter/material.dart';
import '../models/product.dart';

class SkinProductList extends StatelessWidget {
  final List<Product> skinProducts;

  const SkinProductList({super.key, required this.skinProducts});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Skin Products"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0), 
        child: GridView.builder(
          gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, 
            childAspectRatio: 0.75, 
            crossAxisSpacing: 16.0, 
            mainAxisSpacing: 16.0, 
          ),
          itemCount: skinProducts.length,
          itemBuilder: (context, index) {
            return Card(
              elevation: 4,
              child: Column(
                mainAxisSize: MainAxisSize.min, 
                crossAxisAlignment: CrossAxisAlignment.start, 
                children: [
                  Container(
                    height: 140, 
                    width: double.infinity,
                    child: Image.network(
                      skinProducts[index].imageUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                skinProducts[index].name,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 4),
                        Row(
                          children: [
                            Text(
                              '\$${skinProducts[index].price}',
                              style: TextStyle(fontSize: 14),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}