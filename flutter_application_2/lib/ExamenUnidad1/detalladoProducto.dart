import 'package:flutter/material.dart';
import 'package:flutter_application_2/ExamenUnidad1/producto.dart';
import 'package:flutter_application_2/api/carts.dart';

class DetalladoProducto extends StatefulWidget {
  const DetalladoProducto({super.key, required this.producto});

  final Producto producto;

  @override
  State<DetalladoProducto> createState() => _DetalladoProductoState();
}

class _DetalladoProductoState extends State<DetalladoProducto> {
  Future<List<Cart>> _loadCarts() async => fetchCarts();

  Future<void> _agregarAlCarrito() async {
    final carts = await _loadCarts();

    if (!mounted) return;

    if (carts.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('No hay carritos disponibles.')),
      );
      return;
    }

    final selectedId = await showDialog<int>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Selecciona un carrito'),
          content: SizedBox(
            width: double.maxFinite,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: carts.length,
              itemBuilder: (context, index) {
                final cart = carts[index];
                return ListTile(
                  title: Text('Carrito #${cart.id}'),
                  onTap: () => Navigator.pop(context, cart.id),
                );
              },
            ),
          ),
        );
      },
    );

    if (selectedId == null || !mounted) return;

    CartManager.addProduct(widget.producto, selectedId);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('${widget.producto.title} agregado al carrito #$selectedId'),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Detalle de producto')),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: ElevatedButton.icon(
            onPressed: _agregarAlCarrito,
            icon: const Icon(Icons.add_shopping_cart),
            label: const Text('Agregar al carrito'),
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 14),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.network(
                widget.producto.image,
                height: 220,
                fit: BoxFit.contain,
                errorBuilder: (context, error, stackTrace) =>
                    const Icon(Icons.image_not_supported_outlined, size: 64),
              ),
            ),
            const SizedBox(height: 24),
            Text(widget.producto.title,
                style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 8),
            Text(widget.producto.category),
            const SizedBox(height: 16),
            Text('\$${widget.producto.price.toStringAsFixed(2)}'),
            const SizedBox(height: 16),
            Text(widget.producto.description),
          ],
        ),
      ),
    );
  }
}