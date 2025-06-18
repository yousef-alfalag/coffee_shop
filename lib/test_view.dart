import 'package:coffee_shop/core/utils/app_style.dart';
import 'package:flutter/material.dart';

class TestView extends StatelessWidget {
  final String name;
  const TestView({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
      child: Text(name,style: AppStyle.soraw600Black,),
    ),
    );
  }
}