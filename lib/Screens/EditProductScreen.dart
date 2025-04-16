import 'package:dreamapp/Providers/ProductProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/product.dart';

class EditProductScreen extends StatelessWidget {
  final Product product;

  EditProductScreen({required this.product});

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Product'),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextFormField(
                initialValue: product.name,
                decoration: InputDecoration(labelText: 'Product Name'),
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
                initialValue: product.category,
                decoration: InputDecoration(labelText: 'Category'),
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
                initialValue: product.description,
                decoration: InputDecoration(labelText: 'Description'),
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
                initialValue: product.price.toString(),
                decoration: InputDecoration(labelText: 'Price'),
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
                initialValue: product.imageUrl,
                decoration: InputDecoration(labelText: 'Image URL'),
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
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    productProvider.updateProduct(product.id, product);
                    Navigator.pop(context); 
                  }
                },
                child: Text('Update Product'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}