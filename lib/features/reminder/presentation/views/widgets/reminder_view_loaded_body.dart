import 'package:flutter/widgets.dart';
import 'package:reminder_app/features/reminder/data/models/reminder_model.dart';
import 'package:reminder_app/features/reminder/presentation/views/widgets/custom_reminder_list_view.dart';

class ReminderViewLoadedBody extends StatelessWidget {
  const ReminderViewLoadedBody({super.key, required this.reminders});
  final List<ReminderModel> reminders;
  @override
  Widget build(BuildContext context) {
    return reminders.isEmpty
        ? const Center(child: Text("You have no reminders"))
        : CustomReminderListView(reminders: reminders);
  }
}
