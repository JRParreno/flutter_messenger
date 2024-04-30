import 'package:flutter/material.dart';
import 'package:flutter_messenger/gen/colors.gen.dart';

class SearchField extends StatelessWidget {
  const SearchField({
    super.key,
    this.controller,
    required this.onTap,
    this.hintText,
    this.readOnly = false,
    this.onFieldSubmitted,
  });

  final TextEditingController? controller;
  final VoidCallback onTap;
  final String? hintText;
  final bool readOnly;
  final Function(String value)? onFieldSubmitted;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      maxLines: 1,
      onTap: onTap,
      readOnly: readOnly,
      onFieldSubmitted: onFieldSubmitted,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(10),
        prefixIcon: const Icon(
          Icons.search,
          color: ColorName.placeHolder,
        ),
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.black.withOpacity(0.5)),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(
              15,
            ),
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(
              15,
            ),
          ),
        ),
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(
              15,
            ),
          ),
        ),
      ),
    );
  }
}
