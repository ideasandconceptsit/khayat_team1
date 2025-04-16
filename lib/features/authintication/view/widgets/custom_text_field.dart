import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatefulWidget {
  final String label;
  final bool isPassword;
  final bool isNumber;
  final bool isEmail;
  final TextEditingController controller;

  const CustomTextField({
    super.key,
    required this.label,
    required this.controller,
    this.isPassword = false,
    this.isNumber = false,
    this.isEmail=false,
  });

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool isValid = false;

  void validateInput(String value) {
    setState(() {
      isValid = value.isNotEmpty; // إذا كان الحقل غير فارغ، يظهر ✅ وإلا ❌
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        // color: Colors.green,
        borderRadius: BorderRadius.circular(4),
        boxShadow: const [
          BoxShadow(
            color: Color(0xffFFFFFF),
            spreadRadius: 0,
            blurRadius: 2,
            offset: Offset(8, 0),
          ),
        ],
      ),
      child: TextFormField(
        keyboardType:
            widget.isNumber ? TextInputType.number : TextInputType.text,
        inputFormatters:
            widget.isNumber ? [FilteringTextInputFormatter.digitsOnly] : null,
        obscureText: widget.isPassword,
        controller: widget.controller,
        onChanged: validateInput,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'This field is required';
          }
          if (widget.isPassword && value.length < 6) {
            return 'Password must be 6 characters or more';
          }
          if (widget.isNumber) {
            // رقم مصري أو سعودي
            bool isEgyptian = RegExp(r'^01[0125][0-9]{8}$').hasMatch(value);
            bool isSaudi = RegExp(r'^(05[0-9]{8}|(\+966|00966)5[0-9]{8})$')
                .hasMatch(value);

            if (!isEgyptian && !isSaudi) {
              return 'Invalid phone number (must be Saudi)';
            }
          } else if (widget.isEmail &&
              !RegExp(r"^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$")
                  .hasMatch(value)) {
            return 'Enter a valid email';
          }
          return null;
        },
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          enabled: true,
          focusColor: Colors.white,
          labelText: widget.label,
          labelStyle: const TextStyle(color: Colors.grey),
          floatingLabelBehavior: FloatingLabelBehavior.auto,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4),
            borderSide:
                const BorderSide(color: Colors.white), // لون الإطار الافتراضي
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4),
            borderSide: const BorderSide(
                color: Colors.grey), // لون الإطار عند عدم التركيز
          ),
          // focusedBorder: OutlineInputBorder(
          //   borderRadius: BorderRadius.circular(4),
          //   // borderSide: const BorderSide(
          //   //     color: Colors.green, width: 2), // لون الإطار عند التركيز
          // ),
          suffixIcon: isValid
              ? const Icon(Icons.check, color: Colors.green) //✅ Icon check
              : const Icon(Icons.close, color: Colors.red), // ❌Icon close
        ),
      ),
    );
  }
}
