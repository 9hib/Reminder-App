import 'package:flutter/material.dart';

class ReminderViewLoadingBody extends StatelessWidget {
  const ReminderViewLoadingBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: CircularProgressIndicator());
  }
}
