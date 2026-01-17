import 'package:reminder_app/features/reminder/data/models/reminder_model.dart';

abstract class ReminderRepo {
  Future<List<ReminderModel>> getAllReminders();
  Future<void> addReminder(ReminderModel reminder);
  Future<void> updateReminder(ReminderModel reminder);
  Future<void> deleteReminder(String id);
}
