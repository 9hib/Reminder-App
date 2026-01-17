import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:reminder_app/core/utils/app_routes.dart';
import 'package:reminder_app/core/utils/dependecy_injection.dart';
import 'package:reminder_app/core/utils/notification_service.dart';
import 'package:reminder_app/features/reminder/data/models/reminder_model.dart';
import 'package:reminder_app/features/reminder/data/repo/reminder_repo.dart';
import 'package:reminder_app/features/reminder/presentation/cubit/reminder_cubit/reminder_cubit.dart';

import 'dart:io' show Platform;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  Hive.registerAdapter(ReminderModelAdapter());
  await Hive.openBox<ReminderModel>('reminderBox');

  if (Platform.isAndroid || Platform.isIOS) {
    await NotificationService.init();
  }

  setupLocator();

  runApp(const ReminderApp());
}


class ReminderApp extends StatelessWidget {
  const ReminderApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ReminderCubit(getIt.get<ReminderRepo>())..getAllReminders(),
      child: MaterialApp.router(
        routerConfig: AppRoutes.router,
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(scaffoldBackgroundColor: Colors.black),
      ),
    );
  }
}
