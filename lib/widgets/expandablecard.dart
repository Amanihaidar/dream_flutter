import 'package:dreamapp/Providers/CartProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/product.dart'; 

class ExpandableCard extends StatefulWidget {
  final String title;
  final String description;
  final String price; 
  final String imageUrl;

  ExpandableCard({
    super.key,
    required this.title,
    required this.description,
    required this.price,
    required this.imageUrl,
  });

  @override
  _ExpandableCardState createState() => _ExpandableCardState();
}

class _ExpandableCardState extends State<ExpandableCard> with SingleTickerProviderStateMixin {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Column(
        children: [
          ListTile(
            title: Text(widget.title),
            subtitle: Text(widget.price),
            trailing: Icon(_isExpanded ? Icons.expand_less : Icons.expand_more),
            onTap: () {
              setState(() {
                _isExpanded = !_isExpanded;
              });
            },
          ),
          if (_isExpanded) ...[
            SizedBox(
              height: 200, 
              width: double.infinity,
              child: Image.network(
                widget.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(widget.description),
            ),
            IconButton(
              icon: Icon(Icons.add_shopping_cart),
              onPressed: () {
                Provider.of<CartProvider>(context, listen: false).addItem(Product(
                  id: 1, 
                  name: widget.title,
                  price: double.parse(widget.price.replaceAll('\$', '')), 
                  imageUrl: widget.imageUrl,
                  description: widget.description,
                  category: 'category', 
                ));
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('${widget.title} added to cart!'),
                  ),
                );
              },
            ),
          ],
        ],
      ),
    );
  }
}