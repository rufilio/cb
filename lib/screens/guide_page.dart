import 'package:Bliss/screens/guide_details.dart';
import 'package:Bliss/widgets/guide_items.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class GuideData {
  final String title;
  final String titleshow;
  final String image;
  final String imageshow;
  final String description;
  final Color background;

  GuideData({
    required this.title,
    required this.image,
    required this.description,
    required this.background,
    required this.imageshow,
    required this.titleshow,
  });
}

// ignore: must_be_immutable
class GuidePage extends StatelessWidget {
  GuidePage({super.key});
  List<GuideData> guideDataList = [
    GuideData(
      background: const Color(0xfffdca49),
      title: 'Plásticos & Latas',
      titleshow: '¿Como reciclar materiales plásticos & latas',
      image: 'assets/1.png',
      imageshow: 'assets/item1.jpg',
      description:
          'Reciclar plástico y latas es fundamental para reducir el impacto negativo de estos materiales en el medio ambiente. A medida que la conciencia sobre la importancia de la sostenibilidad crece, es crucial adoptar prácticas que promuevan la reutilización y el reciclaje de estos elementos. Aquí te presento algunas pautas sobre cómo reciclar plástico y latas de manera efectiva.',
    ),
    GuideData(
      background: const Color(0xFF69d2e7),
      title: 'Papeles & Cartones',
      titleshow: '¿Como reciclar papeles & cartones?',
      image: 'assets/2.png',
      imageshow: 'assets/item2.jpg',
      description:
          'Reciclar papel y cartón es una práctica esencial para reducir la cantidad de residuos sólidos y promover la sostenibilidad ambiental. El papel y el cartón son materiales reciclables que, cuando se gestionan adecuadamente, contribuyen a la conservación de recursos naturales, la disminución de la deforestación y la reducción de la energía necesaria para producir nuevos productos.',
    ),
    GuideData(
      background: const Color(0xFF459a96),
      title: 'Vidrio',
      titleshow: '¿Como reciclar el vidrio?',
      image: 'assets/3.png',
      imageshow: 'assets/item3.jpg',
      description:
          'Reciclar vidrio es una práctica fundamental para reducir el impacto ambiental y promover la sostenibilidad. El vidrio es un material reciclable al 100%, lo que significa que puede ser reutilizado una y otra vez sin perder calidad. Aquí te presento algunos pasos y consejos sobre cómo reciclar vidrio de manera efectiva.',
    ),
    GuideData(
      background: const Color(0xfffc9782),
      title: 'Materiales Peligrosos',
      titleshow: '¿Como reciclar materiales peligrosos?',
      image: 'assets/4.png',
      imageshow: 'assets/item4.jpg',
      description:
          'Reciclar materiales peligrosos es una práctica esencial para mitigar los impactos negativos que estos desechos pueden tener en el medio ambiente y en la salud humana. Los materiales peligrosos, como productos químicos tóxicos, baterías, aceites usados y productos electrónicos, requieren un manejo especializado debido a su potencial para causar daños significativos.',
    ),
    GuideData(
      background: const Color(0xFFe6a972),
      title: 'Residuos Orgánicos',
      titleshow: '¿Como reciclar residuos orgánicos?',
      image: 'assets/5.png',
      imageshow: 'assets/item5.jpg',
      description:
          'Reciclar residuos orgánicos es una práctica esencial para contribuir al cuidado del medio ambiente y reducir la cantidad de desechos que terminan en vertederos. Los residuos orgánicos, como restos de alimentos y materiales biodegradables, pueden transformarse en compost, un valioso abono natural que enriquece el suelo y mejora su fertilidad. Aquí te presento algunos pasos y consejos sobre cómo reciclar residuos orgánicos de manera efectiva.',
    ),
    GuideData(
      background: const Color(0xFFe1eae3),
      title: 'Varios',
      titleshow: '¿Como reciclar elementos variados?',
      image: 'assets/6.png',
      imageshow: 'assets/item6.jpg',
      description:
          'El reciclaje es una práctica fundamental para preservar nuestro medio ambiente y reducir el impacto negativo de nuestros desechos en el planeta. En este sentido, reciclar diversos materiales es esencial para promover un estilo de vida sostenible y contribuir a la conservación de los recursos naturales. A continuación, se presentan algunas pautas sobre cómo reciclar varios tipos de materiales comunes.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Iconsax.arrow_left,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            const Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text(
                'Guia de Reciclaje',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
              child: Wrap(
                spacing: 20.0,
                runSpacing: 8.0,
                children: List.generate(
                  guideDataList.length,
                  (index) {
                    return GuideItem(
                      title: guideDataList[index].title,
                      image: guideDataList[index].image,
                      background: guideDataList[index].background,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => GuideDetailsPage(
                                title: guideDataList[index].title,
                                image: guideDataList[index].imageshow,
                                info: guideDataList[index].description,
                                color: guideDataList[index].background,
                                box: guideDataList[index].titleshow),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
