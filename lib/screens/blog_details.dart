import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PostDetailsPage extends StatelessWidget {
  final String title;
  final String image;
  final String info;
  const PostDetailsPage(
      {super.key,
      required this.title,
      required this.image,
      required this.info});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent));

    List<String> oraciones = info.split('.');

    oraciones.removeWhere((element) => element.isEmpty);

    String textoConParrafos =
        oraciones.map((oracion) => '$oracion.').join('\n\n');

    return Scaffold(
      extendBodyBehindAppBar: true,
      extendBody: true,
      appBar: AppBar(
        title: const Text('Volver'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.report,
            ),
          ),
          IconButton(
            onPressed: () {
             
            },
            icon: const Icon(
              Icons.share_outlined,
            ),
          ),
          const SizedBox(width: 10)
        ],
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          minimum: const EdgeInsets.symmetric(horizontal: 10),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            child: Column(
              children: [
                Container(
                  height: 250,
                  width: MediaQuery.of(context).size.width,
                  color: const Color(0xFFF4F5F7),
                  padding: const EdgeInsets.all(10.0),
                  child: ClipRRect(
                    child: Image.network(
                      image,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  title,
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Container(
                      height: 35,
                      width: 35,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 241, 241, 241),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(50)),
                        image: DecorationImage(
                          image: NetworkImage(image),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    const Text(
                      'Alex',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(width: 30),
                    const Text(
                      '• 24/1/2024',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                RichText(
                  text: TextSpan(
                    text: textoConParrafos,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      height: 1.7,
                      wordSpacing: 2,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
