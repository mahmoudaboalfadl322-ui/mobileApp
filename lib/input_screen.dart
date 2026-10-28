import 'package:flutter/material.dart';
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

  static const Color bgColor = Color(0xFF0A0E21);
  static const Color activeCardColor = Color(0xFF1D1E33);
  static const Color inactiveCardColor = Color(0xFF111328);
  static const Color accentColor = Color(0xFF00E5FF);
  static const Color textColor = Color(0xFFB0BEC5);

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
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: bgColor,
        title: const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.water_drop, color: accentColor),
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
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedGender = 'male';
                              });
                            },
                            child: Container(
                              margin: const EdgeInsets.all(4.0),
                              padding: const EdgeInsets.symmetric(vertical: 20.0),
                              decoration: BoxDecoration(
                                color: selectedGender == 'male' ? activeCardColor : inactiveCardColor,
                                borderRadius: BorderRadius.circular(12.0),
                                border: selectedGender == 'male'
                                    ? Border.all(color: accentColor, width: 2.0)
                                    : null,
                              ),
                              child: Column(
                                children: [
                                  Icon(
                                    Icons.male,
                                    size: 60,
                                    color: selectedGender == 'male' ? accentColor : textColor,
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    'MALE',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: selectedGender == 'male' ? Colors.white : textColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedGender = 'female';
                              });
                            },
                            child: Container(
                              margin: const EdgeInsets.all(4.0),
                              padding: const EdgeInsets.symmetric(vertical: 20.0),
                              decoration: BoxDecoration(
                                color: selectedGender == 'female' ? activeCardColor : inactiveCardColor,
                                borderRadius: BorderRadius.circular(12.0),
                                border: selectedGender == 'female'
                                    ? Border.all(color: accentColor, width: 2.0)
                                    : null,
                              ),
                              child: Column(
                                children: [
                                  Icon(
                                    Icons.female,
                                    size: 60,
                                    color: selectedGender == 'female' ? accentColor : textColor,
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    'FEMALE',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: selectedGender == 'female' ? Colors.white : textColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),

                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                        color: activeCardColor,
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: Column(
                        children: [
                          const Text(
                            'ACTIVITY (hours/day)',
                            style: TextStyle(color: textColor, fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            '${activityHours.toInt()} h',
                            style: const TextStyle(fontSize: 36, fontWeight: FontWeight.bold, color: Colors.white),
                          ),
                          SliderTheme(
                            data: SliderTheme.of(context).copyWith(
                              activeTrackColor: accentColor,
                              inactiveTrackColor: Colors.white24,
                              thumbColor: accentColor,
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
                                Text('0 h', style: TextStyle(color: textColor)),
                                Text('8 h', style: TextStyle(color: textColor)),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 12),

                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 16.0),
                            decoration: BoxDecoration(
                              color: activeCardColor,
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            child: Column(
                              children: [
                                const Text(
                                  'WEIGHT (kg)',
                                  style: TextStyle(color: textColor, fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  '$weight',
                                  style: const TextStyle(fontSize: 36, fontWeight: FontWeight.bold, color: Colors.white),
                                ),
                                const SizedBox(height: 6),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    _buildRoundBtn(
                                      icon: Icons.remove,
                                      onPressed: () {
                                        if (weight > 30) {
                                          setState(() => weight--);
                                        }
                                      },
                                    ),
                                    const SizedBox(width: 12),
                                    _buildRoundBtn(
                                      icon: Icons.add,
                                      onPressed: () {
                                        if (weight < 200) {
                                          setState(() => weight++);
                                        }
                                      },
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 16.0),
                            decoration: BoxDecoration(
                              color: activeCardColor,
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            child: Column(
                              children: [
                                const Text(
                                  'AGE (years)',
                                  style: TextStyle(color: textColor, fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  '$age',
                                  style: const TextStyle(fontSize: 36, fontWeight: FontWeight.bold, color: Colors.white),
                                ),
                                const SizedBox(height: 6),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    _buildRoundBtn(
                                      icon: Icons.remove,
                                      onPressed: () {
                                        if (age > 10) {
                                          setState(() => age--);
                                        }
                                      },
                                    ),
                                    const SizedBox(width: 12),
                                    _buildRoundBtn(
                                      icon: Icons.add,
                                      onPressed: () {
                                        if (age < 100) {
                                          setState(() => age++);
                                        }
                                      },
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            Container(
              width: double.infinity,
              height: 55,
              margin: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: accentColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: calculate,
                child: const Text(
                  'Calculate Water Intake',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: bgColor,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRoundBtn({required IconData icon, required VoidCallback onPressed}) {
    return RawMaterialButton(
      onPressed: onPressed,
      elevation: 0,
      constraints: const BoxConstraints.tightFor(width: 44, height: 44),
      shape: const CircleBorder(),
      fillColor: const Color(0xFF4C4F5E),
      child: Icon(icon, color: Colors.white, size: 22),
    );
  }
}
