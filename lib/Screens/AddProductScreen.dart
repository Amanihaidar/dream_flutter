// lib/widgets/add_product_screen.dart
import 'package:dreamapp/Providers/ProductProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/product.dart';

class AddProductScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final Product product = Product(id: 0, name: '', category: '', description: '', price: 0.0, imageUrl: '');

  AddProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Product'),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextFormField(
                decoration:const InputDecoration(labelText: 'Product Name'),
                onSaved: (value) {
                  product.name = value!;
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a product name';
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration:const InputDecoration(labelText: 'Category'),
                onSaved: (value) {
                  product.category = value!;
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a category';
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Description'),
                onSaved: (value) {
                  product.description = value!;
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a description';
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Price'),
                keyboardType: TextInputType.number,
                onSaved: (value) {
                  product.price = double.tryParse(value!) ?? 0.0;
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a price';
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration:const InputDecoration(labelText: 'Image URL'),
                onSaved: (value) {
                  product.imageUrl = value!;
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter an image URL';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    final newProduct = Product(
                      id: DateTime.now().millisecondsSinceEpoch,
                      name: product.name,
                      category: product.category,
                      description: product.description,
                      price: product.price,
                      imageUrl: product.imageUrl,
                    );

                    productProvider.addProduct(newProduct);
                    Navigator.pop(context); 
                  }
                },
                child: const  Text('Add Product'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}