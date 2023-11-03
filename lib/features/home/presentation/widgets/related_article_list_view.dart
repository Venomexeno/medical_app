import 'package:flutter/material.dart';
import 'package:medical_app/features/home/presentation/widgets/related_article_list_view_item.dart';

class RelatedArticleListView extends StatelessWidget {
  const RelatedArticleListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 5,
      separatorBuilder: (context, index) => const SizedBox(height: 10),
      itemBuilder: (context, index) {
        return const RelatedArticleListViewItem(
          imageUrl:
              'https://www.universityofcalifornia.edu/sites/default/files/styles/article_default_banner/public/generic-drugs-istock.jpg?h=91106740&itok=N62lK3sY',
          title:
              'The 25 Healthiest Fruits You Can Eat, According to a Nutritionist',
          date: 'Jun 10, 2021',
        );
      },
    );
  }
}
