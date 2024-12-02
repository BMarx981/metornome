import 'package:flutter/material.dart';
import 'dart:async';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  _TempoSquareScreenState createState() => _TempoSquareScreenState();
}

class _TempoSquareScreenState extends State<MainPage> {
  bool _isRed = false;
  late Timer _timer;
  double _tempo = 120.0; // Default tempo in BPM

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void _startTimer() {
    final interval = (60000 / _tempo).round(); // Calculate interval in ms
    _timer = Timer.periodic(Duration(milliseconds: interval), (timer) {
      setState(() {
        _isRed = true;
      });

      // Reset color to blue after 200 ms
      Future.delayed(const Duration(milliseconds: 200), () {
        setState(() {
          _isRed = false;
        });
      });
    });
  }

  void _updateTempo(double newTempo) {
    setState(() {
      _tempo = newTempo;
    });
    _timer.cancel();
    _startTimer(); // Restart timer with the new tempo
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tempo Animation'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: AnimatedContainer(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _isRed ? Colors.red : Colors.transparent,
              ),
              duration: const Duration(milliseconds: 50),
              width: 100,
              height: 100,
            ),
          ),
          const SizedBox(height: 50),
          Text('Tempo: ${_tempo.toStringAsFixed(1)} BPM'),
          Slider(
            min: 40.0,
            max: 200.0,
            value: _tempo,
            divisions: 160,
            label: _tempo.toStringAsFixed(1),
            onChanged: (value) => _updateTempo(value),
          ),
        ],
      ),
    );
  }
}
