import 'package:go_router/go_router.dart';
import 'package:reminder_app/features/reminder/presentation/views/reminder_view.dart';
import 'package:reminder_app/features/splash/presentation/views/splash_view.dart';

class AppRoutes {
  static const String splash = '/';
  static const String reminder = '/reminder';
static  final  router = GoRouter(
    routes: [
      GoRoute(path: splash, builder: (context, state) => const SplashView()),
      GoRoute(
        path: reminder,
        builder: (context, state) => const ReminderView(),
      ),
    ],
  );
}
