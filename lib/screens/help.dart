import 'package:Bliss/screens/bugs_page.dart';
import 'package:Bliss/screens/search_help.dart';
import 'package:Bliss/services/send_email.dart';
import 'package:Bliss/widgets/help_items.dart';
import 'package:Bliss/widgets/search_widget.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class FeedbackPage extends StatefulWidget {
  const FeedbackPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _FeedbackPageState createState() => _FeedbackPageState();
}

class _FeedbackPageState extends State<FeedbackPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Iconsax.arrow_left),
        ),
        title: const Text(
          'Ayuda',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        // leadingWidth: 80,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 5.0,
            ),
            const Text(
              "Recursos Populares",
              style: TextStyle(
                  color: Color(0xFF101010),
                  fontWeight: FontWeight.bold,
                  fontSize: 15),
            ),
            const SizedBox(height: 20.0),
            Column(
              children: [
                HelpItems(
                  title: 'Problemas comunes',
                  icon: Iconsax.warning_2,
                  onClick: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const BugsPage()),
                    );
                  },
                ),
                const SizedBox(height: 10),
                HelpItems(
                  title: 'Corregir errores de ubicacion',
                  icon: Iconsax.location,
                  onClick: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const BugsPage()),
                    );
                  },
                ),
                const SizedBox(height: 10),
                HelpItems(
                  title: 'Reportar artículos del blog',
                  icon: Iconsax.close_circle,
                  onClick: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const BugsPage()),
                    );
                  },
                ),
                const SizedBox(height: 10),
                SearchWidget(
                  onClick: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) => const SearchHelp(),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 10),
                const Divider(),
                HelpItems(
                  title: 'Enviar comentarios',
                  icon: Iconsax.message,
                  onClick: () async {
                    await OpenGmailService().launchGmail();
                  },
                ),
                const Divider(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
