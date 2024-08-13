import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateBar extends StatelessWidget {
  const DateBar({required this.date, super.key});

  final DateTime date;

  String dateString(DateTime date) => DateFormat('M.d (yyyy)').format(date);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            'asset/icons/calendar.png',
            width: 32,
            height: 32,
          ),
          const SizedBox(width: 16),
          Text(dateString(date)),
        ],
      ),
    );
  }
}
