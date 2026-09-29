import 'package:flutter/material.dart';
import 'package:flutter_application_2/ExamenUnidad1/productosScreen.dart';
import 'package:flutter_application_2/api/carts.dart';

class CarritoCompras extends StatefulWidget {
  const CarritoCompras({super.key});

  @override
  State<CarritoCompras> createState() => _CarritoComprasState();
}

class _CarritoComprasState extends State<CarritoCompras> {
  late Future<List<Cart>> _carts;

  @override
  void initState() {
    super.initState();
    _carts = fetchCarts();
  }

  void _retry() {
    setState(() {
      _carts = fetchCarts();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Carrito de Compras'),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          if (index == 0) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const ProductosScreen(),
              ),
            );
          }
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.storefront),
            label: 'Productos',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Carrito',
          ),
        ],
      ),
      body: FutureBuilder<List<Cart>>(
        future: _carts,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text('No se pudo cargar el carrito.'),
                  const SizedBox(height: 8),
                  FilledButton.icon(
                    onPressed: _retry,
                    icon: const Icon(Icons.refresh),
                    label: const Text('Reintentar'),
                  ),
                ],
              ),
            );
          }

          final carts = snapshot.data ?? [];
          if (carts.isEmpty) {
            return const Center(child: Text('No hay productos en el carrito.'));
          }

          return ListView.separated(
            padding: const EdgeInsets.all(16),
            itemCount: carts.length,
            separatorBuilder: (context, index) => const SizedBox(height: 24),
            itemBuilder: (context, index) {
              final cart = carts[index];
              final cartItems = [...cart.items, ...CartManager.itemsForCart(cart.id)];
              final total = cartItems.fold<double>(
                0,
                (sum, item) => sum + (item.price * item.quantity),
              );

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Carrito #${cart.id}',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  if (cartItems.isEmpty)
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 12),
                      child: Text('Este carrito no tiene productos.'),
                    ),
                  ...cartItems.map(
                    (item) => ListTile(
                      contentPadding: EdgeInsets.zero,
                      leading: item.image.isEmpty
                          ? const Icon(Icons.image_not_supported_outlined)
                          : Image.network(
                              item.image,
                              width: 48,
                              height: 48,
                              fit: BoxFit.contain,
                              errorBuilder: (context, error, stackTrace) =>
                                  const Icon(Icons.image_not_supported_outlined),
                            ),
                      title: Text(item.title, maxLines: 2),
                      subtitle: Text(
                        '${item.quantity} x \$${item.price.toStringAsFixed(2)}',
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            '\$${(item.price * item.quantity).toStringAsFixed(2)}',
                          ),
                          const SizedBox(width: 8),
                          IconButton(
                            icon: const Icon(Icons.delete_outline, color: Colors.red),
                            onPressed: () {
                              setState(() {
                                CartManager.removeProduct(cart.id, item.title);
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Divider(),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      'Total: \$${total.toStringAsFixed(2)}',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
