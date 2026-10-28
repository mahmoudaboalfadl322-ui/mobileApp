import 'package:flutter/material.dart';
import '../utils/constants.dart';
import '../widgets/bottom_button.dart';

class ResultScreen extends StatelessWidget {
  final double litres;
  final int weight;
  final int age;
  final double activityHours;
  final String gender;

  const ResultScreen({
    super.key,
    required this.litres,
    required this.weight,
    required this.age,
    required this.activityHours,
    required this.gender,
  });

  String getGuidanceText() {
    if (litres < 2.0) {
      return 'تقدير منخفض نسبياً ضمن هذه المعادلة التعليمية. يمكنك توزيع شرب الماء على مدار اليوم.\n\n(Spread your drinking over the day. Needs vary.)';
    } else if (litres <= 3.0) {
      return 'تقدير متوسط ضمن هذه المعادلة التعليمية. حاول توزيع الشرب على فترات خلال اليوم.\n\n(Spread your drinking over the day. Needs vary.)';
    } else {
      return 'تقدير مرتفع نسبياً بسبب الوزن أو ساعات النشاط. الاحتياج الفعلي يختلف من شخص لآخر، ويمكنك استشارة مختص عند الحاجة.';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBgColor,
      appBar: AppBar(
        backgroundColor: kBgColor,
        title: const Text(
          'Your Daily Water Intake',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(color: kAccentColor),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(24.0),
                      decoration: BoxDecoration(
                        color: kActiveCardColor,
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      child: Column(
                        children: [
                          const Icon(
                            Icons.water_drop,
                            size: 48,
                            color: kAccentColor,
                          ),
                          const SizedBox(height: 12),
                          Text(
                            '${litres.toStringAsFixed(2)} L / Day',
                            style: const TextStyle(
                              fontSize: 38,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 12),
                          Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: kInactiveCardColor,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: const Column(
                              children: [
                                Text(
                                  'Estimated value (educational formula)',
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold,
                                    color: kTextColor,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                SizedBox(height: 4),
                                Text(
                                  'Educational estimate only — not medical advice',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: kTextColor,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 16),
                          Text(
                            getGuidanceText(),
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.white70,
                              height: 1.4,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                        color: kInactiveCardColor,
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'INPUT SUMMARY',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: kTextColor,
                            ),
                          ),
                          const Divider(color: Colors.white24, height: 20),
                          _buildSummaryItem('Gender', gender),
                          _buildSummaryItem('Weight', '$weight kg'),
                          _buildSummaryItem('Age', '$age years'),
                          _buildSummaryItem('Activity', '${activityHours.toInt()} h'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            BottomButton(
              title: 'Re-calculate',
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSummaryItem(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(color: kTextColor, fontSize: 14)),
          Text(value, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 15)),
        ],
      ),
    );
  }
}
