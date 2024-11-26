import 'package:flutter/material.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Settings")),
      body: SingleChildScrollView(
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                child: const Text("Appearance",
                    style: TextStyle(color: Colors.blue)),
                onTap: () =>
                    print("Change from light to dark mode/ dark to light."),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
