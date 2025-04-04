import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:next_move_chess/core/theme/app_assets.dart';
import 'package:next_move_chess/core/theme/app_size.dart';
import 'package:next_move_chess/features/on_boarding/view/widget/default_switch_onboarding.dart';

import '../../../core/localization/app_string.dart';
import '../../../core/theme/app_color.dart';
import 'on_boarding_view.dart';

class StartOnboardingView extends StatelessWidget {
  static const String routeName = 'start_onboarding';

  const StartOnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          AppString.appTitle,
          style: TextStyle(
            fontFamily: 'JockeyOne',
            fontWeight: FontWeight.bold,
            fontSize: AppFontSize.appTitleOnboarding34,
            color: AppColor.primary,
          ),
        ),
      ),
      body: Padding(
        padding:  REdgeInsets.all(16.0),
        child: Column(
          children: [
            Image.asset(
              AppAssets.imageOnBoarding1,
              height: AppSize.imageOnBoarding,
            ),
            SizedBox(
              height: AppSize.sizeBoxOnBoarding28,
            ),
            Text(
              AppString.titleWidgetBoarding1,
              style: TextStyle(
                fontSize: AppFontSize.titleStyleOnboarding20,
                fontWeight: FontWeight.bold,
                color: AppColor.primary,
              ),
            ),
            SizedBox(
              height: AppSize.sizeBoxOnBoarding20,
            ),
            Text(
              textAlign: TextAlign.center,
              AppString.bodyBoarding1,
              style: TextStyle(
                fontSize: AppFontSize.bodyStyleOnboarding16,
              ),
            ),
            SizedBox(
              height: AppSize.sizeBoxOnBoarding28,
            ),
            const DefaultSwitchOnboarding(
              labelSwitch: "Language",
              iconSwitch: Icons.language,
            ),
            const DefaultSwitchOnboarding(
              labelSwitch: "Theme",
              iconSwitch: Icons.brightness_4,
            ),
            SizedBox(
              height: AppSize.sizeBoxOnBoarding28,
            ),
            SizedBox(
              width: double.infinity,
              height: 50.h,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => OnboardingScreen(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColor.primary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.r),
                  ),
                ),
                child: Text(
                  "Let's Start",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: AppFontSize.titleStyleOnboarding20,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
