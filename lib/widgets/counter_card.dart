import 'package:flutter/material.dart';
import '../utils/constants.dart';

class CounterCard extends StatelessWidget {
  final String title;
  final String unit;
  final int value;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;

  const CounterCard({
    super.key,
    required this.title,
    required this.unit,
    required this.value,
    required this.onIncrement,
    required this.onDecrement,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        decoration: BoxDecoration(
          color: kActiveCardColor,
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Column(
          children: [
            Text(
              '$title ($unit)',
              style: const TextStyle(color: kTextColor, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            Text(
              '$value',
              style: const TextStyle(fontSize: 36, fontWeight: FontWeight.bold, color: Colors.white),
            ),
            const SizedBox(height: 6),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RawMaterialButton(
                  onPressed: onDecrement,
                  elevation: 0,
                  constraints: const BoxConstraints.tightFor(width: 44, height: 44),
                  shape: const CircleBorder(),
                  fillColor: const Color(0xFF4C4F5E),
                  child: const Icon(Icons.remove, color: Colors.white, size: 22),
                ),
                const SizedBox(width: 12),
                RawMaterialButton(
                  onPressed: onIncrement,
                  elevation: 0,
                  constraints: const BoxConstraints.tightFor(width: 44, height: 44),
                  shape: const CircleBorder(),
                  fillColor: const Color(0xFF4C4F5E),
                  child: const Icon(Icons.add, color: Colors.white, size: 22),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
