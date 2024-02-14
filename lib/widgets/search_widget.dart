import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class SearchWidget extends StatelessWidget {
  final Function() onClick;
  const SearchWidget({super.key, required this.onClick});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      child: Container(
        decoration: BoxDecoration(
          color: const Color.fromRGBO(62, 89, 84, 1).withOpacity(0.2),
          borderRadius: BorderRadius.circular(50),
        ),
        height: 50,
        child: Row(
          children: [
            Container(
              width: 45,
              height: 45,
              padding: const EdgeInsets.all(5),
              child: const Icon(
                Iconsax.search_normal,
                color: Colors.black,
              ),
            ),
            const SizedBox(width: 12),
            const Text(
              "Buscar en Ayuda",
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
