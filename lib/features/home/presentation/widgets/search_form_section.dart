import 'package:flutter/material.dart';
import 'package:medical_app/features/auth/presentation/widgets/text_field_container_widget.dart';

class SearchFormSection extends StatefulWidget {
  const SearchFormSection({
    super.key,
    required this.formKey,
  });

  final GlobalKey<FormState> formKey;

  @override
  State<SearchFormSection> createState() => _SearchFormSectionState();
}

class _SearchFormSectionState extends State<SearchFormSection> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: TextFieldContainerWidget(
        semanticsLabel: 'Search',
        controller: _searchController,
        hintText: 'Search doctor, drugs,articles...',
        prefixIcon: 'assets/icons/Search.svg',
        textInputType: TextInputType.text,
        validator: (String? value) {
          if(value!.isEmpty)
            {
              return 'Please Type what you search for...';
            }
          return '';
        },
      ),
    );
  }
}
