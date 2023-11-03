import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medical_app/features/home/presentation/widgets/popular_article_list_view_item.dart';


class PopularArticleListView extends StatelessWidget {
  const PopularArticleListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60.h,
      child: ListView.separated(
        itemCount: 5,
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) =>
        const SizedBox(width: 10),
        itemBuilder: (context, index) {
          return const PopularArticleListViewItem(
            title:  'Covid-19',
          );
        },
      ),
    );
  }
}

