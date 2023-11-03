import 'package:flutter/material.dart';
import 'package:medical_app/features/home/presentation/widgets/health_article_page_body.dart';

class HealthArticlePage extends StatelessWidget {
  const HealthArticlePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HealthArticlePageBody(),
    );
  }
}
