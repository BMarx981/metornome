import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:metornome/providers/providers.dart';

class BlinkingContainer extends ConsumerStatefulWidget {
  const BlinkingContainer({super.key});

  @override
  ConsumerState<BlinkingContainer> createState() => _BlinkingContainerState();
}

class _BlinkingContainerState extends ConsumerState<BlinkingContainer> {
  bool _isRed = false;
  late Timer _timer;
  double _tempo = 80.0; // Default tempo in BPM
  final AudioPlayer _audioPlayer = AudioPlayer();

  @override
  void initState() {
    super.initState();
    _audioPlayer.setSourceAsset('sounds/click.mp3');
    _startTimer();
  }

  @override
  void dispose() {
    _timer.cancel();
    _audioPlayer.dispose();
    super.dispose();
  }

  void _startTimer() {
    final interval = (60000 / _tempo).round() - 100; // Calculate interval in ms
    final startTime = DateTime.now();
    _timer = Timer.periodic(Duration(milliseconds: interval), (timer) async {
      setState(() {
        _isRed = true;
      });
      await _audioPlayer.resume();

      // Reset color after 200 ms
      Future.delayed(const Duration(milliseconds: 50), () {
        setState(() {
          _isRed = false;
        });
      });
      final endTime = DateTime.now();
      print('${endTime.difference(startTime)}');
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
    final t = ref.watch(tempoProvider);
    _updateTempo(t);
    return AnimatedContainer(
      duration: const Duration(milliseconds: 100),
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
