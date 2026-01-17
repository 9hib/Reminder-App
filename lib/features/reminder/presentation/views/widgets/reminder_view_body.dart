import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reminder_app/features/reminder/data/models/reminder_model.dart';
import 'package:reminder_app/features/reminder/presentation/cubit/reminder_cubit/reminder_cubit.dart';
import 'package:reminder_app/features/reminder/presentation/views/widgets/custom_reminder_list_view.dart';
import 'package:reminder_app/features/reminder/presentation/views/widgets/reminder_item.dart';

class ReminderViewBody extends StatelessWidget {
  const ReminderViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReminderCubit, ReminderState>(
      builder: (BuildContext context, ReminderState state) {
        return CustomReminderListView(
          reminders: [
            ReminderModel(
              title: "title",
              description: "description",
              dateTime: DateTime.now(),
            ),
            ReminderModel(
              title: "title",
              description: "description",
              dateTime: DateTime.now(),
            ),
            ReminderModel(
              title: "title",
              description: "description",
              dateTime: DateTime.now(),
            ),
          ],
        );
      },
    );
  }
}
