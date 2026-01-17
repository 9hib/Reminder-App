import 'package:flutter/widgets.dart';

class ReminderViewFailureBody extends StatelessWidget {
  const ReminderViewFailureBody({super.key, required this.errorMessage});
  final String errorMessage;
  @override
  Widget build(BuildContext context) {
    return  Text(
      errorMessage
    );
  }
}