import 'custom_chart.dart';
import '../config/size.dart';
import '../config/colors.dart';
import '../config/strings.dart';
import 'package:flutter/material.dart';

class PieChart extends StatefulWidget {
  const PieChart({super.key});

  @override
  _PieChartState createState() => _PieChartState();
}

class _PieChartState extends State<PieChart>
    with SingleTickerProviderStateMixin {
  double total = 0;
  @override
  void initState() {
    super.initState();
    category.forEach((e) => total += e['amount']);
  }

  @override
  Widget build(BuildContext context) {
    var width = SizeConfig.getWidth(context);
    double fontSize(double size) {
      return size * width / 414;
    }

    return LayoutBuilder(
      builder: (context, constraint) {
        return Container(
          decoration: BoxDecoration(
              color: AppColors.primaryWhite,
              shape: BoxShape.circle,
              boxShadow: AppColors.neumorpShadow),
          child: Stack(
            children: <Widget>[
              Center(
                child: SizedBox(
                  width: constraint.maxWidth * 0.6,
                  child: CustomPaint(
                    foregroundPainter: PieChartCustomPainter(
                      width: constraint.maxWidth * 0.5,
                      categories: category,
                    ),
                    child: Container(),
                  ),
                ),
              ),
              Center(
                child: Container(
                  width: constraint.maxWidth * .5,
                  decoration: BoxDecoration(
                      color: AppColors.primaryWhite,
                      shape: BoxShape.circle,
                      boxShadow: const [
                        BoxShadow(
                            spreadRadius: 3,
                            blurRadius: 5,
                            offset: Offset(3, 3),
                            color: Colors.black38)
                      ]),
                  child: Center(
                      child: Text(
                    "\$$total",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: fontSize(22)),
                  )),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
