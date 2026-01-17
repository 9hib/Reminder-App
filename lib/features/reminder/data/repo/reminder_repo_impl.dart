import 'package:hive_flutter/hive_flutter.dart';
import 'package:reminder_app/features/reminder/data/models/reminder_model.dart';
import 'package:reminder_app/features/reminder/data/repo/reminder_repo.dart';

class ReminderRepoImpl implements ReminderRepo{
  final Box<ReminderModel> reminderBox;

  ReminderRepoImpl({required this.reminderBox});
  @override
  Future<void> addReminder(ReminderModel reminder) async{
    await reminderBox.add(reminder);
  }

  @override
  Future<void> deleteReminder(String id)async {
    await reminderBox.delete(id);
  }

  @override
  Future<List<ReminderModel>> getAllReminders() async{
    return  reminderBox.values.toList();
  }

  @override
  Future<void> updateReminder(ReminderModel reminder) {
    return reminderBox.put(reminder.id, reminder);
  }
  
}