import 'package:flutter_test/flutter_test.dart';
import 'package:water_hydration/water_calculator.dart';

void main() {
  group('WaterCalculator Calculation Tests', () {
    test('Calculates water for 50kg, 0h activity', () {
      final double result = calculateWaterLitres(
        weightKg: 50,
        activityHours: 0,
      );
      expect(result, closeTo(1.75, 0.001));
    });

    test('Calculates water for 60kg, 8h activity', () {
      final double result = calculateWaterLitres(
        weightKg: 60,
        activityHours: 8,
      );
      expect(result, closeTo(4.10, 0.001));
    });

    test('Calculates water for 70kg, 2h activity', () {
      final double result = calculateWaterLitres(
        weightKg: 70,
        activityHours: 2,
      );
      expect(result, closeTo(2.95, 0.001));
    });

    test('Calculates water for 90kg, 4h activity', () {
      final double result = calculateWaterLitres(
        weightKg: 90,
        activityHours: 4,
      );
      expect(result, closeTo(4.15, 0.001));
    });
  });
}
