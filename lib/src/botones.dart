import 'package:flutter/material.dart';
import 'dart:math';

class BotonesPage extends StatefulWidget {
  const BotonesPage({super.key});

  @override
  State<BotonesPage> createState() => _BotonesPageState();
}

class _BotonesPageState extends State<BotonesPage>
    with SingleTickerProviderStateMixin {
  int _currentIndex = 0;
  late AnimationController _controller;
  late Animation<double> _animation;
  late Animation<double> _waveAmplitude;


  final Color _green = const Color.fromARGB(255, 0, 150, 0);

  late final List<Widget> _screens;

  _BotonesPageState() {
    _screens = [
      Center(
        child: Text(
          "Bienvenido al Buscador",
          style: TextStyle(
              fontFamily: "BBH_Sans_Bogle",
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: _green),
        ),
      ),
      Center(
        child: Text(
          "Favoritos",
          style: TextStyle(
              fontFamily: "BBH_Sans_Bogle",
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: _green),
        ),
      ),
      Center(
        child: Text(
          "Buscador",
          style: TextStyle(
              fontFamily: "BBH_Sans_Bogle",
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: _green),
        ),
      ),
    ];
  }

  final List<Color> _backgroundColors = [
    Colors.black,
    Colors.black,
    Colors.black,
  ];

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: const Duration(milliseconds: 500));
    _animation = Tween<double>(begin: 0, end: 0).animate(
        CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
    _waveAmplitude = Tween<double>(begin: 0, end: 1).animate(
        CurvedAnimation(parent: _controller, curve: Curves.easeOut));
  }

  void _onButtonPressed(int index) {
    _animation = Tween<double>(
            begin: _currentIndex.toDouble(), end: index.toDouble())
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    _waveAmplitude = Tween<double>(begin: 0, end: 1).animate(
        CurvedAnimation(parent: _controller, curve: Curves.elasticOut));

    _controller.forward(from: 0);
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _backgroundColors[_currentIndex],
      body: Stack(
        children: [
          _screens[_currentIndex],
          Align(
            alignment: Alignment.bottomCenter,
            child: SizedBox(
              height: 80,
              child: AnimatedBuilder(
                animation: _controller,
                builder: (context, child) {
                  return CustomPaint(
                    painter: WavePainter(
                      _animation.value,
                      _waveAmplitude.value,
                      _green,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        IconButton(
                          icon: Icon(
                            Icons.home,
                            size: 36,
                            color: _currentIndex == 0
                                ? Colors.black
                                : Colors.white70,
                          ),
                          onPressed: () => _onButtonPressed(0),
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.favorite,
                            size: 36,
                            color: _currentIndex == 1
                                ? Colors.black
                                : Colors.white70,
                          ),
                          onPressed: () => _onButtonPressed(1),
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.search,
                            size: 36,
                            color: _currentIndex == 2
                                ? Colors.black
                                : Colors.white70,
                          ),
                          onPressed: () => _onButtonPressed(2),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}


class WavePainter extends CustomPainter {
  final double position;
  final double amplitude;
  final Color waveColor;

  WavePainter(this.position, this.amplitude, this.waveColor);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = waveColor
      ..style = PaintingStyle.fill;

    final width = size.width / 3;
    final centerX = width * (position + 0.5);
    final waveHeight = 30.0 * amplitude;

    final path = Path();
    path.moveTo(0, 0);
    path.lineTo(centerX - width / 2, 0);

    path.quadraticBezierTo(centerX - width / 4, -waveHeight, centerX, 0);
    path.quadraticBezierTo(centerX + width / 4, waveHeight, centerX + width / 2, 0);

    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant WavePainter oldDelegate) =>
      oldDelegate.position != position ||
      oldDelegate.amplitude != amplitude ||
      oldDelegate.waveColor != waveColor;
}