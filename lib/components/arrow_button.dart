import '../config/size.dart';
import '../config/colors.dart';
import 'package:flutter/material.dart';

class ArrowButton extends StatelessWidget {
  final EdgeInsets margin;
  final Widget icon;
  const ArrowButton({super.key, required this.margin, required this.icon});
  @override
  Widget build(BuildContext context) {
    var height = SizeConfig.getHeight(context);
    var width = SizeConfig.getWidth(context);
    return Expanded(
      child: Container(
        margin: margin,
        decoration: BoxDecoration(
            color: AppColors.primaryWhite,
            borderRadius: BorderRadius.circular(15),
            boxShadow: AppColors.neumorpShadow),
        alignment: Alignment.center,
        child: icon,
      ),
    );
  }
}
