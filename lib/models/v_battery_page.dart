import 'package:canvas_test/models/p_paint.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BatteryPage extends StatefulWidget {
  const BatteryPage({super.key});

  @override
  State<BatteryPage> createState() => _BatteryPageState();
}

class _BatteryPageState extends State<BatteryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text("Battery"),
      ),
      body: Center(
        child: SizedBox(
          width: Get.width * 0.85,
          height: Get.width * 0.85,
          child: CustomPaint(
            painter: Battery(),
          ),
        ),
      ),
    );
  }
}
