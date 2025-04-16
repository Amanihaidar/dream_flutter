import 'package:dreamapp/Providers/CartProvider.dart';
import 'package:dreamapp/Providers/ProductProvider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart'; 
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'widgets/home.dart'; 

Future<void> _backgroundHandler(RemoteMessage message) async {
}
void main()  async  {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
     options: FirebaseOptions(
      apiKey: "AIzaSyCbZoDcEpigZ9ugazuTJ0rF_6LRgqTIycg",
      appId: "1:897098766352:android:0d5013b888f0f27a2c9295",
      messagingSenderId: "897098766352",
      projectId: "dream-125a5",
    ),
  );
  FirebaseMessaging.onBackgroundMessage(_backgroundHandler);

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CartProvider()),
        ChangeNotifierProvider(create: (context) => ProductProvider()), 
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(), 
    );
  }
}