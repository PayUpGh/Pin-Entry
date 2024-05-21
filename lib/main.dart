import 'package:flutter/material.dart';
import 'package:pin_entry/widget/pin_entry.dart';

void main() {
  runApp(const PinEntryScreen());
}

class PinEntryScreen extends StatelessWidget {
  const PinEntryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: PinEntryWidget(),
        
      ),
    );
  }
}

