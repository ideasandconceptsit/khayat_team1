import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:team1_khayat/core/app_styles.dart';

class CustomDatePickerField extends StatefulWidget {
  final String label;
  final TextEditingController? controller;

  const CustomDatePickerField({
    Key? key,
    required this.label,
    this.controller,
  }) : super(key: key);

  @override
  _CustomDatePickerFieldState createState() => _CustomDatePickerFieldState();
}

class _CustomDatePickerFieldState extends State<CustomDatePickerField> {
  DateTime? selectedDate;

  void _selectDate(BuildContext context) {
    DateTime tempDate = selectedDate ?? DateTime.now();

    showModalBottomSheet(
      context: context,
      builder: (BuildContext builder) {
        return Container(
          height: 250,
          color: Colors.white,
          child: Column(
            children: [
              Expanded(
                child: CupertinoDatePicker(
                  mode: CupertinoDatePickerMode.date,
                  initialDateTime: tempDate,
                  maximumDate: DateTime.now(),
                  onDateTimeChanged: (DateTime newDate) {
                    tempDate = newDate;
                  },
                ),
              ),
              TextButton(
                onPressed: () {
                  setState(() {
                    selectedDate = tempDate;
                    widget.controller?.text =
                        DateFormat('dd/MM/yyyy').format(selectedDate!);
                  });
                  Navigator.pop(context);
                },
                child: Text("تم", style: AppTextStyles.tajawaltextStyle18),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.label, style: AppTextStyles.tajawaltextStyle16), 
        const SizedBox(height: 5),
        GestureDetector(
          onTap: () => _selectDate(context),
          child: AbsorbPointer(
            child: TextField(
              controller: widget.controller,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
                suffixIcon: const Icon(Icons.calendar_today, color: Colors.black),
                hintText: selectedDate != null
                    ? DateFormat('dd/MM/yyyy').format(selectedDate!)
                    : "اختر تاريخ ميلادك",
                hintStyle: const TextStyle(color: Colors.black, fontSize: 16),
              ),
              style: const TextStyle(color: Colors.black, fontSize: 16),
            ),
          ),
        ),
      ],
    );
  }
}
