import 'package:flutter/material.dart';
import 'package:medical_app/features/auth/presentation/widgets/text_field_container_widget.dart';

class CustomSearchFormWidget extends StatefulWidget {
  const CustomSearchFormWidget({
    super.key,
    required this.formKey,
    required this.hintText,
    required this.semanticsLabelText,
  });

  final GlobalKey<FormState> formKey;
  final String hintText;
  final String semanticsLabelText;

  @override
  State<CustomSearchFormWidget> createState() => _CustomSearchFormWidgetState();
}

class _CustomSearchFormWidgetState extends State<CustomSearchFormWidget> {
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
        semanticsLabel: widget.semanticsLabelText,
        controller: _searchController,
        hintText: widget.hintText,
        prefixIcon: 'assets/icons/Search.svg',
        textInputType: TextInputType.text,
        validator: (String? value) {
          if (value!.isEmpty) {
            return 'Please Type what you search for...';
          }
          return '';
        },
      ),
    );
  }
}
