import 'package:flutter/material.dart';

class PopupPage extends StatelessWidget {
  const PopupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 40),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: MaterialButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                height: 55,
                minWidth: 55,
                color: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50.0),
                ),
                child: const Icon(
                  Icons.close,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(
              height: 300,
              child: Stack(children: [
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: Image.network(
                    'https://ouch-cdn2.icons8.com/As6ct-Fovab32SIyMatjsqIaIjM9Jg1PblII8YAtBtQ/rs:fit:784:784/czM6Ly9pY29uczgu/b3VjaC1wcm9kLmFz/c2V0cy9zdmcvNTg4/LzNmMDU5Mzc0LTky/OTQtNDk5MC1hZGY2/LTA2YTkyMDZhNWZl/NC5zdmc.png',
                    height: 400,
                  ),
                ),
              ]),
            ),
            const SizedBox(height: 40),
            const Text(
              'Botellas con Magia',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF101010),
                  fontSize: 35),
            ),
            const SizedBox(height: 40),
            const Text(
              'Descubre la magia del reciclaje transformando tus botellas de plástico en coloridas lámparas DIY. Ilumina tu espacio mientras le das una segunda vida a esos envases que pensabas desechar.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.w300,
                fontSize: 15,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
