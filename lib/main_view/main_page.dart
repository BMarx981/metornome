import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:metornome/widgets/stop_button.dart';
import 'package:metornome/widgets/blinking_widget.dart';
import 'package:metornome/widgets/triangle_shape.dart';
import 'package:metornome/providers/providers.dart';

class MainPage extends ConsumerWidget {
  MainPage({super.key, required this.title});

  final String title;
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tempoProv = ref.watch(tempoProvider);
    final playProv = ref.watch(playProvider);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () => context.push('/settings'),
          )
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: 60,
              child: TextField(
                maxLength: 3,
                textAlign: TextAlign.center,
                controller: controller,
                onEditingComplete: () => ref
                    .read(tempoProvider.notifier)
                    .state = double.parse(controller.text),
                decoration:
                    InputDecoration(hintText: tempoProv.toInt().toString()),
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                playProv
                    ? const BlinkingContainer()
                    : const SizedBox(height: 50, width: 50),
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: GestureDetector(
                    onTap: () =>
                        ref.read(playProvider.notifier).state = !playProv,
                    child: playProv
                        ? const StopAudioButton()
                        : Tooltip(
                            message: "Play",
                            child: Transform.rotate(
                              angle: 1.57,
                              child: CustomPaint(
                                size: const Size(50, 50),
                                painter: TriangleShape(),
                              ),
                            ),
                          ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () =>
                ref.read(tempoProvider.notifier).state = tempoProv + 1,
            tooltip: 'Increase tempo',
            child: const Icon(Icons.add),
          ),
          const SizedBox(height: 8),
          FloatingActionButton(
            onPressed: () =>
                ref.read(tempoProvider.notifier).state = tempoProv - 1,
            tooltip: 'Decrease tempo',
            child: const Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}
