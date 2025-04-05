import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'features/auth/view/forget_password_view.dart';
import 'features/auth/view/login_view.dart';
import 'features/auth/view/register_view.dart';
import 'features/chess_board/game_board.dart';
import 'features/home/view/home_screen.dart';
import 'features/on_boarding/view/on_boarding_view.dart';
import 'features/on_boarding/view/start_onboarding_view.dart';
import 'features/splash/splash_view.dart';

void main() {
  runApp(const SmartChess());
}

class SmartChess extends StatelessWidget {
  const SmartChess({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(391, 840),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          SplashView.routeName: (context) => const SplashView(),
          StartOnboardingView.routeName: (context) =>
              const StartOnboardingView(),
          OnboardingScreen.routeName: (context) => OnboardingScreen(),
          HomeScreen.routeName: (context) => const HomeScreen(),
          LoginView.routeName: (context) => const LoginView(),
          RegisterView.routeName: (context) => const RegisterView(),
          ForgetPasswordView.routeName: (context) =>
              const ForgetPasswordView(),
          GameBoard.routeName: (context) => const GameBoard(),
        },
        initialRoute: SplashView.routeName,
      ),
    );
  }
}
