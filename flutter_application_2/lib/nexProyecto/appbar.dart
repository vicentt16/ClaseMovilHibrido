import 'package:flutter_application_2/nexProyecto/config.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  final String title;

  const CustomAppBar({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      centerTitle: true,
      backgroundColor: AppColors.background,
      foregroundColor: AppColors.text,
      elevation: 0,
      shape: const Border(
        bottom: BorderSide(
          color: AppColors.border,
          width: 1.5,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}