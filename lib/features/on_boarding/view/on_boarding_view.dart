import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:next_move_chess/core/localization/app_string.dart';
import 'package:next_move_chess/core/theme/app_assets.dart';

import '../../../core/theme/app_color.dart';
import '../../../core/theme/app_size.dart';
import '../../auth/view/login_view.dart';

class OnboardingScreen extends StatelessWidget {
  static const String routeName = 'onboarding';

  OnboardingScreen({super.key});

  final List<PageViewModel> pages = [
    PageViewModel(
      titleWidget: Text(
        AppString.titleWidgetBoarding2,
        style: TextStyle(
            fontSize: AppFontSize.titleStyle20,
            fontWeight: FontWeight.bold,
            color: AppColor.primary),
      ),
      body: AppString.bodyBoarding2,
      image: Center(
        child: Image.asset(AppAssets.imageOnBoarding2,
            height: AppSize.imageOnBoarding),
      ),
      decoration: getPageDecoration(),
    ),
    PageViewModel(
      titleWidget: Text(
        AppString.titleWidgetBoarding3,
        style: TextStyle(
            fontSize: AppFontSize.titleStyle20,
            fontWeight: FontWeight.bold,
            color: AppColor.primary),
      ),
      body: AppString.bodyBoarding3,
      image: Center(
          child: Image.asset(AppAssets.imageOnBoarding3,
              height: AppSize.imageOnBoarding)),
      decoration: getPageDecoration(),
    ),
    PageViewModel(
      titleWidget: Text(
        AppString.titleWidgetBoarding4,
        style: TextStyle(
            fontSize: AppFontSize.titleStyle20,
            fontWeight: FontWeight.bold,
            color: AppColor.primary),
      ),
      body: AppString.bodyBoarding4,
      image: Center(
          child: Image.asset(AppAssets.imageOnBoarding4,
              height: AppSize.imageOnBoarding)),
      decoration: getPageDecoration(),
    ),
  ];

  static PageDecoration getPageDecoration() {
    return PageDecoration(
      titleTextStyle: TextStyle(
          fontSize: AppFontSize.title22, fontWeight: FontWeight.bold),
      bodyTextStyle: TextStyle(fontSize: AppFontSize.bodyStyle16),
      imagePadding: REdgeInsets.all(20),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          AppString.appTitle,
          style: TextStyle(
            fontFamily: 'JockeyOne',
            color: AppColor.primary,
            fontWeight: FontWeight.bold,
            fontSize: AppFontSize.appTitle34,
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 20.h),
          ),
          Expanded(
            child: IntroductionScreen(
              pages: pages,
              showSkipButton: false,
              showBackButton: true,
              next: Container(
                padding: REdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50.r),
                  border: Border.all(
                    width: 2,
                    color: AppColor.primary,
                  ),
                ),
                child: const Icon(Icons.arrow_forward, color: AppColor.primary),
              ),
              back: Container(
                padding: REdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50.r),
                  border: Border.all(
                    width: 2,
                    color: AppColor.primary,
                  ),
                ),
                child: const Icon(Icons.arrow_back, color: AppColor.primary),
              ),
              done: Container(
                padding: REdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50.r),
                  border: Border.all(
                    width: 2,
                    color: AppColor.primary,
                  ),
                ),
                child: const Icon(Icons.arrow_forward, color: AppColor.primary),
              ),
              dotsDecorator: DotsDecorator(
                size: Size(10.sp, 10.sp),
                color: AppColor.black,
                activeSize: Size(22.sp, 10.sp),
                activeColor: AppColor.primary,
                activeShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(25.r))),
              ),
              onDone: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => const LoginView()),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
