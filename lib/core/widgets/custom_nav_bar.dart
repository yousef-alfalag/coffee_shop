import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomNavBar extends StatelessWidget {
  final String? title;
  final Widget? actionIcon;
  final Color? color;
  const CustomNavBar({super.key, this.title, this.actionIcon, this.color});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      actions: actionIcon == null ? null : [actionIcon!],
      leading: Container(
        height: 30,
        width: 30,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10),
        ),
        child: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () => Get.back(),
        ),
      ),
      title: title == null ? null : Text(title!),
    );
  }
}