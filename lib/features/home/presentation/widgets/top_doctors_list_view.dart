import 'package:flutter/material.dart';
import 'package:medical_app/features/home/presentation/widgets/top_doctors_list_view_item.dart';

class TopDoctorsListView extends StatelessWidget {
  const TopDoctorsListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: 20,
      separatorBuilder: (context, index) => const SizedBox(height: 10),
      itemBuilder: (context, index) {
        return const TopDoctorsListViewItem(
          imageUrl: 'https://i.ibb.co/m9zqbpW/pexels-cedric-fauntleroy-4270371.png',
          name: 'Mohamed Ibrahim Elsaid',
          specialization: 'Chardiologist',
          rating: 4.5,
          distance: 300,
        );
      },
    );
  }
}
