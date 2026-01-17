import 'package:flutter/material.dart';
import 'package:reminder_app/features/reminder/data/models/reminder_model.dart';

class ReminderItem extends StatelessWidget {
  const ReminderItem({super.key, required this.reminder});
  final ReminderModel reminder;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: reminder.isCompleted ? Colors.green : Colors.red,
      ),
      child: Card(
        child: ListTile(
          title: Text(
            reminder.title,
            style: TextStyle(
              decoration: reminder.isCompleted
                  ? TextDecoration.lineThrough
                  : null,
            ),
          ),
          subtitle: Column(
            children: [
              Text(reminder.description),
              Align(
                alignment: Alignment.bottomRight,
                child: Text(reminder.dateTime.toString()),
              ),
            ],
          ),
          trailing: IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () {},
          ),
        ),
      ),
    );
  }
}
