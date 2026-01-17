import 'package:flutter/material.dart';
import 'package:reminder_app/features/reminder/presentation/views/widgets/add_reminder_body.dart';

class AddReminderView extends StatelessWidget {
  const AddReminderView({super.key});

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        body: AddReminderBody(),
      ),
    );
  }
}