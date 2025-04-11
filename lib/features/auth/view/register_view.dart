import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:next_move_chess/features/auth/view/widget/custom_elevated_button.dart';
import 'package:next_move_chess/features/auth/view/widget/custom_text_form_field.dart';

import '../../../core/localization/app_string.dart';
import '../../../core/theme/app_assets.dart';
import '../../../core/theme/app_color.dart';
import '../../../core/theme/app_size.dart';

class RegisterView extends StatefulWidget {
  static const String routeName = 'register';

  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  TextEditingController emailAddress = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  TextEditingController name = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

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
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
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
                  CustomTextFormField(
                    validator: (value) {
                      if (value!.isEmpty || value.length < 3) {
                        return value.isEmpty
                            ? AppString.empty
                            : AppString.desName;
                      }
                    },
                    controller: name,
                    labelText: AppString.labelName,
                    prefixIcon: Icons.person,
                  ),
                  SizedBox(
                    height: AppSize.sizeBox16,
                  ),
                  CustomTextFormField(
                    validator: (value) {
                      if (value!.isEmpty || !value.contains('@')) {
                        return value.isEmpty
                            ? AppString.empty
                            : AppString.invalidEmail;
                      }
                    },
                    controller: emailAddress,
                    labelText: AppString.labelEmail,
                    prefixIcon: Icons.email,
                  ),
                  SizedBox(
                    height: AppSize.sizeBox16,
                  ),
                  CustomTextFormField(
                    validator: (value) {
                      if (value!.isEmpty || value.length < 6) {
                        return value.isEmpty
                            ? AppString.empty
                            : AppString.desPasswordLeast;
                      }
                    },
                    controller: password,
                    labelText: AppString.labelPassword,
                    prefixIcon: Icons.lock,
                    suffixIcon: true,
                    obscureText: true,
                  ),
                  SizedBox(
                    height: AppSize.sizeBox16,
                  ),
                  CustomTextFormField(
                    validator: (value) {
                      if (value!.isEmpty || value != password.text) {
                        return value.isEmpty
                            ? AppString.empty
                            : AppString.passwordsDoNotMatch;
                      }
                    },
                    controller: confirmPassword,
                    labelText: AppString.confirmPassword,
                    prefixIcon: Icons.lock,
                    suffixIcon: true,
                    obscureText: true,
                  ),
                  SizedBox(
                    height: AppSize.sizeBox16,
                  ),
                  CustomElevatedButton(
                    onPressed: () async {
                      if (formKey.currentState!.validate()) {
                        try {
                          final credential = await FirebaseAuth.instance
                              .createUserWithEmailAndPassword(
                            email: emailAddress.text,
                            password: password.text,
                          );
                          FirebaseAuth.instance.currentUser!
                              .sendEmailVerification();
                          Navigator.of(context).pushReplacementNamed('login');
                        } on FirebaseAuthException catch (e) {
                          if (e.code == AppString.weakPassword) {
                            print(AppString.weakPassword);
                            AwesomeDialog(
                              context: context,
                              dialogType: DialogType.error,
                              animType: AnimType.rightSlide,
                              title: AppString.error,
                              desc: AppString.desWeakPassword,
                            ).show();
                          } else if (e.code == AppString.emailAlreadyInUse) {
                            print(AppString.desEmailAlreadyInUse);
                            AwesomeDialog(
                              context: context,
                              dialogType: DialogType.error,
                              animType: AnimType.rightSlide,
                              title: AppString.error,
                              desc:
                                  AppString.desEmailAlreadyInUse,
                            ).show();
                          }
                        } catch (e) {
                          print(e);
                        }
                      }
                    },
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
        ),
      ),
    );
  }
}
