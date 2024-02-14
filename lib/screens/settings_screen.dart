import 'package:Bliss/screens/feedback_details.dart';
import 'package:Bliss/screens/search_region.dart';
import 'package:Bliss/screens/settings_webview.dart';
import 'package:Bliss/widgets/settings_items.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:open_apps_settings/open_apps_settings.dart';
import 'package:open_apps_settings/settings_enum.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
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
          'Ajustes',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        // leadingWidth: 80,
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // const Text(
                    //   "Canal",
                    //   style: TextStyle(
                    //     fontSize: 24,
                    //     fontWeight: FontWeight.w500,
                    //   ),
                    // ),
                    // const SizedBox(height: 20),
                    // SizedBox(
                    //   width: double.infinity,
                    //   child: Row(
                    //     children: [
                    //       Container(
                    //         width: 70,
                    //         height: 70,
                    //         decoration: const BoxDecoration(
                    //           borderRadius: BorderRadius.all(Radius.circular(50)),
                    //           image: DecorationImage(
                    //               image: AssetImage('assets/photo.jpg'),
                    //               fit: BoxFit.cover),
                    //         ),
                    //       ),
                    //       const SizedBox(width: 20),
                    //       const Column(
                    //         crossAxisAlignment: CrossAxisAlignment.start,
                    //         children: [
                    //           Text(
                    //             "Bliss",
                    //             style: TextStyle(
                    //               fontSize: 18,
                    //               fontWeight: FontWeight.w500,
                    //             ),
                    //           ),
                    //           SizedBox(height: 10),
                    //           Text(
                    //             "Youtube Channel",
                    //             style: TextStyle(
                    //               fontSize: 14,
                    //               color: Colors.grey,
                    //             ),
                    //           )
                    //         ],
                    //       ),
                    //       const Spacer(),
                    //     ],
                    //   ),
                    // ),
                    // const SizedBox(height: 0),
                    // const Text(
                    //   "Opciones",
                    //   style: TextStyle(
                    //     fontSize: 24,
                    //     fontWeight: FontWeight.w500,
                    //   ),
                    // ),
                    const SizedBox(height: 20),
                    SettingItem(
                      title: "Ubicación",
                      icon: Iconsax.location,
                      bgColor: Colors.redAccent,
                      iconColor: Colors.white,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context) =>
                                const SearchRegion(),
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 20),
                    SettingItem(
                      title: "Notificaciónes",
                      icon: Iconsax.notification,
                      bgColor: const Color.fromARGB(255, 42, 166, 238),
                      iconColor: Colors.white,
                      onTap: () {
                        OpenAppsSettings.openAppsSettings(
                          settingsCode: SettingsCode.NOTIFICATION,
                        );
                      },
                    ),
                    const SizedBox(height: 20),
                    SettingItem(
                      title: "Política de privacidad",
                      icon: Iconsax.security,
                      bgColor: Colors.orange,
                      iconColor: Colors.white,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context) =>
                                const SettingsWebView(
                                    title: 'Política de privacidad'),
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 20),
                    SettingItem(
                      title: "Términos y condiciones",
                      icon: Iconsax.book,
                      bgColor: const Color.fromARGB(255, 37, 167, 104),
                      iconColor: Colors.white,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context) =>
                                const SettingsWebView(
                                    title: 'Términos y condiciones'),
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 20),
                    SettingItem(
                      title: "Calificacion y comentarios",
                      icon: Iconsax.star,
                      bgColor: const Color.fromARGB(255, 208, 211, 10),
                      iconColor: Colors.white,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context) =>
                                const FeedBackDetails(),
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ),
          const Divider(),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 50,
            child: const Center(
              child: Text(
                'Version: 1.0.9',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
