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
          children: [
            _buildLegendItem("1st: 0.0%", Colors.green),
            _buildLegendItem("2nd: 0.0%", Colors.purple),
            _buildLegendItem("3rd: 0.0%", Colors.blue),
            _buildLegendItem("4th: 0.0%", Colors.teal),
          ],
        ),
        SizedBox(height: 10),
        Center(
          child: CircularMultiProgressIndicator(
            values: [0.3, 0.4, 0.3], // Example: 30%, 40%, 30%
            colors: [Colors.blue, Colors.green, Colors.orange],
          ),
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

class CircularMultiProgressIndicator extends StatelessWidget {
  final List<double> values; // Percentages (0.0 to 1.0)
  final List<Color> colors;
  final double strokeWidth;
  final double radius;

  const CircularMultiProgressIndicator({
    super.key,
    required this.values,
    required this.colors,
    this.strokeWidth = 10.0,
    this.radius = 80.0,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(radius * 2, radius * 2),
      painter: CircularMultiPainter(
          values: values, colors: colors, strokeWidth: strokeWidth),
    );
  }
}

class CircularMultiPainter extends CustomPainter {
  final List<double> values;
  final List<Color> colors;
  final double strokeWidth;

  CircularMultiPainter(
      {required this.values, required this.colors, required this.strokeWidth});

  @override
  void paint(Canvas canvas, Size size) {
    double startAngle = -pi / 2; // Start from the top (12 o'clock position)
    double totalProgress = values.reduce((a, b) => a + b); // Sum of percentages

    Paint backgroundPaint = Paint()
      ..color = Colors.grey.shade300
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    canvas.drawCircle(
      Offset(size.width / 2, size.height / 2),
      size.width / 2,
      backgroundPaint,
    );

    for (int i = 0; i < values.length; i++) {
      Paint progressPaint = Paint()
        ..color = colors[i]
        ..style = PaintingStyle.stroke
        ..strokeWidth = strokeWidth
        ..strokeCap = StrokeCap.round;

      double sweepAngle =
          (values[i] / totalProgress) * 2 * pi; // Convert percentage to radians

      canvas.drawArc(
        Rect.fromCircle(
            center: Offset(size.width / 2, size.height / 2),
            radius: size.width / 2),
        startAngle,
        sweepAngle,
        false,
        progressPaint,
      );

      startAngle += sweepAngle; // Move start for the next segment
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
