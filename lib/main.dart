import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'features/chess_board/game_board.dart';
import 'features/home/view/home_screen.dart';
import 'features/on_boarding/view/on_boarding_view.dart';
import 'features/on_boarding/view/start_onboarding_view.dart';

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
          StartOnboardingView.routeName: (context) =>
              const StartOnboardingView(),
          GameBoard.routeName: (context) => const GameBoard(),
          OnboardingScreen.routeName: (context) => OnboardingScreen(),
          HomeScreen.routeName: (context) => const HomeScreen(),
        },
        initialRoute: StartOnboardingView.routeName,
      ),
    );
  }
}
