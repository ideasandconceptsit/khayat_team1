// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:team1_khayat/core/app_colors.dart';
import 'package:team1_khayat/core/app_styles.dart';


class CustomFormField extends StatefulWidget {
  final String? labelText;
  final String? hintText;
  final bool obscureText;
  final TextInputType keyboardType;
  final FormFieldValidator<String>? validator;
  final String? text;
  TextEditingController? controller;

   CustomFormField({
    Key? key,
    this.labelText,
     this.hintText,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.validator,
    this.text,
    this.controller,
  }) : super(key: key);

  @override
  _CustomFormFieldState createState() => _CustomFormFieldState();
}

class _CustomFormFieldState extends State<CustomFormField> {
  late bool _isObscure;

  @override
  void initState() {
    super.initState();
    _isObscure = widget.obscureText;
  }

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
          
          controller:widget. controller,
          obscureText: _isObscure,
          keyboardType: widget.keyboardType,
          validator: widget.validator,
          decoration: InputDecoration(
            fillColor: AppColors.whiteColor,
            filled: true,
            labelText: widget.labelText,
            hintText: widget.hintText,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none, 
            suffixIcon: widget.obscureText
            
                ? IconButton(
                    icon: Icon(
                      _isObscure ? Icons.visibility : Icons.visibility_off,
                      color: Colors.grey,
                    ),
                    onPressed: () {
                      setState(() {
                        _isObscure = !_isObscure;
                      });
                    },
                  )
                : null,
          ),
        ),
      ],
    );
  }
}
