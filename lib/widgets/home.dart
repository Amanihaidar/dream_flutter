import 'package:dreamapp/Screens/CartScreen.dart';
import 'package:dreamapp/widgets/Location.dart';
import 'package:dreamapp/widgets/NotificationWidget.dart'; 
import 'package:dreamapp/widgets/login.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart'; 
import 'sidebar.dart'; 
import 'package:dreamapp/models/product.dart';
import 'package:dreamapp/widgets/productdetail.dart';
import 'package:dreamapp/widgets/searchdelegate.dart';
import 'package:permission_handler/permission_handler.dart'; 

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool isAuthenticated = false; 
  String _locationMessage = "Location not retrieved"; 

  @override
  void initState() {
    super.initState();
    getCurrentLocation(); 
  }

  Future<void> requestLocationPermission() async {
    var status = await Permission.location.request();
    if (status.isGranted) {
    } else if (status.isDenied) {
      setState(() {
        _locationMessage = "Location permission denied.";
      });
    } else if (status.isPermanentlyDenied) {
      openAppSettings();
    }
  }

  Future<void> getCurrentLocation() async {
    await requestLocationPermission(); 
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      setState(() {
        _locationMessage = "Location services are disabled.";
      });
      return;
    }

    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    setState(() {
      _locationMessage = "Latitude: ${position.latitude}, Longitude: ${position.longitude}";
    });
  }

  @override
  Widget build(BuildContext context) {
    if (!isAuthenticated) {
      return LoginPage(onLogin: () {
        setState(() {
          isAuthenticated = true; 
        });
      });
    }

    List<Product> perfumes =
        products.where((p) => p.category.trim() == 'Perfume').toList();
    List<Product> skinProducts =
        products.where((p) => p.category.trim() == 'SkinProduct').toList();
    var screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Dream",
          style: TextStyle(color: Colors.white), 
        ),
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              icon: const Icon(Icons.menu, color: Colors.white), 
            );
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications, color: Colors.white), 
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => NotificationWidget(), 
                ),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.search, color: Colors.white), 
            onPressed: () {
              showSearch(
                context: context,
                delegate: ProductSearchDelegate(products: products),
              );
            },
          ),
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CartScreen(),
                ),
              );
            },
            color: Colors.white, 
            icon: const Icon(Icons.shopping_cart),
          ),
          IconButton(
            onPressed: () {
              setState(() {
                isAuthenticated = false; 
              });
            },
            color: Colors.white, 
            icon: const Icon(Icons.logout),
          ),
          IconButton(
            icon: const Icon(Icons.location_on, color: Colors.white),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LocationApp()),
              );
            },
          ),
        ],
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 217, 167, 226),
      ),
      drawer: Sidebar(
        perfumes: perfumes,
        skinProducts: skinProducts,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Text(
                _locationMessage,
                style: TextStyle(fontSize: 16, color: Colors.black),
              ),
              SizedBox(height: 16), 
              Expanded(
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: screenSize.width > 1200
                        ? 4
                        : screenSize.width > 800
                        ? 3
                        : 2,
                    childAspectRatio: 0.75,
                    crossAxisSpacing: 16.0,
                    mainAxisSpacing: 16.0,
                  ),
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                ProductDetailPage(product: products[index]),
                          ),
                        );
                      },
                      child: Card(
                                               elevation: 2,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: screenSize.width > 1200 ? 250 : 140,
                              width: double.infinity,
                              child: Image.network(
                                products[index].imageUrl,
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
                                          products[index].name,
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 4),
                                  Row(
                                    children: [
                                      Text(
                                        '\$${products[index].price.toStringAsFixed(2)}',
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.grey, 
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}