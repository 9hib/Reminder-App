import 'package:hive_flutter/hive_flutter.dart';
import 'package:reminder_app/core/utils/notification_service.dart';
import 'package:reminder_app/features/reminder/data/models/reminder_model.dart';
import 'package:reminder_app/features/reminder/data/repo/reminder_repo.dart';

class ReminderRepoImpl implements ReminderRepo {
  final Box<ReminderModel> reminderBox;

  ReminderRepoImpl({required this.reminderBox});
  @override
  Future<void> addReminder(ReminderModel reminder) async {
    final key = await reminderBox.add(reminder);
    await NotificationService.scheduleNotification(
      id: key,
      title: reminder.title,
      body: reminder.description,
      dateTime: reminder.dateTime,
    );
  }

  @override
  Future<void> deleteReminder(ReminderModel reminder) async {
    final key = reminder.key;
    await reminder.delete(); // احذف من Hive
    if (key != null) {
      await NotificationService.cancel(key);
    }
  }

  @override
  Future<List<ReminderModel>> getAllReminders() async {
    return reminderBox.values.toList();
  }

  @override
  Future<void> updateReminder(
    ReminderModel reminder, {
    String? title,
    String? description,
    bool? isCompleted,
    DateTime? dateTime,
  }) async {
    final key = reminder.key;
    await NotificationService.cancel(key!);

    reminder.title = title ?? reminder.title;
    reminder.description = description ?? reminder.description;
    reminder.isCompleted = isCompleted ?? reminder.isCompleted;
    reminder.dateTime = dateTime ?? reminder.dateTime;
    await reminder.save();

    await NotificationService.scheduleNotification(
      id: key,
      title: reminder.title,
      body: reminder.description,
      dateTime: reminder.dateTime,
    );
  }

  @override
  Future<void> toggleReminder(ReminderModel reminderModel) async {
    reminderModel.isCompleted = !reminderModel.isCompleted;
    await reminderModel.save();
  }
}
