import 'package:dreamapp/widgets/ProductManager.dart';
import 'package:flutter/material.dart';
import 'perfume_list.dart'; 
import 'skin_product_list.dart'; 
import '../models/product.dart'; 

class Sidebar extends StatelessWidget {
  final List<Product> perfumes; 
  final List<Product> skinProducts; 

  Sidebar({required this.perfumes, required this.skinProducts});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 226, 169, 248),
            ),
            child: Text(
              'Categories',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            title: Text('Perfumes'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PerfumeList(perfumes: perfumes),
                ),
              );
            },
          ),
          ListTile(
            title: Text('Skin Products'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SkinProductList(skinProducts: skinProducts),
                ),
              );
            },
          ),
          ListTile(
            title: Text('Product Management'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>  ProductManager(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}