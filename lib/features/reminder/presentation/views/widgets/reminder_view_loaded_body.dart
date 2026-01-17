import 'package:flutter/widgets.dart';
import 'package:reminder_app/features/reminder/data/models/reminder_model.dart';

class ReminderViewLoadedBody extends StatelessWidget {
  const ReminderViewLoadedBody({super.key, required this.reminders});
  final List<ReminderModel> reminders;
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
