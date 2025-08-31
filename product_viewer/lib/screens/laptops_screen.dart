import 'package:flutter/material.dart';
import 'package:product_viewer_app/models/product.dart';
import 'package:product_viewer_app/services/api_service.dart';

class LaptopsScreen extends StatefulWidget {
  const LaptopsScreen({super.key});

  @override
  State<LaptopsScreen> createState() => _LaptopsScreenState();
}

class _LaptopsScreenState extends State<LaptopsScreen> {
  late Future<List<Product>> _productsFuture;

  @override
  void initState() {
    super.initState();
    _productsFuture = ApiService().fetchProducts('https://elwekala.onrender.com/product/Laptops');
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Product>>(
      future: _productsFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator(color: Colors.white));
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}', style: const TextStyle(color: Colors.red)));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text('No laptops found.', style: TextStyle(color: Colors.white)));
        } else {
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              final product = snapshot.data![index];
              return Card(
                color: Colors.grey[900],
                margin: const EdgeInsets.all(8.0),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(product.title, style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 8.0),
                      Text('\$${product.price}', style: const TextStyle(color: Colors.white, fontSize: 16)),
                      const SizedBox(height: 8.0),
                      Text(product.description, style: const TextStyle(color: Colors.grey)),
                      const SizedBox(height: 8.0),
                      Image.network(product.image, height: 100, width: 100, fit: BoxFit.cover),
                    ],
                  ),
                ),
              );
            },
          );
        }
      },
    );
  }
}


