import 'dart:convert';

import 'package:http/http.dart' as http;

class Cart {
  const Cart({required this.id, required this.items});

  final int id;
  final List<CartItem> items;

  double get total => items.fold(
        0,
        (sum, item) => sum + item.price * item.quantity,
      );
}

class CartItem {
  const CartItem({
    required this.title,
    required this.image,
    required this.price,
    required this.quantity,
  });

  final String title;
  final String image;
  final double price;
  final int quantity;
}

Future<List<Cart>> fetchCarts() async {
  const baseUrl = 'https://fakestoreapi.com';
  final responses = await Future.wait([
    http.get(Uri.parse('$baseUrl/carts')),
    http.get(Uri.parse('$baseUrl/products')),
  ]);

  if (responses.any((response) => response.statusCode != 200)) {
    throw Exception('No se pudieron cargar los carritos y productos');
  }

  final cartData = jsonDecode(responses[0].body) as List<dynamic>;
  final productData = jsonDecode(responses[1].body) as List<dynamic>;
  final productsById = {
    for (final value in productData)
      (value['id'] as num).toInt(): Map<String, dynamic>.from(value as Map),
  };

  return cartData.map((value) {
    final cart = Map<String, dynamic>.from(value as Map);
    final items = (cart['products'] as List<dynamic>).map((value) {
      final cartItem = Map<String, dynamic>.from(value as Map);
      final productId = (cartItem['productId'] as num).toInt();
      final product = productsById[productId];

      return CartItem(
        title: product?['title'] as String? ?? 'Producto $productId',
        image: product?['image'] as String? ?? '',
        price: (product?['price'] as num?)?.toDouble() ?? 0,
        quantity: (cartItem['quantity'] as num?)?.toInt() ?? 0,
      );
    }).toList();

    return Cart(
      id: (cart['id'] as num).toInt(),
      items: items,
    );
  }).toList();
}