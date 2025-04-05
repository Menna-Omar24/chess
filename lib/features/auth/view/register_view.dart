import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:next_move_chess/features/auth/view/widget/custom_elevated_button.dart';
import 'package:next_move_chess/features/auth/view/widget/custom_text_form_field.dart';

import '../../../core/localization/app_string.dart';
import '../../../core/theme/app_assets.dart';
import '../../../core/theme/app_color.dart';
import '../../../core/theme/app_size.dart';

class RegisterView extends StatelessWidget {
  static const String routeName = 'register';

  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          AppString.register,
          style: TextStyle(
            fontFamily: 'JockeyOne',
            fontWeight: FontWeight.bold,
            fontSize: AppFontSize.appTitle34,
          ),
        ),
      ),
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
              const CustomTextFormField(
                labelText: 'Name',
                prefixIcon: Icons.person,
              ),
              SizedBox(
                height: AppSize.sizeBox16,
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
              const CustomTextFormField(
                labelText: 'Confirm Password',
                prefixIcon: Icons.lock,
                suffixIcon: true,
                obscureText: true,
              ),
              SizedBox(
                height: AppSize.sizeBox16,
              ),
              CustomElevatedButton(
                onPressed: () {},
                buttonText: AppString.createAccount,
              ),
              SizedBox(
                height: AppSize.sizeBox24,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    AppString.alreadyHaveAccount,
                    style: TextStyle(
                      fontSize: AppFontSize.bodyStyle16,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed('login');
                    },
                    child: Text(
                      AppString.login,
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
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
