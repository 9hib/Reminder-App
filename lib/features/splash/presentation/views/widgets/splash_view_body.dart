import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:reminder_app/core/utils/app_routes.dart';
import 'package:reminder_app/features/splash/presentation/views/widgets/slider_text.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Offset> _animation;
  @override
  void initState() {
    super.initState();
    initAnimation();
    navigateToHomeView();
  }

   @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Icon(Icons.schedule, size: 60),
        SizedBox(height: 4),
        SliderText(animation: _animation),
      ],
    );
  }

  void initAnimation() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    _animation = Tween<Offset>(
      begin: Offset(0, 2),
      end: Offset.zero,
    ).animate(_animationController);
    _animationController.forward();
  }

  void navigateToHomeView() {
    Future.delayed(const Duration(seconds: 3), () {
      // ignore: use_build_context_synchronously
      GoRouter.of(context).push(AppRoutes.reminder);
    });
  }
}
