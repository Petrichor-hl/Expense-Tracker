import 'package:flutter/material.dart';

import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widgets/expenses_list/expense_item.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList(
      {super.key, required this.expenses, required this.removeExpense});

  final List<Expense> expenses;
  final void Function(int) removeExpense;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (ctx, index) => Dismissible(
        key: ValueKey(expenses[index]),
        background: Container(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
          decoration: BoxDecoration(
              color: Colors.red, borderRadius: BorderRadius.circular(12)),
        ),
        onDismissed: (direction) {
          removeExpense(index);
        },
        child: ExpenseItem(expenses[index]),
      ),
      itemCount: expenses.length,
    );
  }
}
