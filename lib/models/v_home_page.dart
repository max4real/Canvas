import 'package:canvas_test/models/p_paint.dart';
import 'package:canvas_test/models/v_battery_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: const Text(
          "Canvas",
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Get.to(() => const BatteryPage());
            },
            icon: const Icon(Icons.battery_3_bar),
          ),
          SizedBox(width: 20)
        ],
      ),
      body: Center(
        child: SizedBox(
          width: Get.width * 0.85,
          height: Get.width * 0.85,
          child: DecoratedBox(
            decoration: BoxDecoration(
                // border: Border.all(),
                ),
            child: Stack(
              children: [
                gridView(),
                CustomPaint(
                  painter: FancyPainter(),
                ),
                // CustomPaint(
                //   painter: TicTakToe(),
                // )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget gridView() {
    return Table(
      border: TableBorder(
          verticalInside: BorderSide(color: Colors.grey.withOpacity(0.5)),
          horizontalInside: BorderSide(color: Colors.grey.withOpacity(0.5))),
      children: [
        ...List.generate(
          10,
          (col) {
            return TableRow(children: [
              ...List.generate(
                10,
                (row) {
                  return AspectRatio(
                    aspectRatio: 1,
                    child: Center(
                      child: Text(
                        "${row + 1},${col + 1}",
                        style: TextStyle(
                            color: Colors.grey.withOpacity(0.5), fontSize: 10),
                      ),
                    ),
                  );
                },
              )
            ]);
          },
        )
      ],
    );
  }
}
