import 'package:flutter/material.dart';
import 'package:next_move_chess/features/auth/view/widget/custom_elevated_button.dart';
import 'package:next_move_chess/features/auth/view/widget/custom_text_form_field.dart';

import '../../../core/localization/app_string.dart';
import '../../../core/theme/app_assets.dart';
import '../../../core/theme/app_size.dart';

class ForgetPasswordView extends StatelessWidget {
  static const String routeName = 'forget_password';

  const ForgetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          AppString.forgetPassword,
          style: TextStyle(
            fontFamily: 'JockeyOne',
            fontWeight: FontWeight.bold,
            fontSize: AppFontSize.appTitle34,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(AppAssets.password),
            const CustomTextFormField(
              labelText: 'Email',
              prefixIcon: Icons.email,
            ),
            SizedBox(
              height: AppSize.sizeBox20,
            ),
            CustomElevatedButton(
              buttonText: 'Reset Password',
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
