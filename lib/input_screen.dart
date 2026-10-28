import 'package:flutter/material.dart';
import 'bottom_button.dart';
import 'counter_card.dart';
import 'gender_card.dart';
import 'main.dart';
import 'result_screen.dart';
import 'water_calculator.dart';

class InputScreen extends StatefulWidget {
  const InputScreen({super.key});

  @override
  State<InputScreen> createState() => _InputScreenState();
}

class _InputScreenState extends State<InputScreen> {
  String? selectedGender;
  double activityHours = 2.0;
  int weight = 60;
  int age = 20;

  void calculate() {
    if (selectedGender == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('الرجاء اختيار الجنس أولاً (Male / Female)'),
          backgroundColor: Colors.redAccent,
        ),
      );
      return;
    }

    double litres = calculateWaterLitres(
      weightKg: weight,
      activityHours: activityHours,
    );

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ResultScreen(
          litres: litres,
          weight: weight,
          age: age,
          activityHours: activityHours,
          gender: selectedGender == 'male' ? 'Male' : 'Female',
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBgColor,
      appBar: AppBar(
        backgroundColor: kBgColor,
        title: const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.water_drop, color: kAccentColor),
            SizedBox(width: 8),
            Text('Water Tracker', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
          ],
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        GenderCard(
                          icon: Icons.male,
                          label: 'MALE',
                          isSelected: selectedGender == 'male',
                          onTap: () {
                            setState(() {
                              selectedGender = 'male';
                            });
                          },
                        ),
                        const SizedBox(width: 8),
                        GenderCard(
                          icon: Icons.female,
                          label: 'FEMALE',
                          isSelected: selectedGender == 'female',
                          onTap: () {
                            setState(() {
                              selectedGender = 'female';
                            });
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                        color: kActiveCardColor,
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: Column(
                        children: [
                          const Text(
                            'ACTIVITY (hours/day)',
                            style: TextStyle(color: kTextColor, fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            '${activityHours.toInt()} h',
                            style: const TextStyle(fontSize: 36, fontWeight: FontWeight.bold, color: Colors.white),
                          ),
                          SliderTheme(
                            data: SliderTheme.of(context).copyWith(
                              activeTrackColor: kAccentColor,
                              inactiveTrackColor: Colors.white24,
                              thumbColor: kAccentColor,
                              overlayColor: const Color(0x3300E5FF),
                              trackHeight: 4.0,
                            ),
                            child: Slider(
                              value: activityHours,
                              min: 0,
                              max: 8,
                              divisions: 8,
                              onChanged: (val) {
                                setState(() {
                                  activityHours = val;
                                });
                              },
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('0 h', style: TextStyle(color: kTextColor)),
                                Text('8 h', style: TextStyle(color: kTextColor)),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        CounterCard(
                          title: 'WEIGHT',
                          unit: 'kg',
                          value: weight,
                          onIncrement: () {
                            if (weight < 200) {
                              setState(() => weight++);
                            }
                          },
                          onDecrement: () {
                            if (weight > 30) {
                              setState(() => weight--);
                            }
                          },
                        ),
                        const SizedBox(width: 8),
                        CounterCard(
                          title: 'AGE',
                          unit: 'years',
                          value: age,
                          onIncrement: () {
                            if (age < 100) {
                              setState(() => age++);
                            }
                          },
                          onDecrement: () {
                            if (age > 10) {
                              setState(() => age--);
                            }
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            BottomButton(
              title: 'Calculate Water Intake',
              onTap: calculate,
            ),
          ],
        ),
      ),
    );
  }
}
