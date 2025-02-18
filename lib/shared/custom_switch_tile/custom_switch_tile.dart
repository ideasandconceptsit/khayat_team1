import 'package:flutter/material.dart';
import 'package:team1_khayat/core/app_colors.dart';

class CustomSwitchTile extends StatefulWidget {
  final String title;
  final bool initialValue;

  const CustomSwitchTile({
    Key? key,
    required this.title,
    required this.initialValue,
  }) : super(key: key);

  @override
  _CustomSwitchTileState createState() => _CustomSwitchTileState();
}

class _CustomSwitchTileState extends State<CustomSwitchTile> {
  late bool isSwitched;

  @override
  void initState() {
    super.initState();
    isSwitched = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      title: Text(
        widget.title,
        style: TextStyle(color: AppColors.black, fontSize: 16),
      ),
      value: isSwitched,
      onChanged: (value) {
        setState(() {
          isSwitched = value;
        });
      },
      activeColor: Colors.green,
      inactiveThumbColor: Colors.grey,
      inactiveTrackColor: Colors.white24,
    );
  }
}
