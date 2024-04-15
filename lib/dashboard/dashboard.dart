import '../config/size.dart';
import '../config/colors.dart';
import '../card/card_widgets.dart';
import '../components/app_bar.dart';
import 'package:flutter/material.dart';
import '../components/expenses_widget.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    var height = SizeConfig.getHeight(context);
    var width = SizeConfig.getWidth(context);

    return Scaffold(
      body: Container(
        color: AppColors.primaryWhite,
        child: SafeArea(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: height / 8,
                child: const CustomAppBar(),
              ),
              const Expanded(
                child: CardWidget(),
              ),
              const Expanded(child: ExpensesWidget())
            ],
          ),
        ),
      ),
    );
  }
}
