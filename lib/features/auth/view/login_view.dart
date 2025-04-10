import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:next_move_chess/core/localization/app_string.dart';
import 'package:next_move_chess/features/auth/view/widget/custom_elevated_button.dart';
import 'package:next_move_chess/features/auth/view/widget/custom_google_auth.dart';
import 'package:next_move_chess/features/auth/view/widget/custom_text_form_field.dart';

import '../../../core/theme/app_assets.dart';
import '../../../core/theme/app_color.dart';
import '../../../core/theme/app_size.dart';

class LoginView extends StatelessWidget {
  static const String routeName = 'login';

  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: REdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                AppAssets.logo,
                height: AppSize.imageLogo,
              ),
              Text(
                AppString.appTitle,
                style: TextStyle(
                  fontFamily: 'JockeyOne',
                  color: AppColor.primary,
                  fontWeight: FontWeight.bold,
                  fontSize: AppFontSize.appTitle34,
                ),
              ),
              SizedBox(
                height: AppSize.sizeBox24,
              ),
              const CustomTextFormField(
                labelText: 'Email',
                prefixIcon: Icons.email,
              ),
              SizedBox(
                height: AppSize.sizeBox16,
              ),
              const CustomTextFormField(
                labelText: 'Password',
                prefixIcon: Icons.lock,
                suffixIcon: true,
                obscureText: true,
              ),
              SizedBox(
                height: AppSize.sizeBox16,
              ),
              Align(
                alignment: Alignment.topRight,
                child: TextButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed('forget_password');
                  },
                  child: Text(
                    AppString.forgetPassword,
                    style: TextStyle(
                      color: AppColor.primary,
                      fontSize: AppFontSize.bodyStyle16,
                      fontStyle: FontStyle.italic,
                      decoration: TextDecoration.underline,
                      decorationColor: AppColor.primary,
                      decorationThickness: 1.5,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: AppSize.sizeBox16,
              ),
              CustomElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('gameBoard');
                },
                buttonText: 'Login',
              ),
              SizedBox(
                height: AppSize.sizeBox24,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    AppString.haveAccount,
                    style: TextStyle(
                      fontSize: AppFontSize.bodyStyle16,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed('register');
                    },
                    child: Text(
                      AppString.createAccount,
                      style: TextStyle(
                        color: AppColor.primary,
                        fontSize: AppFontSize.bodyStyle16,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline,
                        decorationColor: AppColor.primary,
                        decorationThickness: 1.5,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  const Expanded(
                    child: Divider(
                      thickness: 1,
                      color: AppColor.primary,
                    ),
                  ),
                  SizedBox(
                    width: AppSize.sizeBox16,
                  ),
                  Text(
                    'Or',
                    style: TextStyle(
                      color: AppColor.primary,
                      fontSize: AppFontSize.bodyStyle16,
                    ),
                  ),
                  SizedBox(
                    width: AppSize.sizeBox16,
                  ),
                  const Expanded(
                    child: Divider(
                      thickness: 1,
                      color: AppColor.primary,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: AppSize.sizeBox24,
              ),
              CustomGoogleAuth(),
            ],
          ),
        ),
      ),
    );
  }
}
