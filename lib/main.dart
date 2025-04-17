import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en'), Locale('ar')],
      path: 'assets/translations',
      fallbackLocale: const Locale('en'),
      child: const SmartChess(),
    )
  );
}

class SmartChess extends StatefulWidget {
  const SmartChess({super.key});

  @override
  State<SmartChess> createState() => _SmartChessState();
}

class _SmartChessState extends State<SmartChess> {
  @override
  void initState() {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        print('==========================User is currently signed out!');
      } else {
        print('==========================User is signed in!');
      }
    });
    super.initState();
  }

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
          ForgetPasswordView.routeName: (context) => const ForgetPasswordView(),
          GameBoard.routeName: (context) => const GameBoard(),
        },
        initialRoute: (
          FirebaseAuth.instance.currentUser != null &&
              FirebaseAuth.instance.currentUser!.emailVerified
        )
            ? GameBoard.routeName
            : SplashView.routeName,
      ),
    );
  }
}
