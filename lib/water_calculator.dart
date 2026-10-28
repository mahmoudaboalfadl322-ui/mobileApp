double calculateWaterLitres({
  required int weightKg,
  required double activityHours,
}) {
  int baseMl = weightKg * 35;
  int activityMl = (activityHours * 250).round();
  int totalMl = baseMl + activityMl;
  return totalMl / 1000;
}
