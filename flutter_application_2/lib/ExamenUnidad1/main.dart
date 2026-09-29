import 'package:flutter/material.dart';
import 'package:flutter_application_2/ExamenUnidad1/login.dart';

void main() {
	runApp(const ExamenApp());
}

class ExamenApp extends StatelessWidget {
	const ExamenApp({super.key});

	@override
	Widget build(BuildContext context) {
		return const MaterialApp(
			debugShowCheckedModeBanner: false,
			home: Login(),
		);
	}
}
