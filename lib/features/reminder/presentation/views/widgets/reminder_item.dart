import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:reminder_app/core/utils/app_routes.dart';
import 'package:reminder_app/features/reminder/data/models/reminder_model.dart';
import 'package:reminder_app/features/reminder/presentation/cubit/reminder_cubit/reminder_cubit.dart';

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
            leading: Checkbox(value: reminder.isCompleted, onChanged: (value) {
              BlocProvider.of<ReminderCubit>(context).toggleReminder(reminder);
            }),
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
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: const Text("Delete Reminder"),
                      content: const Text(
                        "Are you sure you want to delete this reminder?",
                      ),
                      actions: [
                        TextButton(
                          onPressed: () => {context.pop()},
                          child: const Text("Cancel"),
                        ),
                        TextButton(
                          onPressed: () => {
                            BlocProvider.of<ReminderCubit>(
                              context,
                            ).deleteReminder(reminder),
                            context.pop(),
                          },
                          child: const Text("Delete"),
                        ),
                      ],
                    );
                  },
                );
              },
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
