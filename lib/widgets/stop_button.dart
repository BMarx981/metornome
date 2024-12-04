import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class StopAudioButton extends ConsumerStatefulWidget {
  const StopAudioButton({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _StopAudioButtonState();
}

class _StopAudioButtonState extends ConsumerState {
  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: "Stop",
      child: Container(
        width: 50,
        height: 50,
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 250, 99, 99),
          shape: BoxShape.rectangle,
        ),
      ),
    );
  }
}
