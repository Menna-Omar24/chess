import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/localization/app_string.dart';
import '../../../../core/theme/app_assets.dart';
import '../../../../core/theme/app_color.dart';
import '../../../../core/theme/app_size.dart';

class CustomGoogleAuth extends StatelessWidget {
  final void Function() onTap;

  const CustomGoogleAuth({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap();
      },
      child: Container(
        width: double.infinity,
        height: 50.h,
        decoration: BoxDecoration(
          border: Border.all(
            color: AppColor.primary,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(AppAssets.superGoogle),
            const SizedBox(width: 10),
            Text(
              AppString.loginWithGoogle,
              style: TextStyle(
                color: AppColor.primary,
                fontSize: AppSize.sizeBox20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
