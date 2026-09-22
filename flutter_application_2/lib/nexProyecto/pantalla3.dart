import 'package:flutter/material.dart';
import 'package:flutter_application_2/nexProyecto/config.dart';
import 'package:flutter_application_2/nexProyecto/main.dart';
import 'package:flutter_application_2/nexProyecto/appbar.dart';

class Pantalla3Screen extends StatefulWidget {
  const Pantalla3Screen({super.key});

  @override
  State<Pantalla3Screen> createState() =>
      _Pantalla3ScreenState();
}

class _Pantalla3ScreenState
    extends State<Pantalla3Screen> {

  int cantidad = 5;

  final Producto producto = Producto(
    nombre: 'Nombre del producto',
    descripcion:
        'Lorem Ipsum is simply dummy text of the printing '
        'and typesetting industry. Lorem Ipsum has been '
        'the industry standard dummy text ever since 1666.',
    precio: 1000,
    imagen: 'https://via.placeholder.com/300',
  );

  void aumentarCantidad() {
    setState(() {
      cantidad++;
    });
  }

  void disminuirCantidad() {
    if (cantidad > 0) {
      setState(() {
        cantidad--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Pantalla 3',
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),

        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start,

          children: [

            // Nombre
            Text(
              producto.nombre,
              style: const TextStyle(
                color: AppColors.text,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 20),

            // Imagen
            Container(
              width: double.infinity,
              height: 200,

              decoration: BoxDecoration(
                color: AppColors.primary,

                borderRadius:
                    BorderRadius.circular(20),

                border: Border.all(
                  color: AppColors.border,
                ),
              ),

              child: ClipRRect(
                borderRadius:
                    BorderRadius.circular(20),

                child: Image.network(
                  producto.imagen,
                  fit: BoxFit.cover,

                  errorBuilder:
                      (context, error, stackTrace) {

                    return const Center(
                      child: Icon(
                        Icons.image,
                        size: 80,
                        color: AppColors.secondaryText,
                      ),
                    );
                  },
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Precio
            Text(
              'Precio \$${producto.precio.toStringAsFixed(0)}',
              style: const TextStyle(
                color: AppColors.text,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 15),

            // Descripción
            const Text(
              'Descripción',
              style: TextStyle(
                color: AppColors.text,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 8),

            Text(
              producto.descripcion,
              style: const TextStyle(
                color: AppColors.secondaryText,
                fontSize: 14,
                height: 1.4,
              ),
            ),

            const SizedBox(height: 30),

            // Cantidad
            Row(
              mainAxisAlignment:
                  MainAxisAlignment.spaceBetween,

              children: [

                // Número
                Container(
                  width: 70,
                  height: 50,

                  alignment: Alignment.center,

                  decoration: BoxDecoration(
                    border: Border.all(
                      color: AppColors.border,
                    ),

                    borderRadius:
                        BorderRadius.circular(12),
                  ),

                  child: Text(
                    cantidad.toString(),
                    style: const TextStyle(
                      fontSize: 20,
                      color: AppColors.text,
                    ),
                  ),
                ),

                // Botón +
                SizedBox(
                  width: 60,
                  height: 50,

                  child: OutlinedButton(
                    onPressed: aumentarCantidad,

                    style: OutlinedButton.styleFrom(
                      foregroundColor:
                          AppColors.text,

                      side: const BorderSide(
                        color: AppColors.border,
                      ),

                      shape:
                          RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(12),
                      ),
                    ),

                    child: const Text(
                      '+',
                      style: TextStyle(
                        fontSize: 25,
                      ),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 15),

            // Botón -
            SizedBox(
              width: double.infinity,
              height: 50,

              child: OutlinedButton(
                onPressed: disminuirCantidad,

                style: OutlinedButton.styleFrom(
                  foregroundColor: AppColors.text,

                  side: const BorderSide(
                    color: AppColors.border,
                  ),

                  shape:
                      RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(12),
                  ),
                ),

                child: const Text(
                  '-',
                  style: TextStyle(
                    fontSize: 25,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}