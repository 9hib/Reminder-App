import 'package:flutter/material.dart';
import 'package:reminder_app/features/reminder/presentation/views/widgets/reminder_view_body.dart';

class ReminderView extends StatelessWidget {
  const ReminderView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: ReminderViewBody(),
      ),
    );
  }
}