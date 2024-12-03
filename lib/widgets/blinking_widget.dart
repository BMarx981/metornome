import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BlinkingContainer extends ConsumerStatefulWidget {
  const BlinkingContainer({super.key});

  @override
  ConsumerState<BlinkingContainer> createState() => _BlinkingContainerState();
}

class _BlinkingContainerState extends ConsumerState<BlinkingContainer> {
  bool _isRed = false;
  late Timer _timer;
  double _tempo = 80.0; // Default tempo in BPM

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
        print("blink");
        _isRed = true;
      });

      // Reset color after 200 ms
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
    return AnimatedContainer(
      duration: const Duration(milliseconds: 700),
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: _isRed ? Colors.red : Colors.transparent,
        ),
        width: 50,
        height: 50,
      ),
    );
  }
}
