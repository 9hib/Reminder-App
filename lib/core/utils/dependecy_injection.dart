import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:reminder_app/features/reminder/data/models/reminder_model.dart';
import 'package:reminder_app/features/reminder/data/repo/reminder_repo.dart';
import 'package:reminder_app/features/reminder/data/repo/reminder_repo_impl.dart';

final getIt = GetIt.instance;

void setupLocator() {
  getIt.registerSingleton<Box<ReminderModel>>(Hive.box('reminderBox'));
  getIt.registerSingleton<ReminderRepo>(
    ReminderRepoImpl(reminderBox: getIt.get<Box<ReminderModel>>()),
  );
}
