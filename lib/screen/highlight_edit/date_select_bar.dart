import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:highlight_flutter/screen/highlight_detail/date_bar.dart';
import 'package:highlight_flutter/screen/highlight_edit/state/selected_date_provider.dart';

class DateSelectBar extends ConsumerWidget {
  const DateSelectBar({super.key});

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
        child: DateBar(date: date),
      ),
    );
  }
}
