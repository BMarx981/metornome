import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:metornome/providers/providers.dart';

class BlinkingContainer extends ConsumerStatefulWidget {
  const BlinkingContainer({super.key});

  @override
  ConsumerState<BlinkingContainer> createState() => _BlinkingContainerState();
}

class _BlinkingContainerState extends ConsumerState<BlinkingContainer> {
  Color _currentColor = Colors.blue;
  double _currentSize = 50;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
  }

  void _startBlinking() {
    final tempo = ref.watch(tempoProvider);
    print(tempo);
    final millisecondsPerBlink = 60000 / tempo;
    _timer = Timer.periodic(
        Duration(milliseconds: millisecondsPerBlink.round()), (timer) {
      // print(millisecondsPerBlink);
      setState(() {
        _currentColor = _currentColor == Colors.blue ? Colors.red : Colors.blue;
        _currentSize = Colors.blue == _currentColor ? 0 : 50;
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _startBlinking();
    return Stack(
      children: [
        AnimatedContainer(
          duration: const Duration(milliseconds: 700),
          child: Container(
            width: _currentSize,
            height: _currentSize,
            color: Colors.red,
          ),
        ),
        Container(
          width: 50,
          height: 50,
          color: _currentColor,
        )
      ],
    );
  }
}
