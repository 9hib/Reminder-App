import 'package:flutter/material.dart';
import 'package:reminder_app/features/reminder/data/models/reminder_model.dart';
import 'package:reminder_app/features/reminder/presentation/views/widgets/reminder_item.dart';

class CustomReminderListView extends StatelessWidget {
  const CustomReminderListView({super.key, required this.reminders});
  final List<ReminderModel> reminders;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: reminders.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
          child: ReminderItem(reminder: reminders[index]),
        );
      },
    );
  }
}
