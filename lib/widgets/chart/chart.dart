import 'package:flutter/material.dart';

import 'package:expense_tracker/widgets/chart/chart_bar.dart';
import 'package:expense_tracker/models/expense.dart';

class Chart extends StatelessWidget {
  const Chart({super.key, required this.expenses});

  final List<Expense> expenses;

  List<ExpenseBucket> get buckets {
    return [
      ...Category.values
          .map((category) => ExpenseBucket.forCategory(expenses, category))
    ];
  }

  double get maxBucketTotalExpense {
    double max = 0;

    for (final bucket in buckets) {
      if (bucket.totalExpenses > max) {
        max = bucket.totalExpenses;
      }
    }

    return max;
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode =
        MediaQuery.of(context).platformBrightness == Brightness.dark;

    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 16,
        horizontal: 8,
      ),
      height: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        gradient: LinearGradient(
          colors: [
            Theme.of(context).colorScheme.primary.withOpacity(0.4),
            Theme.of(context).colorScheme.primary.withOpacity(0.05)
          ],
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
        ),
      ),
      child: Row(
        children: [
          for (final bucket in buckets) // alternative to map()
            Expanded(
              child: ChartBar(
                fill: bucket.totalExpenses == 0
                    ? 0
                    : bucket.totalExpenses / maxBucketTotalExpense,
                category: bucket.category,
                isDarkMode: isDarkMode,
              ),
            )
        ],
      ),
    );
  }
}
