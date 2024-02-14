import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class SearchHelp extends StatelessWidget {
  const SearchHelp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(62, 89, 84, 1).withOpacity(0.2),
        leading: IconButton(
          icon: const Icon(Iconsax.arrow_left),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const TextField(
          decoration: InputDecoration(
            hintText: 'Buscar en Ayuda',
            border: InputBorder.none,
          ),
        ),
      ),
      body: const SingleChildScrollView(),
    );
  }
}
