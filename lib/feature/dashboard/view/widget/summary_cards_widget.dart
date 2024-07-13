import 'package:doorcareadmin/core/theme/color/app_color.dart';
import 'package:flutter/material.dart';

class SummaryCard extends StatelessWidget {
  final String title;
  final String amount;
  final String percentage;
  final Color color;

  const SummaryCard(this.title, this.amount, this.percentage, this.color,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: AppColor.background,
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(
          width: 2,
          color: AppColor.toneThree.withOpacity(0.3),
        ),
        boxShadow: [
          BoxShadow(
            color: AppColor.toneThree.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 10,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            amount,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            percentage,
            style: TextStyle(
              fontSize: 16,
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}
