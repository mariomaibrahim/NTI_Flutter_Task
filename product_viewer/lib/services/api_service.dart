import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:product_viewer_app/models/product.dart';

class ApiService {
  Future<List<Product>> fetchProducts(String url) async {
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((product) => Product.fromJson(product)).toList();
    } else {
      throw Exception('Failed to load products from $url');
    }
  }
}


