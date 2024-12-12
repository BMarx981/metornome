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
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2), // Shadow color
              blurRadius: 5, // Blur radius (softness of the shadow)
              offset: const Offset(0, 5), // Offset in X and Y direction
            ),
          ],
          color: const Color.fromARGB(255, 250, 99, 99),
          shape: BoxShape.rectangle,
        ),
      ),
    );
  }
}
