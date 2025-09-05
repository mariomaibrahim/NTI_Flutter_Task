import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/api_services.dart';
import '../models/product.dart';

class ProductDetails extends StatelessWidget {
  final int productId;

  const ProductDetails({super.key, required this.productId});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Product>(
      future: Provider.of<ApiService>(context, listen: false).fetchProductById(productId),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            backgroundColor: Colors.black,
            body: Center(child: CircularProgressIndicator(color: Colors.white)),
          );
        } else if (snapshot.hasError) {
          return Scaffold(
            backgroundColor: Colors.black,
            body: Center(
              child: Text(
                "Error: ${snapshot.error}",
                style: TextStyle(color: Colors.white),
              ),
            ),
          );
        } else if (!snapshot.hasData) {
          return const Scaffold(
            backgroundColor: Colors.black,
            body: Center(
              child: Text("Product not found", style: TextStyle(color: Colors.white)),
            ),
          );
        } else {
          final product = snapshot.data!;
          return Scaffold(
            backgroundColor: Colors.black,
            appBar: AppBar(
              backgroundColor: Colors.black,
              title: Text(
                product.title,
                style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              iconTheme: const IconThemeData(color: Colors.white),
              elevation: 2,
            ),
            body: SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (product.image.isNotEmpty)
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.network(
                        product.image,
                        height: 280,
                        width: double.infinity,
                        fit: BoxFit.contain,
                      ),
                    ),
                  const SizedBox(height: 20),

                  // السعر والتقييم
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _InfoBadge(
                        icon: Icons.star,
                        text: "${product.rating}",
                        iconColor: Colors.amber,
                      ),
                      _InfoBadge(
                        icon: Icons.attach_money,
                        text: "${product.price}",
                        iconColor: Colors.greenAccent,
                      ),
                    ],
                  ),

                  const SizedBox(height: 24),

                  // الوصف
                  const Text(
                    "Description",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white70,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    product.description,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.white60,
                      height: 1.4,
                    ),
                  ),

                  const SizedBox(height: 24),

                  // المقاسات المتوفرة
                  if (product.sizes != null && product.sizes!.isNotEmpty) ...[
                    const Text(
                      "Available Sizes",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white70,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Wrap(
                      spacing: 10,
                      children: product.sizes!.map((size) {
                        return Chip(
                          label: Text(size, style: const TextStyle(color: Colors.white)),
                          backgroundColor: Colors.grey.shade800,
                        );
                      }).toList(),
                    ),
                  ],
                  const SizedBox(height: 32),
                ],
              ),
            ),
          );
        }
      },
    );
  }
}

class _InfoBadge extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color iconColor;

  const _InfoBadge({
    Key? key,
    required this.icon,
    required this.text,
    required this.iconColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.grey.shade900,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Row(
        children: [
          Icon(icon, color: iconColor, size: 20),
          const SizedBox(width: 8),
          Text(
            text,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 16,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
