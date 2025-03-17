import 'dart:math';

import 'package:bloc_cubit/features/master_home/view/widget/screen.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class TabPage extends StatefulWidget {
  final int tab;

  const TabPage({super.key, required this.tab});

  @override
  State<TabPage> createState() => _TabPageState();
}

class _TabPageState extends State<TabPage> {
  final List<int> items = List.generate(20, (index) => index);
  final List<Color> colors = [
    Colors.red,
    Colors.blue,
    Colors.green,
    Colors.orange,
    Colors.purple,
    Colors.yellow,
    Colors.pink,
    Colors.teal,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(title: Text('Tab ${widget.tab}')),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 10),
              height: 150,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return Container(
                    width: 240,
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      color:
                          colors[index % colors.length], // Cycle through colors
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Center(
                      child: Text(
                        'Item ${items[index]}',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildIndicator("Overall Success", 0.446, Colors.blue),
                      _buildIndicator("Closed Success", 0.752, Colors.green),
                      _buildIndicator("Total Delivered", 0.494, Colors.orange),
                    ],
                  ),
                  SizedBox(height: 20),
                  _buildAttemptSuccessRate(),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 10),
              height: 150,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return Container(
                    width: 240,
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      color:
                          colors[index % colors.length], // Cycle through colors
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Center(
                      child: Text(
                        'Item ${items[index]}',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Text('Tab ${widget.tab}'),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => Screen(tab: widget.tab),
                  ),
                );
              },
              child: const Text('Go to page'),
            ),
            SizedBox(
              height: 150,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildIndicator(String label, double percent, Color color) {
    return Column(
      children: [
        CircularPercentIndicator(
          radius: 50.0,
          lineWidth: 8.0,
          percent: percent,
          center: Text("${(percent * 100).toStringAsFixed(1)}%"),
          progressColor: color,
          backgroundColor: Colors.grey.shade300,
          circularStrokeCap: CircularStrokeCap.round,
        ),
        SizedBox(height: 8),
        Text(
          label,
          style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }

  /// Builds the Attempt Success Rate section
  Widget _buildAttemptSuccessRate() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              "Attempt Success Rate",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Spacer(),
            Row(
              children: [
                Checkbox(value: false, onChanged: (value) {}),
                Text("Delivered"),
              ],
            ),
          ],
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: 100,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildLegendItem("1st: 0.0%", Colors.green),
                  _buildLegendItem("2nd: 0.0%", Colors.purple),
                  _buildLegendItem("3rd: 0.0%", Colors.blue),
                ],
              ),
            ),
            Center(
              child: SizedBox(
                width: 120, // Define a fixed size
                height: 120,
                child: CustomPaint(
                  painter: CircularMultiProgressIndicator(
                    values: [
                      0.2,
                      0.5,
                      0.3
                    ], // Percentages (sum should not exceed 1.0)
                    colors: [Colors.blue, Colors.green, Colors.orange],
                    gapSize: 0.01, // Spacer size
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 50,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SemiCircularProgressIndicator(
              label: "Overall Success",
              progress: 0.446,
              color: Colors.blue,
            ),
            SemiCircularProgressIndicator(
              label: "Closed Success",
              progress: 0.752,
              color: Colors.green,
            ),
            SemiCircularProgressIndicator(
                label: "Total Delivered",
                progress: 0.494,
                color: Colors.orange),
          ],
        ),
      ],
    );
  }

  /// Builds the legend items for the attempt success rate
  Widget _buildLegendItem(String text, Color color) {
    return Row(
      children: [
        Container(
          width: 10,
          height: 10,
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        ),
        SizedBox(width: 4),
        Text(text, style: TextStyle(fontSize: 12)),
        SizedBox(width: 10),
      ],
    );
  }
}

class CircularMultiProgressIndicator extends CustomPainter {
  final List<double> values; // Percent values
  final List<Color> colors; // Colors for each segment
  final double gapSize; // Gap between segments

  CircularMultiProgressIndicator(
      {required this.values, required this.colors, required this.gapSize});

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2;
    final Paint paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 20
      ..strokeCap = StrokeCap.butt;

    double startAngle = -pi / 2; // Start from top

    for (int i = 0; i < values.length; i++) {
      final sweepAngle =
          (values[i] * 2 * pi) - (gapSize * pi); // Reduce angle for gaps
      paint.color = colors[i];

      canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius),
        startAngle,
        sweepAngle,
        false,
        paint,
      );

      startAngle += sweepAngle + (gapSize * pi); // Add gap between segments
    }
  }

  @override
  bool shouldRepaint(CircularMultiProgressIndicator oldDelegate) => true;
}

class SemiCircularProgressIndicator extends StatelessWidget {
  final double progress; // Progress value (0.0 to 1.0)
  final String label;
  final Color color;
  const SemiCircularProgressIndicator(
      {super.key,
      required this.progress,
      required this.label,
      required this.color});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 90, // Fixed size
          height: 45, // Half of width (for semi-circle)
          child: CustomPaint(
            painter: SemiCircularPainter(
              progress,
              color,
            ),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Text(
                "${(progress * 100).toStringAsFixed(1)}%", // Show percentage
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 15.0),
          child: Text(
            label,
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
          ),
        ),
      ],
    );
  }
}

class SemiCircularPainter extends CustomPainter {
  final double progress; // Progress value (0.0 to 1.0)
  final Color color;
  SemiCircularPainter(this.progress, this.color);

  @override
  void paint(Canvas canvas, Size size) {
    final Paint backgroundPaint = Paint()
      ..color = Colors.grey.shade400
      ..style = PaintingStyle.stroke
      ..strokeWidth = 15
      ..strokeCap = StrokeCap.round;

    final Paint progressPaint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 15
      ..strokeCap = StrokeCap.round;

    final center = Offset(size.width / 2, size.height);
    final radius = size.width / 2;

    // Draw background arc (full semi-circle)
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      pi, // Start angle (leftmost)
      pi, // Sweep angle (semi-circle)
      false,
      backgroundPaint,
    );

    // Draw progress arc
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      pi, // Start from leftmost
      progress * pi, // Progress mapped to semi-circle (pi = 100%)
      false,
      progressPaint,
    );
  }

  @override
  bool shouldRepaint(SemiCircularPainter oldDelegate) => true;
}
