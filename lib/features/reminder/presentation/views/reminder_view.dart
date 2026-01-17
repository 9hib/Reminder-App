import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:reminder_app/core/utils/app_routes.dart';
import 'package:reminder_app/features/reminder/presentation/views/widgets/reminder_view_body.dart';

class ReminderView extends StatelessWidget {
  const ReminderView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ReminderViewBody(),
        floatingActionButton: FloatingActionButton(
          shape: const CircleBorder(),
          onPressed: () {
            GoRouter.of(context).push(AppRoutes.addReminder);
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
