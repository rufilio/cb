import 'package:Bliss/screens/navigation.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  late PageController _pageController;

  int _pageIndex = 0;

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Expanded(
                child: PageView.builder(
                  itemCount: demo_data.length,
                  controller: _pageController,
                  onPageChanged: (index) {
                    setState(() {
                      _pageIndex = index;
                    });
                  },
                  itemBuilder: (context, index) => OnBoardContent(
                    image: demo_data[index].image,
                    title: demo_data[index].title,
                    description: demo_data[index].description,
                  ),
                ),
              ),
              Row(
                children: [
                  ...List.generate(
                    demo_data.length,
                    (index) => Padding(
                      padding: const EdgeInsets.only(right: 4),
                      child: DotIndicator(isActive: index == _pageIndex),
                    ),
                  ),
                  const Spacer(),
                  SizedBox(
                    height: 55,
                    width: 55,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.all(0),
                        backgroundColor: const Color.fromRGBO(62, 89, 84, 1),
                        shape: const CircleBorder(),
                      ),
                      onPressed: () {
                        if (_pageIndex < demo_data.length - 1) {
                          // Avanzar a la siguiente página si no es la última
                          _pageController.nextPage(
                            curve: Curves.ease,
                            duration: const Duration(milliseconds: 300),
                          );
                        } else {
                          // Ir a la página de inicio si es la última página
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (context) =>
                                  const NavigationPage(), // Reemplaza con tu widget de la página de inicio
                            ),
                          );
                        }
                      },
                      child: const Icon(
                        Iconsax.arrow_right_1,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              // const SizedBox(height: 15)
            ],
          ),
        ),
      ),
    );
  }
}

class DotIndicator extends StatelessWidget {
  const DotIndicator({
    this.isActive = false,
    super.key,
  });

  final bool isActive;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      curve: Curves.easeOut,
      duration: const Duration(microseconds: 300),
      height: isActive ? 12 : 4,
      width: 4,
      decoration: BoxDecoration(
          color: isActive
              ? const Color.fromRGBO(62, 89, 84, 1)
              : const Color.fromRGBO(62, 89, 84, 1).withOpacity(0.4),
          borderRadius: const BorderRadius.all(Radius.circular(12))),
    );
  }
}

class Onboard {
  final String image, title, description;

  Onboard({
    required this.image,
    required this.title,
    required this.description,
  });
}

// ignore: non_constant_identifier_names
final List demo_data = [
  Onboard(
    image: 'assets/Personaje.png',
    title: 'Bienvenido a Bliss - Descubre el Mundo del Reciclaje',
    description:
        'Explora un planeta más verde con Bliss. Nuestra aplicación te guiará en un viaje emocionante hacia un estilo de vida sostenible. ¡Vamos a reciclar juntos!',
  ),
  Onboard(
    image: 'assets/Personaje.png',
    title: 'Tu Mapa para un Mundo Más Verde',
    description: 'Descubre los puntos de reciclaje cercanos, tiendas eco-amigables y eventos verdes en tu área. Con Bliss, tu mundo sostenible está a solo un toque de distancia.',
  ),
  Onboard(
    image: 'assets/Personaje.png',
    title: 'Inspírate y Aprende Sobre Reciclaje',
    description: 'Nuestro blog está repleto de historias emocionantes, consejos útiles y desafíos ecológicos divertidos. ¡Inspírate y sé parte del cambio con Bliss!',
  ),
];

class OnBoardContent extends StatelessWidget {
  const OnBoardContent({
    super.key,
    required this.image,
    required this.title,
    required this.description,
  });

  final String image, title, description;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        children: [
          const Spacer(),
          Image.asset(
            image,
            height: 350,
          ),
          const Spacer(),
          Text(
            title,
            textAlign: TextAlign.center,
            style: Theme.of(context)
                .textTheme
                .headlineSmall!
                .copyWith(fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 20),
          Text(
            description,
            textAlign: TextAlign.center,
          ),
          const Spacer()
        ],
      ),
    );
  }
}
