import 'dart:convert';

import 'package:flutter_application_2/ExamenUnidad1/producto.dart';
import 'package:http/http.dart' as http;

class CartManager {
  static final Map<int, List<CartItem>> _cartItemsById = {};

  static List<CartItem> itemsForCart(int cartId) {
    return List.unmodifiable(_cartItemsById[cartId] ?? const <CartItem>[]);
  }

  static void addProduct(Producto product, int cartId) {
    final items = _cartItemsById.putIfAbsent(cartId, () => <CartItem>[]);
    final index = items.indexWhere((item) => item.title == product.title);

    if (index >= 0) {
      final current = items[index];
      items[index] = CartItem(
        title: current.title,
        image: current.image,
        price: current.price,
        quantity: current.quantity + 1,
      );
      return;
    }

    items.add(
      CartItem(
        title: product.title,
        image: product.image,
        price: product.price,
        quantity: 1,
      ),
    );
  }

  static void removeProduct(int cartId, String productTitle) {
    final items = _cartItemsById[cartId];
    if (items == null) return;

    items.removeWhere((item) => item.title == productTitle);
    if (items.isEmpty) {
      _cartItemsById.remove(cartId);
    }
  }

  static void clear() => _cartItemsById.clear();
}

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