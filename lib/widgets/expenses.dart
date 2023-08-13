import 'package:expense_tracker/widgets/chart/chart.dart';
import 'package:expense_tracker/widgets/expenses_list/expenses_list.dart';
import 'package:expense_tracker/widgets/new_expense.dart';
import 'package:flutter/material.dart';

import '../models/expense.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registerExpenses = [
    Expense(
      title: 'Flutter',
      amount: 19.99,
      date: DateTime.now(),
      category: Category.work,
    ),
    Expense(
      title: 'Cinema',
      amount: 15.69,
      date: DateTime.now(),
      category: Category.leisure,
    )
  ];

  void _openAddExpenseOverlay() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (ctx) => NewExpense(_addExpense),
    );
  }

  void _addExpense(Expense newExpense) {
    setState(() {
      _registerExpenses.add(newExpense);
    });
  }

  void _removeExpense(int index) {
    final copyExpense = _registerExpenses[index];
    setState(() {
      _registerExpenses.removeAt(index);
    });

    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('Expense deleted'),
        duration: const Duration(milliseconds: 2500),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () => setState(() {
            _registerExpenses.insert(index, copyExpense);
          }),
        ),
      ),
    );
  }

  late Widget mainContent;

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.sizeOf(context).width;

    mainContent = _registerExpenses.isEmpty
        ? const Center(
            child: Text('No expenses found. Start adding some!'),
          )
        : ExpensesList(
            expenses: _registerExpenses, removeExpense: _removeExpense);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Expense Tracker'),
        actions: [
          IconButton(
            onPressed: _openAddExpenseOverlay,
            icon: const Icon(Icons.add),
            color: Colors.white,
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: deviceWidth < 500
            ? Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: Chart(expenses: _registerExpenses),
                  ),
                  Expanded(
                    child: mainContent,
                  )
                ],
              )
            : Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(child: Chart(expenses: _registerExpenses)),
                  const SizedBox(
                    width: 16,
                  ),
                  Expanded(child: mainContent)
                ],
              ),
      ),
    );
  }
}
