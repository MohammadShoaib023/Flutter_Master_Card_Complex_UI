import 'package:flutter/material.dart';

class CustomPageViewOptionTwo extends StatefulWidget {
  const CustomPageViewOptionTwo({super.key});

  @override
  State<CustomPageViewOptionTwo> createState() =>
      _CustomPageViewOptionTwoState();
}

class _CustomPageViewOptionTwoState extends State<CustomPageViewOptionTwo> {
  late PageController _pageController;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentPage);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void onPageChanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('PageView Option Two'),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () {
                  _pageController.animateToPage(0,
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.ease);
                },
                child: Container(
                  width: size.width * .5,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                              width: 3,
                              color: _currentPage == 0
                                  ? Colors.blue
                                  : Colors.transparent))),
                  child: const Center(
                    child: Text(
                      'My Order',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  _pageController.animateToPage(1,
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.ease);
                },
                child: Container(
                  width: size.width * .5,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        width: 3,
                        color: _currentPage == 1
                            ? Colors.blue
                            : Colors.transparent,
                      ),
                    ),
                  ),
                  child: const Center(
                    child: Text(
                      'MY Booking',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: PageView(
              controller: _pageController,
              onPageChanged: onPageChanged,
              children: [
                Container(
                  color: Colors.green,
                  child: const Center(
                    child: Center(
                      child: Text(
                        'My Order',
                        style: TextStyle(fontSize: 24, color: Colors.white),
                      ),
                    ),
                  ),
                ),
                Container(
                  color: Colors.green,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(16)),
                            border: Border.all(color: Colors.white),
                            color: Colors.white.withOpacity(0.5),
                          ),
                          height: 150,
                          width: size.width * 0.9,
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                _buildColumn(),
                                _buildDashedLine(),
                                _buildColumn(),
                                _buildDashedLine(),
                                _buildColumn(),
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildColumn() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Reviwe"),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Container(
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(30),
                ),
                color: Colors.white),
            width: 30,
            height: 30,
            child: const Center(
              child: Icon(
                Icons.more_horiz_outlined,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDashedLine() {
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: SizedBox(
        height: 30,
        width: 75, // Adjust the width of the dashed line
        child: CustomPaint(
          painter: DashedLinePainter(),
        ),
      ),
    );
  }
}

class DashedLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = Colors.black
      ..strokeWidth = 2
      ..strokeCap = StrokeCap.round;

    const double dashWidth = 5;
    const double dashSpace = 5;

    double startX = 0;
    while (startX < size.width) {
      canvas.drawLine(
        Offset(startX, size.height / 2),
        Offset(startX + dashWidth, size.height / 2),
        paint,
      );
      startX += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
