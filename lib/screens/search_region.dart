import 'package:Bliss/widgets/custom_Text.dart';
import 'package:Bliss/widgets/region_widget.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class SearchRegion extends StatefulWidget {
  const SearchRegion({super.key});

  @override
  State<SearchRegion> createState() => _SearchRegionState();
}

class _SearchRegionState extends State<SearchRegion> {
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ajustes'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Selecciona tu Región',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 20),
              CustomTextFormFild(
                hint: "Buscar Región",
                prefixIcon: Iconsax.search_normal_1,
                controller: searchController,
                filled: true,
                suffixIcon:
                    searchController.text.isEmpty ? null : Iconsax.close_circle,
                onTapSuffixIcon: () {},
                onChanged: (pure) {},
                onEditingComplete: () {},
              ),
              const SizedBox(height: 30),
              ListView.separated(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 5,
                itemBuilder: (context, index) {
                  return RegionWidget(
                    title: 'Santo Domingo',
                    onClick: () {},
                  );
                },
                separatorBuilder: (BuildContext context, int index) => Divider(
                  color: const Color.fromRGBO(62, 89, 84, 1).withOpacity(0.2),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
