import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:metornome/widgets/triangle_shape.dart';
import 'package:metornome/providers/providers.dart';

class MainPage extends ConsumerWidget {
  MainPage({super.key, required this.title});

  final String title;

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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '${tempoProv.toInt()}',
            ),
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.blue.withOpacity(.5),
                shape: BoxShape.circle,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: GestureDetector(
                onTap: () => ref.read(playProvider.notifier).state = !playProv,
                child: playProv
                    ? Tooltip(
                        message: "Stop",
                        child: Container(
                          width: 50,
                          height: 50,
                          decoration: const BoxDecoration(
                              color: Colors.blueGrey,
                              shape: BoxShape.rectangle),
                        ),
                      )
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
