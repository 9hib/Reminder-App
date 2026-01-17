import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:reminder_app/core/utils/app_routes.dart';
import 'package:reminder_app/features/reminder/data/models/reminder_model.dart';

class ReminderItem extends StatelessWidget {
  const ReminderItem({super.key, required this.reminder});
  final ReminderModel reminder;
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 16 / 5,
      child: GestureDetector(
        onTap: () {
          GoRouter.of(context).push(AppRoutes.updateReminder, extra: reminder);
        },
        child: Card(
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: ListTile(
            contentPadding: const EdgeInsets.all(12),
            leading: Checkbox(value: reminder.isCompleted, onChanged: (_) {}),
            title: Text(
              reminder.title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                decoration: reminder.isCompleted
                    ? TextDecoration.lineThrough
                    : null,
              ),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 4),
                Text(
                  reminder.description,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 6),
                Text(
                  _formatDate(reminder.dateTime),
                  style: TextStyle(fontSize: 12, color: Colors.grey.shade400),
                ),
              ],
            ),
            trailing: IconButton(
              icon: const Icon(Icons.delete_outline),
              onPressed: () {},
            ),
          ),
        ),
      ),
    );
  }

  String _formatDate(DateTime date) {
    return '${date.day}/${date.month}/${date.year}';
  }
}
