import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:highlight_flutter/screen/highlight_edit/state/selected_date_provider.dart';
import 'package:intl/intl.dart';

class DateSelectBar extends ConsumerWidget {
  const DateSelectBar({super.key});

  String dateString(DateTime date) => DateFormat('M.d (yyyy)').format(date);

  Future<DateTime?> changeDate(DateTime currentDate, BuildContext context) =>
      showDatePicker(
          context: context,
          firstDate: currentDate.subtract(const Duration(days: 365)),
          lastDate: currentDate.add(const Duration(days: 365)));

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final date = ref.watch(selectedDateProvider);

    return Material(
      child: InkWell(
        borderRadius: BorderRadius.circular(8),
        onTap: () => changeDate(date, context).then((value) {
          if (value == null) return;

          ref.watch(selectedDateProvider.notifier).state = value;
        }),
        child: Padding(
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
        ),
      ),
    );
  }
}
