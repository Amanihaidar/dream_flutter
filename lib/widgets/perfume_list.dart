// lib/widgets/perfume_list.dart
import 'package:flutter/material.dart';
import '../models/product.dart';

class PerfumeList extends StatelessWidget {
  final List<Product> perfumes;

  const PerfumeList({super.key, required this.perfumes});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Perfumes"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0), 
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, 
            childAspectRatio: 0.75, 
            crossAxisSpacing: 16.0, 
            mainAxisSpacing: 16.0, 
          ),
          itemCount: perfumes.length,
          itemBuilder: (context, index) {
            return Card(
              elevation: 4,
              child: Column(
                mainAxisSize: MainAxisSize.min, 
                crossAxisAlignment:
                    CrossAxisAlignment.start, 
                children: [
                  Container(
                    height: 140, 
                    width: double.infinity,
                    child: Image.network(
                      perfumes[index].imageUrl,
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
                                perfumes[index].name,
                                style:const TextStyle(
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
                              '\$${perfumes[index].price}',
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
