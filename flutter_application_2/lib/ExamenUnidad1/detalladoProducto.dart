import 'package:flutter/material.dart';
import 'package:flutter_application_2/ExamenUnidad1/producto.dart';

class DetalladoProducto extends StatelessWidget {
  const DetalladoProducto({super.key, required this.producto});

  final Producto producto;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Detalle de producto')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.network(
                producto.image,
                height: 220,
                fit: BoxFit.contain,
                errorBuilder: (context, error, stackTrace) =>
                    const Icon(Icons.image_not_supported_outlined, size: 64),
              ),
            ),
            const SizedBox(height: 24),
            Text(producto.title, style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 8),
            Text(producto.category),
            const SizedBox(height: 16),
            Text('\$${producto.price.toStringAsFixed(2)}'),
            const SizedBox(height: 16),
            Text(producto.description),
          ],
        ),
      ),
    );
  }
}