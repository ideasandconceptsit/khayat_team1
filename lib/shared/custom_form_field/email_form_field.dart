import 'package:flutter/material.dart';
import 'package:team1_khayat/core/app_styles.dart';
import 'package:team1_khayat/core/utils/app_colors.dart';

class EmailFormField extends StatefulWidget {
  final String? labelText;
  final String? hintText;
  final FormFieldValidator<String>? validator;
  final String? text;
  TextEditingController? controller;

  EmailFormField({
    Key? key,
    this.labelText,
    this.hintText,
    this.validator,
    this.text,
    this.controller,
  }) : super(key: key);

  @override
  _EmailFormFieldState createState() => _EmailFormFieldState();
}

class _EmailFormFieldState extends State<EmailFormField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (widget.text != null)
          Padding(
            padding: const EdgeInsets.only(left: 5, top: 10),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                widget.text!,
                style: AppTextStyles.textStyle13,
              ),
            ),
          ),
        const SizedBox(height: 8),
        TextFormField(
          controller: widget.controller,
          keyboardType: TextInputType.emailAddress,
          validator: widget.validator,
          decoration: InputDecoration(
            fillColor: AppColors.whiteColor,
            filled: true,
            labelText: widget.labelText,
            hintText: widget.hintText,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
            errorBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red, width: 1.0),
            ),
            focusedErrorBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red, width: 1.0),
            ),
            suffixIcon: const Icon(
              Icons.email,
              color: Colors.grey,
            ),
            errorStyle: const TextStyle(
              color: Colors.red, ),
          ),
        ),
      ],
    );
  }
}