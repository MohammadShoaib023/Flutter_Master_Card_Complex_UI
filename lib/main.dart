import 'dashboard/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:test_app/custom_item_booking_status.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: DashboardPage(),
    );
  }
}
