import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app/screens/product_list.dart';
import 'package:recipe_app/services/api_services.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        Provider(create: (_) => ApiService()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Cosmetics',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        scaffoldBackgroundColor: Colors.white,
      ),
      home:  ProductListScreen(),
    );
  }
}
