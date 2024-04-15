import 'package:flutter/material.dart';

class CustomPageViewOptionOne extends StatefulWidget {
  const CustomPageViewOptionOne({super.key});

  @override
  _CustomPageViewOptionOneState createState() =>
      _CustomPageViewOptionOneState();
}

class _CustomPageViewOptionOneState extends State<CustomPageViewOptionOne>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottom: TabBar(
          indicatorSize: TabBarIndicatorSize.tab,
          controller: _tabController,
          tabs: const [
            Tab(
              child: Center(
                child: Text("My orders"),
              ),
            ),
            Tab(
              child: Center(
                child: Text("My Booking"),
              ),
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          Container(
            color: Colors.blue,
            child: const Center(
              child: Text(
                'Page 1',
                style: TextStyle(fontSize: 24, color: Colors.white),
              ),
            ),
          ),
          Container(
            color: Colors.green,
            child: const Center(
              child: Text(
                'Page 2',
                style: TextStyle(fontSize: 24, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
