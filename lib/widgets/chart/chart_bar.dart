import 'package:expense_tracker/models/expense.dart';
import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  const ChartBar({
    super.key,
    required this.fill,
    required this.category,
    required this.isDarkMode,
  });

  final double fill;
  final Category category;
  final bool isDarkMode;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: FractionallySizedBox(
            alignment: Alignment.bottomCenter,
            heightFactor: fill,
            widthFactor: 0.7,
            child: DecoratedBox(
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(8)),
                color: isDarkMode
                    ? Theme.of(context).colorScheme.secondary
                    : Theme.of(context).colorScheme.primary.withOpacity(0.7),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Icon(
          categoryIcons[category],
          color: isDarkMode
              ? Theme.of(context).colorScheme.secondary
              : Theme.of(context).colorScheme.primary.withOpacity(0.7),
        )
      ],
    );
  }
}
