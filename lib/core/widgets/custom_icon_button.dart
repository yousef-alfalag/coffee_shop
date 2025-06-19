import 'package:coffee_shop/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomIconButton extends StatelessWidget {
  final Widget icon;
  final Color? color;
  final void Function()? onPressed;
  const CustomIconButton({super.key, this.color, required this.icon, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: color ?? AppColors.primaryColor,
      ),
      child: IconButton(onPressed: onPressed, icon: icon),
    );
  }
}
