import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medical_app/features/home/presentation/widgets/trending_article_list_view_item.dart';

class TrendingArticleListView extends StatelessWidget {
  const TrendingArticleListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250.h,
      child: ListView.separated(
        padding: EdgeInsets.zero,
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemCount: 4,
        separatorBuilder: (context, index) => const SizedBox(width: 10),
        itemBuilder: (context, index) {
          return const TrendingArticleListViewItem(
            imageUrl:
                'https://post.medicalnewstoday.com/wp-content/uploads/sites/3/2021/09/Sedatives_effects_GettyImages1155423745_Thumb.jpg',
            title: 'Comparing the AstraZeneca and Sinovac COVID-19 Vaccines',
            relatedTitle: 'Covid-19',
            date: 'Jun 12, 2022',
          );
        },
      ),
    );
  }
}
