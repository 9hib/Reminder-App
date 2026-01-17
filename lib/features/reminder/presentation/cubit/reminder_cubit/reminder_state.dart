part of 'reminder_cubit.dart';

sealed class ReminderState extends Equatable {
  const ReminderState();

  @override
  List<Object> get props => [];
}

final class ReminderInitial extends ReminderState {}
final class ReminderLoading extends ReminderState {}
final class ReminderLoaded extends ReminderState {
  final List<ReminderModel> reminders;
  const ReminderLoaded(this.reminders);
}

final class ReminderError extends ReminderState {
  final String message;
  const ReminderError(this.message);
}