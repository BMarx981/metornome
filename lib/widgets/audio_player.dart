import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class StopAudioButton extends ConsumerStatefulWidget {
  const StopAudioButton({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _StopAudioButtonState();
}

class _StopAudioButtonState extends ConsumerState {
  final AudioPlayer _audioPlayer = AudioPlayer();

  @override
  void initState() {
    super.initState();
    _audioPlayer.setReleaseMode(ReleaseMode.loop); // Loop the sound
  }

  @override
  void dispose() {
    _audioPlayer.dispose(); // Clean up the audio player
    super.dispose();
  }

  void playSound() async {
    await _audioPlayer.play(AssetSource('sounds/tick.mp3'));
  }

  @override
  Widget build(BuildContext context) {
    playSound();
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
