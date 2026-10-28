import 'package:flutter/material.dart';
import 'main.dart';

class GenderCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const GenderCard({
    super.key,
    required this.icon,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          margin: const EdgeInsets.all(4.0),
          padding: const EdgeInsets.symmetric(vertical: 20.0),
          decoration: BoxDecoration(
            color: isSelected ? kActiveCardColor : kInactiveCardColor,
            borderRadius: BorderRadius.circular(12.0),
            border: isSelected
                ? Border.all(color: kAccentColor, width: 2.0)
                : null,
          ),
          child: Column(
            children: [
              Icon(
                icon,
                size: 60,
                color: isSelected ? kAccentColor : kTextColor,
              ),
              const SizedBox(height: 8),
              Text(
                label,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: isSelected ? Colors.white : kTextColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
